//
//  ViewController.swift
//  Calculator
//
//  Created by Tia Lallo on 13/02/2020.
//  Copyright © 2020 Tia Lallo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numbersOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true {
            label.text = String(sender.tag-1)
            numbersOnScreen = Double(label.text!)!
            performingMath = false
        }
        else {
            label.text = label.text! + String(sender.tag-1)
            numbersOnScreen = Double(label.text!)!
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 //Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13 //Multiply
            {
                label.text = "x";
            }
            else if sender.tag == 14 //Minus
            {
                label.text = "-";
            }
            else if sender.tag == 15 //Plus
            {
                label.text = "+";
            }
            else if sender.tag == 17 //??
            {
                label.text = String(previousNumber * previousNumber)
            }
            else if sender.tag == 18 //square root
            {
                label.text = String(previousNumber.squareRoot())
            }
            else if sender.tag == 19 //percentage
            {
                label.text = String(previousNumber / 100)
            }
            operation = sender.tag
            performingMath = true;
        }
        
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numbersOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numbersOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numbersOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numbersOnScreen)
            }
            else if operation == 17
            {
                label.text = String(previousNumber * previousNumber)
            }
            else if operation == 18
            {
                label.text = String(previousNumber.squareRoot())
            }
            else if operation == 19
            {
                label.text = String(previousNumber / 100)
            }
            
            
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numbersOnScreen = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

