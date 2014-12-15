//
//  SettingsViewController.swift
//  Tips
//
//  Created by Glen Botha on 12/13/14.
//  Copyright (c) 2014 Glen Botha. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var defaultSelectionInt = 0
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var defaultTipSelector: UISegmentedControl!
    
    @IBAction func defaultTipSelectorTapped(sender: AnyObject) {
        switch defaultTipSelector.selectedSegmentIndex
        {
            case 0:
                defaultSelectionInt = 0
                defaults.setInteger(0, forKey: "defaultTipInt")
                defaults.synchronize()
            
            case 1:
                 defaultSelectionInt = 1
                 defaults.setInteger(1, forKey: "defaultTipInt")
                 defaults.synchronize()
            
            case 2:
                 defaultSelectionInt = 2
                 defaults.setInteger(2, forKey: "defaultTipInt")
                 defaults.synchronize()
            
            default:
            
            break;
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        
        defaultSelectionInt = defaults.integerForKey("defaultTipInt")
        
        defaultTipSelector.selectedSegmentIndex = defaultSelectionInt
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
