//
//  ViewController.swift
//  Poke 3D
//
//  Created by TTA Student on 8/22/19.
//  Copyright © 2019 TTA Student. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Pokemon Cards", bundle: Bundle.main) {
            configuration.detectionImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 2
            
            print("Images Successfully Added")
        }
            
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(
                width: imageAnchor.referenceImage.physicalSize.width,
                height: imageAnchor.referenceImage.physicalSize.height
            )
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi/2
            
            node.addChildNode(planeNode)
            
            if imageAnchor.referenceImage.name == "Eevee-Card" {
                if let pokeScene = SCNScene(named: "art.scnassets/Eevee_ColladaMax.scn") {
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            if imageAnchor.referenceImage.name == "Oddish-Card" {
                if let pokeScene = SCNScene(named: "art.scnassets/oddish.scn") {
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
        }
        
        return node
    }

}
