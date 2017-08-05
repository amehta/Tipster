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
    
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        billAmountInputTextField.becomeFirstResponder()
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
        
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        let totalTipFormatted = formatter.string(from: NSNumber(value: tipAmount))
        let totalBillFormatted = formatter.string(from: NSNumber(value: billTotal))

        
        tipLabel.text = String(format: "\(currencySymbol)%@", totalTipFormatted!)
        billTotalTabel.text = String(format: "\(currencySymbol)%@", totalBillFormatted!)
        updateTipPerPerson()
        
    }
    
    @IBAction func calculateTipPerPerson(_ sender: Any) {
        updateTipPerPerson()
    }
    
    func updateTipPerPerson() {
        let numberOfPeople = Int(round(numberOfPeopleSlider.value))
        numberOfPeopleLabel.text = String(numberOfPeople)
        
        let totalBillAmount = String(self.billTotalTabel.text!.characters.dropFirst())
        
        let billPerPerson = Float(totalBillAmount)! / Float(numberOfPeople)

        
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        
        let billPerPersonFormatted = formatter.string(from: NSNumber(value: billPerPerson))
        tipPerPersonLabel.text = String(format: "\(currencySymbol)%@", billPerPersonFormatted!)

        
    }
}

