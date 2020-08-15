//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Andrés Berumen on 02/07/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", tip)
        settingsLabel.text = "Split between \(split) people, with \(tipPercentage) tip."
    }
    
    var tip = 0.0
    var split = 0
    var tipPercentage = ""
    
    
    // MARK: Outlets
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    // MARK: Actions
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
