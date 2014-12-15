//
//  ViewController.swift
//  Tips
//
//  Created by Glen Botha on 12/13/14.
//  Copyright (c) 2014 Glen Botha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var defaults = NSUserDefaults.standardUserDefaults()
    var defaultTipInt = 0;
    var numberOfPeople = 2;
    var perPersonAmount = 0.00
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var perPersonAmountLabel: UILabel!
  
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var sliderNumberOfPeople: UISlider!
   
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        numberOfPeopleLabel.text = "2. Number of people: \(Int(sliderNumberOfPeople.value))"
        
        numberOfPeople = Int(sliderNumberOfPeople.value)
        defaults.setInteger(numberOfPeople, forKey: "numberOfPeople")
         defaults.synchronize()
        
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        defaults.setDouble((billField.text as NSString).doubleValue, forKey: "billValue")
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        
    
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var perPersonAmount = total / Double(numberOfPeople)
        
     //   tipLabel.text = "$\(tip)"
    //    totalLabel.text = "$\(total)"
        
        tipLabel.text  = String(format: "$%.2f", tip)
        totalLabel.text  = String(format: "$%.2f", total)
        perPersonAmountLabel.text = String(format: "$%.2f", perPersonAmount)
        
        defaults.synchronize()
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        perPersonAmountLabel.text = "$0.00"
        
   
        
        defaultTipInt = defaults.integerForKey("defaultTipInt")
        tipControl.selectedSegmentIndex = defaultTipInt
        
        numberOfPeople = defaults.integerForKey("numberOfPeople")
        if(numberOfPeople == 0)
        {
            numberOfPeople = 2
        }
         numberOfPeopleLabel.text = "2. Number of people: \(numberOfPeople)"
        sliderNumberOfPeople.setValue(Float(numberOfPeople), animated: true)
        
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[defaultTipInt]
        
        var billValue = defaults.doubleForKey("billValue")
        if(billValue != 0)
        {
            billField.text = String(format:"%.2f",billValue)
            
            var tip = billValue * tipPercentage
            var total = billValue + tip
            var perPersonAmount = total / Double(numberOfPeople)
            
            tipLabel.text  = String(format: "$%.2f", tip)
            totalLabel.text  = String(format: "$%.2f", total)
            perPersonAmountLabel.text = String(format: "$%.2f", perPersonAmount)
            
        }
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

