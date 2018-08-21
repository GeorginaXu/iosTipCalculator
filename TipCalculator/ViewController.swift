//
//  ViewController.swift
//  TipCalculator
//
//  Created by georginaxu on 8/21/18.
//  Copyright © 2018 georginaxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // User input bill value.
    @IBOutlet weak var billValue: UITextField!
    // Calcualted total bill value.
    @IBOutlet weak var totalValue: UILabel!
    // Calculated tip value.
    @IBOutlet weak var tipValue: UILabel!
    // Multiple tip percentages displayed at the center of the screen.
    @IBOutlet weak var selectTipPercentage: UISegmentedControl!
    
    // Money per person if the bill is splited by four people.
    @IBOutlet weak var fourPeopleSplitValue: UILabel!
    // Money per person if the bill is splited by three people.
    @IBOutlet weak var threePeopleSplitValue: UILabel!
    // Money per person if the bill is splited by two people.
    @IBOutlet weak var twoPeopleSplitValue: UILabel!
    // UIView that displayed all the results.
    @IBOutlet weak var resultView: UIView!
    // Array that stores all tip values.nn
    var tipPercentages = [0.18, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Store initial tip value in user defaults.
        let userDefaults = UserDefaults.standard
        userDefaults.set(18, forKey: "firstTipOption")
        userDefaults.set(20, forKey: "secondTipOption")
        userDefaults.set(25, forKey: "thirdTipOption")    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update the tips displayed based on the value in user defaults.
        let userDefaults = UserDefaults.standard
        let firstTipOption = userDefaults.integer(forKey: "firstTipOption")
        let secondTipOption = userDefaults.integer(forKey: "secondTipOption")
        let thirdTipOption = userDefaults.integer(forKey: "thirdTipOption")
        
        selectTipPercentage.setTitle("\(firstTipOption)%", forSegmentAt: 0)
        selectTipPercentage.setTitle("\(secondTipOption)%", forSegmentAt: 1)
        selectTipPercentage.setTitle("\(thirdTipOption)%", forSegmentAt: 2)
        
        // Update the value in tip percentage list.
        tipPercentages[0] = Double(firstTipOption) / 100.0
        tipPercentages[1] = Double(secondTipOption) / 100.0
        tipPercentages[2] = Double(thirdTipOption) / 100.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Retrieve the bill value.
        let bill = Double(billValue.text!) ?? 0
    
        // Calculate tip value and total.
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
    
    // Add fade in animation to resultView when the bill value field is clicked.
    @IBAction func animateResultView(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.resultView.alpha += 0.8
        })
    }
}

