//
//  ViewController.swift
//  TipCalculator
//
//  Created by georginaxu on 8/21/18.
//  Copyright © 2018 georginaxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billValue: UITextField!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var selectTipPercentage: UISegmentedControl!
    
    @IBOutlet weak var fourPeopleSplitValue: UILabel!
    @IBOutlet weak var threePeopleSplitValue: UILabel!
    @IBOutlet weak var twoPeopleSplitValue: UILabel!
    
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billValue.text!) ?? 0
    
        let tip = bill * tipPercentages[selectTipPercentage.selectedSegmentIndex]
        let total = bill + tip
        
        let twoPeopleSplit = total / 2
        let threePeopleSplit = total / 3
        let fourPeopleSplit = total / 4
        
        tipValue.text = String(format: "$%.2f", tip)
        totalValue.text = String(format: "$%.2f", total)
        twoPeopleSplitValue.text = String(format: "$%.2f", twoPeopleSplit)
        threePeopleSplitValue.text = String(format: "$%.2f", threePeopleSplit)
        fourPeopleSplitValue.text = String(format: "$%.2f", fourPeopleSplit)
    }
    
    @IBAction func animateResultView(_ sender: Any) {
        UIView.animate(withDuration: 1.5, animations: {
            self.resultView.alpha += 0.8
        })
    }
}

