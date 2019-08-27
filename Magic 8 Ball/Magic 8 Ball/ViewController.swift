//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by TTA Student on 8/6/19.
//  Copyright © 2019 TTA Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eightBall: UIImageView!
    
    var ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomBallNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RandomShake()
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        RandomShake()
        
    }
    
    func RandomShake() {
        randomBallNumber = Int.random(in: 0 ... 4)
        eightBall.image = UIImage(named: ballArray[randomBallNumber])
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        RandomShake()
    }
    
}

