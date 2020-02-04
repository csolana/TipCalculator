//
//  ViewController.swift
//  TipCalculator
//
//  Created by Carlos Solana on 01.02.20.
//  Copyright © 2020 Cybermoth. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var firstPercentageButton: UIButton!
    @IBOutlet weak var secondPercentageButton: UIButton!
    @IBOutlet weak var thirdPercentageButton: UIButton!
    @IBOutlet weak var splitTipNumberLabel: UILabel!
    
    //tip, numb of people, bill toptal, final result
    
    var tip = 0.10
    var peopleToSplit = 2
    var totalBill = 0.0
    var finalResult = "0.0"
    
    

    @IBAction func tipSelected(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        firstPercentageButton.isSelected = false
        secondPercentageButton.isSelected = false
        thirdPercentageButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let valueWithoutPercentageSymbol = buttonTitle.dropLast()
        let titleNUmberConvertedToDouble = Double(valueWithoutPercentageSymbol)!
        tip = titleNUmberConvertedToDouble / 100
        
    }
    @IBAction func stepperValueSelected(_ sender: UIStepper) {
        
        splitTipNumberLabel.text = String(format: "%.0f", sender.value)
        peopleToSplit = Int(sender.value)
        
                
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if bill != "" {
            totalBill = Double(bill)!
            let result = totalBill * (1 + tip) / Double(peopleToSplit)
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = peopleToSplit
            
        }
    }
    
}

