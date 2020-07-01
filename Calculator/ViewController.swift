//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("COULD NOT CONVERT DISPLAY LABEL TEXT TO DOUBLE")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
//    What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle{
            if(calcMethod == "+/-"){
                displayLabel.text = String(displayValue * -1)
            }
            else if(calcMethod == "AC"){
                displayLabel.text = String(0)
            }
            else if(calcMethod == "%"){
                displayLabel.text = String(displayValue / 100)
            }
        }
        
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
//    What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                if numValue == "."{
                    let isInt = (floor(displayValue) == displayValue)
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

