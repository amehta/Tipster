//
//  ViewController.swift
//  Tipster
//
//  Created by Apurva Mehta on 8/2/17.
//  Copyright © 2017 Apurva Mehta. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billAmountInputTextField: UITextField!
    @IBOutlet weak var billTotalTabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "tipSegmentControlIndex")
        tipControl.selectedSegmentIndex = defaultTipIndex
        print("Tip Index: \(defaultTipIndex)")
        updateTip()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        updateTip()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func updateTip() {
        var tipPercentages = [18.0, 20.0, 25.0]
        
        
        let billAmount = Double(billAmountInputTextField.text!) ?? 0
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let tipAmount = billAmount*tipPercentage/100
        let billTotal = billAmount + tipAmount
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        billTotalTabel.text = String(format: "$%.2f", billTotal)
        
    }

}

