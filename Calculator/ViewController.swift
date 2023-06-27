//
//  ViewController.swift
//  Calculator
//
//  Created by Lisa Meyer on 02.06.23.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0


    @IBAction func numBtn(_ sender: UIButton) {
        
        if performingMath == true {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func funcBtn(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 {
                label.text = "/"
            }
            if sender.tag == 13 {
                label.text = "x"
            }
            if sender.tag == 14 {
                label.text = "-"
            }
            if sender.tag == 15 {
                label.text = "+"
            }
            if sender.tag == 17 {
                label.text = "√"
            }
            if sender.tag == 18 {
                label.text = "^"
            }
            if sender.tag == 19 {
                label.text = "."
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16 {
            
            if operation == 12 {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                label.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 17 {
                label.text = String(sqrt(previousNumber))
            }
            else if operation == 18 {
                label.text = String(pow(previousNumber, numberOnScreen))
            }
            
        }
        
        
        else if sender.tag == 11 {
            label.text = ""
                previousNumber = 0
                numberOnScreen = 0
                operation = 0
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

