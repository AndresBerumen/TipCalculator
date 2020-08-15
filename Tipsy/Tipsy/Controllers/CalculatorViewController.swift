//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.delegate = self
    }
    
    
    // MARK: Outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var fivePercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    // MARK: Properties
    var tip = 0.1
    var totalBill = 0.0
    var splitValue = "2.0"
    var finalNumber = 0.0
    var buttonTitle = ""
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        billTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        totalBill = Double(billTextField.text!)!
        return true
    }
    
    
    
    // MARK: Actions
    @IBAction func tipSelected(_ sender: UIButton) {
        billTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        totalBill = Double(billTextField.text ?? "") ?? 0.0
        
        fivePercentTip.isSelected = false
        tenPercentTip.isSelected = false
        twentyPercentTip.isSelected = false
        sender.isSelected = true
        
        buttonTitle = sender.currentTitle!
        let tipSansPercent = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(tipSansPercent)!
        
        tip = buttonTitleAsNumber / 100
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitValue = String(format: "%.0f", sender.value)
        splitNumberLabel.text = splitValue
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        billTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        let newTip = totalBill + (totalBill * tip)
        let split = Double(splitValue)!
        finalNumber = newTip / split
        print(String(format: "%.2f", finalNumber))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.tip = finalNumber
        destinationVC.split = Int(splitValue)!
        destinationVC.tipPercentage = buttonTitle
    }
    
    
}

