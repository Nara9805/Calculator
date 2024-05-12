//
//  ViewController.swift
//  calculator
//
//  Created by Smart Castle M1A2009 on 14.10.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var currentValueLabel: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var devineButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    
    var currentValue = 0
    var userIsInAProgress: Bool = false
    var userIsActivateActions: Bool = false
    var oldValue: Double = 0.0
    var operatorValue: String = ""
    //var operatorValue = ""
    
    @IBAction func calculatorButtonPressed(_ sender: UIButton) {
        guard 
            let buttonText = sender.titleLabel?.text,
            let displayedText = currentValueLabel.text
        else { return }
    
        switch buttonText {
        case "AC":
            print("case: AC")
            userIsInAProgress = false
            currentValueLabel.text = "0"
            //            currentValue = 0
        case "+/-":
            print("case: +/-")
            currentValueLabel.text = String(Int(displayedText)! * -1)
            //            currentValue = currentValue * -1
        case "%":
            print("case: %")
            userIsInAProgress = false
            let percentValue = Double(displayedText)! / 100.0
            currentValueLabel.text = String(percentValue)
            //            currentValue = currentValue % Int(text)!
        case "/":
            print("case: /")
            userIsInAProgress = false
            oldValue = Double(displayedText)!
            operatorValue = buttonText
            //            currentValue = currentValue / Int(text)!
        case "*":
            print("case: *")
            userIsInAProgress = false
            oldValue = Double(displayedText)!
            operatorValue = buttonText
            //           currentValue = currentValue * Int(text)!
        case "-":
            print("case: -")
            userIsInAProgress = false
            oldValue = Double(displayedText)!
            operatorValue = buttonText
            //            currentValue = currentValue - Int(text)!
        case "+":
            print("case: +")
            userIsInAProgress = false
            oldValue = Double(displayedText)!
            operatorValue = buttonText
            //            currentValue = currentValue + Int(text)!
        case "=":
            print("case: =")
            var newValue = 0.0
            if oldValue != 0,
                operatorValue != "" {
                
                switch operatorValue {
                case "/":
                    newValue = oldValue / Double(displayedText)!
                
                case "*":
                    newValue = oldValue * Double(displayedText)!
                
                case "-":
                    newValue = oldValue - Double(displayedText)!
                    
                case "+":
                    newValue = oldValue + Double(displayedText)!
                default: break
                
                }
                }
//                if operatorValue == "/" {
//                    newValue = oldValue / Double(displayedText)!
//                } else if operatorValue == "*" {
//                    newValue = oldValue * Double(displayedText)!
//                } else if operatorValue == "-" {
//                    newValue = oldValue - Double(displayedText)!
//                } else if operatorValue == "+" {
//                    newValue = oldValue + Double(displayedText)!
//                }
                
                currentValueLabel.text = String(newValue)
        
            //currentValue = currentValue = Int(text)!
        case ".":
            print("case: .")
            
            //currentValue = currentValue . Int(text)!
            
        default:
            
            if userIsInAProgress {
                currentValueLabel.text = displayedText + buttonText
            } else {
                currentValueLabel.text = buttonText
                userIsInAProgress = true
            }
            
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

