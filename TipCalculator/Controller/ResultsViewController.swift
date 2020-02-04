//
//  ResultsViewController.swift
//  TipCalculator
//
//  Created by Carlos Solana on 03.02.20.
//  Copyright © 2020 Cybermoth. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var billTotalLabel: UILabel!
    @IBOutlet weak var splitInstructionsLabel: UILabel!
    @IBOutlet weak var recalculateTipButton: UIButton!
    
    var result: String = "0.0"
    var tip: Int = 10
    var split: Int = 2
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billTotalLabel.text = result
        splitInstructionsLabel.text = "SPLIT \(split) DUDES, with \(tip)% tip."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recalculateTip(_ sender: UIButton) {
    
        
        self.dismiss(animated: true, completion: nil)
    }
}
