//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by sam gomez on 07/01/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float)  {
        let bmiValue = weight / (height * height)
        let color = (underweight: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), healthy: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), overweight: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) )
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "EAT MORE!!!", color:color.underweight )
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "FIT AS FIDDLE!!!", color:color.healthy )
        }else {
            bmi = BMI(value: bmiValue, advice: "EAT LESS!!!", color:color.overweight )
        }
    }
    
    func getBMIValue() -> String  {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
