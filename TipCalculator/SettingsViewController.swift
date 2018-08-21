//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by georginaxu on 8/21/18.
//  Copyright © 2018 georginaxu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstTipOption: UITextField!
    @IBOutlet weak var secondTipOption: UITextField!
    @IBOutlet weak var thirdTipOption: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update the tip values in the text fields.
        let userDefaults = UserDefaults.standard
        let firstTip = userDefaults.integer(forKey: "firstTipOption")
        let secondTip = userDefaults.integer(forKey: "secondTipOption")
        let thirdTip = userDefaults.integer(forKey: "thirdTipOption")
        
        firstTipOption.text = "\(firstTip)"
        secondTipOption.text = "\(secondTip)"
        thirdTipOption.text = "\(thirdTip)"
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
    
    @IBAction func storeChangedValue(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        let firstTip = Int(firstTipOption.text!) ?? 0
        let secondTip = Int(secondTipOption.text!) ?? 0
        let thirdTip = Int(thirdTipOption.text!) ?? 0
        
        firstTipOption.text = "\(firstTip)"
        secondTipOption.text = "\(secondTip)"
        thirdTipOption.text = "\(thirdTip)"
        
        userDefaults.set(firstTip, forKey: "firstTipOption")
        userDefaults.set(secondTip, forKey: "secondTipOption")
        userDefaults.set(thirdTip, forKey: "thirdTipOption")
        
        userDefaults.synchronize()
    }
}
