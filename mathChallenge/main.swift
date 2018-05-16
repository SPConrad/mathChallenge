//
//  main.swift
//  mathChallenge
//
//  Created by Sean Conrad on 5/13/18.
//  Copyright © 2018 Sean Conrad. All rights reserved.
//

import Foundation

func doMath(firstNum: Double, equation: String){
    let stringExpression = String(format: equation, String(firstNum))
    
    print(stringExpression)
    
    let expression = NSExpression(format: stringExpression)
    let result = expression.expressionValue(with: nil, context: nil) as! Double
    print(String(result))
    
}

func doMath(firstNum: Double, secondNum: Double, equation: String) {
    
    
    let stringExpression = String(format: equation, String(firstNum), String(secondNum))
    print(stringExpression)
    
    let expression = NSExpression(format: stringExpression)
    let result = expression.expressionValue(with: nil, context: nil) as! Double
    print(String(result))
    
    
}

var displayOperators =
    [
        "Multiplication",
        "Addition",
        "Subtraction",
        "Division",
        "Exponent",
        "Square Root",
        "Logarithm",
        "Quit"
]

var availableOperators: [String: String] =
    [
        "Multiplication": "%@ * %@",
        "Addition": "%@ + %@",
        "Subtraction": "%@ - %@",
        "Division": "%@ / %@",
        "Square Root": "sqrt(%@)",
        "Logarithm": "log(%@)",
        "Exponent": "%@ ** %@"
    ]

let welcomeMessage = "Hello! Welcome to the math thing."

let promptForType = "Enter the number that corresponds to the type of math you'd like to do"
var desiredOperator = ""
var firstNumber = 0.0
var secondNumber = 0.0
var result = 0
var selectedInput = -1
var availableTypes = ""

for (index, value) in displayOperators.enumerated() {
    availableTypes += "\(index + 1): \(value)\n"
}

func clearVariables() {
    selectedInput = -1
    desiredOperator = ""
    firstNumber = 0.0
    secondNumber = 0.0
    result = 0

}

print(welcomeMessage)


func takeInput() -> Double{
    if let input = readLine() {
        if let inputDbl = Double(input){
            return inputDbl
        } else {
            print("Invalid entry, please try again")
            return takeInput()
        }
    }
    
    print("Invalid entry, please try again")
    return takeInput()
}


while (true) {
    
    
    while selectedInput < 0 || selectedInput >= displayOperators.count{
        print("\n\nPlease select from the following menu: \n")
        print(availableTypes)
        selectedInput = Int(takeInput()) - 1
        if (selectedInput == 7)
        {
            print("Goodbye!")
            exit(0)
        }
    }
    
    desiredOperator = availableOperators[displayOperators[selectedInput]]!
    
    print("Please enter the first number you want in the equation")
    firstNumber = takeInput()
    
    
    if (selectedInput <= 4){
        print("Please enter the second number you want in the equation")
        if (selectedInput == 3){
            secondNumber = takeInput()
            while secondNumber == 0 {
                print("Cannot divide by zero, please enter a non-zero number")
                secondNumber = takeInput()
            }
        }
        doMath(firstNum: firstNumber, secondNum: secondNumber, equation: desiredOperator)
    } else {
        doMath(firstNum: firstNumber, equation: desiredOperator)
    }
    
    clearVariables()
    
    
}

