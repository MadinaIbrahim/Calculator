//
//  StructsEnums.swift
//  Calculator
//
//  Created by Madina Ibrahim on 10/14/16.
//  Copyright © 2016 Madina Ibrahim. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String { // to calculate current state
    case enteringNum = "enteringNum"// add one number after enother in my display
    case newNumStarted = "newNumStarted" // or clear the display when new number started and enter that new number
}