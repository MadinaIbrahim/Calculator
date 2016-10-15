//
//  ViewController.swift
//  Calculator
//
//  Created by Madina Ibrahim on 10/14/16.
//  Copyright © 2016 Madina Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperation: Operator = Operator.nothing // var that stores current operator
    var calcState: CalculationState = CalculationState.enteringNum // to keep truck of that calculation state
    var firstValue: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: Button Actions
    
    @IBAction func numberTapped(sender:UIButton) {
        updateDisplay (String(sender.tag))
        
    }
    func updateDisplay (number: String) { // update display every time we tap the number
        if calcState == CalculationState.newNumStarted {
            if let num = resultLabel.text {
                if num != "" {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum {
            resultLabel.text = resultLabel.text! + number // concatenation
        }
    }
    @IBAction func operatorTapped(sender:UIButton) {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        updateOperatorButton(sender.tag)
        
        switch sender.tag {
        case 10:
            currentOperation = Operator.add
        case 11:
            currentOperation = Operator.subtract
        case 12:
            currentOperation = Operator.times
        case 13:
            currentOperation = Operator.divide
        default:
            return
        }
    }
    @IBAction func equalsTapped(sender:UIButton) {
        calculateSum()
    }
    
    func calculateSum () {
        if (firstValue.isEmpty) {
            return
        }
        
        var result = ""
        
        if currentOperation == Operator.times {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.divide {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.add {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.subtract {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }
    
    func updateOperatorButton (tag: Int) {
        // clear colors
        
        for var i in 10..<14 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clearColor()
            }
        }
        
        // change color button
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.backgroundColor = UIColor.yellowColor()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

