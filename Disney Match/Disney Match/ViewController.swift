//
//  ViewController.swift
//  Disney Match
//
//  Created by TTA Student on 8/26/19.
//  Copyright © 2019 TTA Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstCard: Int = 0
    var secondCard: Int = 0
    var matchesLeft: Int = 8
    
    @IBOutlet weak var flotsamjetsam1: UIButton!
    @IBOutlet weak var flotsamjetsam2: UIButton!
    @IBOutlet weak var genie1: UIButton!
    @IBOutlet weak var genie2: UIButton!
    @IBOutlet weak var mickey1: UIButton!
    @IBOutlet weak var mickey2: UIButton!
    @IBOutlet weak var olaf1: UIButton!
    @IBOutlet weak var olaf2: UIButton!
    @IBOutlet weak var ray1: UIButton!
    @IBOutlet weak var ray2: UIButton!
    @IBOutlet weak var stitch1: UIButton!
    @IBOutlet weak var stitch2: UIButton!
    @IBOutlet weak var thumper1: UIButton!
    @IBOutlet weak var thumper2: UIButton!
    @IBOutlet weak var tigger1: UIButton!
    @IBOutlet weak var tigger2: UIButton!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightWrongLabel: UILabel!
    @IBOutlet weak var matchesLeftLabel: UILabel!
    
    var buttonArray: [UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonArray = [flotsamjetsam1, flotsamjetsam2,
                       genie1, genie2,
                       mickey1, mickey2,
                       olaf1, olaf2,
                       ray1, ray2,
                       stitch1, stitch2,
                       thumper1, thumper2,
                       tigger1, tigger2]
        resetGame()
        
    }
    
    func matchMade() {
        matchesLeft = matchesLeft - 1
        matchesLeftLabel.text = "\(matchesLeft)"
        
        if matchesLeft == 0 {
            label.text = "Ho Ho You Won!"
            matchesLeftLabel.text = ""
        }
        
        rightWrongLabel.text = "You got a Match"
        firstCard = 0
        secondCard = 0
        
    }
    
    func wrongMatch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            
            let firstWrongCard: UIButton = self.buttonArray[self.firstCard-1]
            let secondWrongCard: UIButton = self.buttonArray[self.secondCard-1]
            
            firstWrongCard.setImage(UIImage(named: "disneyCastle"), for: UIControl.State.normal)
            secondWrongCard.setImage(UIImage(named: "disneyCastle"), for: UIControl.State.normal)
            
            self.firstCard = 0
            self.secondCard = 0
            
            for button in self.buttonArray {
                button.isEnabled = true
            }
        })
        
    }
    
    func flipCard(cardNumber: Int) {
        print(matchesLeft)
        switch cardNumber {
        case 1:
            flotsamjetsam1.setImage(UIImage(named: "flotsamjetsam"), for: UIControl.State.normal)
        case 2:
            flotsamjetsam2.setImage(UIImage(named: "flotsamjetsam"), for: UIControl.State.normal)
        case 3:
            genie1.setImage(UIImage(named: "genie"), for: UIControl.State.normal)
        case 4:
            genie2.setImage(UIImage(named: "genie"), for: UIControl.State.normal)
        case 5:
            mickey1.setImage(UIImage(named: "mickey"), for: UIControl.State.normal)
        case 6:
            mickey2.setImage(UIImage(named: "mickey"), for: UIControl.State.normal)
        case 7:
            olaf1.setImage(UIImage(named: "olaf"), for: UIControl.State.normal)
        case 8:
            olaf2.setImage(UIImage(named: "olaf"), for: UIControl.State.normal)
        case 9:
            ray1.setImage(UIImage(named: "ray"), for: UIControl.State.normal)
        case 10:
            ray2.setImage(UIImage(named: "ray"), for: UIControl.State.normal)
        case 11:
            stitch1.setImage(UIImage(named: "stitch"), for: UIControl.State.normal)
        case 12:
            stitch2.setImage(UIImage(named: "stitch"), for: UIControl.State.normal)
        case 13:
            thumper1.setImage(UIImage(named: "thumper"), for: UIControl.State.normal)
        case 14:
            thumper2.setImage(UIImage(named: "thumper"), for: UIControl.State.normal)
        case 15:
            tigger1.setImage(UIImage(named: "tigger"), for: UIControl.State.normal)
        case 16:
            tigger2.setImage(UIImage(named: "tigger"), for: UIControl.State.normal)
        default: break
        }
    }

    func resetGame() {
//        var numberArray: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
        
        label.text = "Matches Left:"
        matchesLeftLabel.text = "8"
        matchesLeft = 8
        rightWrongLabel.text = "Welcome to Disney Match"
        firstCard = 0
        secondCard = 0
        
        for button in buttonArray {
            button.setImage(UIImage(named: "disneyCastle"), for: UIControl.State.normal)
//            button.tag = numberArray.randomElement()!
//            numberArray = numberArray.filter({button.tag})
        }
    }
    
    @IBAction func newGame(_ sender: UIBarButtonItem) {
        resetGame()
    }
    
    @IBAction func checkMatch(_ sender: Any) {
        if firstCard == 0 {
            firstCard = (sender as AnyObject).tag
            flipCard(cardNumber: firstCard)
        } else {
            secondCard = (sender as AnyObject).tag
            flipCard(cardNumber: secondCard)
            if ((firstCard == 1 && secondCard == 2) ||
                (firstCard == 3 && secondCard == 4) ||
                (firstCard == 5 && secondCard == 6) ||
                (firstCard == 7 && secondCard == 8) ||
                (firstCard == 9 && secondCard == 10) ||
                (firstCard == 11 && secondCard == 12) ||
                (firstCard == 13 && secondCard == 14) ||
                (firstCard == 15 && secondCard == 16) ||
                (firstCard == 16 && secondCard == 15) ||
                (firstCard == 14 && secondCard == 13) ||
                (firstCard == 12 && secondCard == 11) ||
                (firstCard == 10 && secondCard == 9) ||
                (firstCard == 8 && secondCard == 7) ||
                (firstCard == 6 && secondCard == 5) ||
                (firstCard == 4 && secondCard == 3) ||
                (firstCard == 2 && secondCard == 1)) {
                    matchMade()
            } else {
                rightWrongLabel.text = "Sorry Try Again"
                for button in buttonArray {
                    button.isEnabled = false
                }
                wrongMatch()
            }
        }
    }
    
}

