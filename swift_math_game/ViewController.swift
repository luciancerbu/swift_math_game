//
//  ViewController.swift
//  mathGame
//
//  Created by Lucian Cerbu on 19/03/2020.
//  Copyright © 2020 Lucian Cerbu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOne: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var numberTwo: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var resultUItextField: UITextField!
    
    var auxOne = Int.random(in: 1...199)
    var auxTwo = Int.random(in: 1...199)
    var allOperations : [String] = ["+","-"]
    var auxOperation = Int.random(in: 0...1)
    var auxScore : Int = 0
    var imagesResult = [#imageLiteral(resourceName: "Right.png"),#imageLiteral(resourceName: "Wrong.png")]
    var correctAnswer : Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: "+String(auxScore)
        generateElements()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func buttonNext(_ sender: UIButton) {
        generateElements()
    }
    
    @IBAction func resultOutput(_ sender: UITextField) {
        resultUItextField.isUserInteractionEnabled = false
        print(sender.text ?? 0)
        correctAnswer = false;
        let myResult :Int = Int(sender.text ?? "0") ?? 0
        switch allOperations[auxOperation] {
        case "+":
            //print(myResult == auxOne + auxTwo)
            if (myResult == auxOne + auxTwo)
            {
                correctAnswer = true;
                auxScore+=1
            }
            else
            {
                if (auxScore > 0)  {
                    auxScore -= 1
                    
                }
            }
            break;
        case "-":
            //print(myResult == auxOne - auxTwo)
            if (myResult == auxOne - auxTwo)
            {
                correctAnswer = true;
                auxScore+=1
            }
            else
            {
                if (auxScore > 0)  {
                    auxScore -= 1
                    
                }
            }
            break;
        default:
            print("no operation")
        }
        if (correctAnswer)
        {
            imageResult.image = imagesResult[0]
        }
        else
        {
            imageResult.image = imagesResult[1]
        }
        imageResult.isHidden = false
        scoreLabel.text = "Score: "+String(auxScore)
    }
    
    func generateElements()  {
        
        auxOne = Int.random(in: 1...99)
        auxOperation = Int.random(in: 0...1)
        if (auxOperation == 1)  {
            auxTwo = Int.random(in: 1...auxOne)
        } else {
            auxTwo = Int.random(in: 1...99)
        }
        numberOne.text = String(auxOne)
        operationLabel.text = allOperations[auxOperation]
        numberTwo.text = String(auxTwo)
        imageResult.isHidden = true
        resultUItextField.text=""
        resultUItextField.isUserInteractionEnabled = true
    }
    
    
}

