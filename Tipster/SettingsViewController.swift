//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Apurva Mehta on 8/3/17.
//  Copyright © 2017 Apurva Mehta. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "tipSegmentControlIndex")
        defaultTipControl.selectedSegmentIndex = defaultTipIndex

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setDefaultTip(_ sender: Any) {
        let defaultTipIndex = defaultTipControl.selectedSegmentIndex
        let defaults = UserDefaults.standard
        defaults.set(defaultTipIndex, forKey: "tipSegmentControlIndex")
        defaults.synchronize()
    }

    
//    let defaults = NSUserDefaults.standard
//    defaults.set("some_string_to_save", forKey: "some_key_that_you_choose")
//    defaults.set(123, forKey: "another_key_that_you_choose")
//    defaults.synchronize()

}
