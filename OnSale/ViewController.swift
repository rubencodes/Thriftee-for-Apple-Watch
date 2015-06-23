//
//  ViewController.swift
//  OnSale
//
//  Created by Ruben on 5/1/15.
//  Copyright (c) 2015 Ruben.Codes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var OriginalCostLabel : UITextField!
    @IBOutlet var backspaceButton : UIButton!
    var originalCost : Double = 0
    var currentCost : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //make sure uibutton image doesn't stretch
        backspaceButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addToCostLabel(sender : UIButton) {
        let digit  = sender.tag
        originalCost = ("\(originalCost*10)\(digit)" as NSString).doubleValue
        currentCost = originalCost
        OriginalCostLabel.text = originalCost.toMoney()
    }
    
    @IBAction func backspace() {
        originalCost = floor(originalCost*10) / 100
        currentCost = originalCost
        OriginalCostLabel.text = originalCost.toMoney()
    }
    
    @IBAction func addSale(sender: UIButton) {
        let alert = UIAlertController(title: "Add Sale", message: "Enter the percent discount you want to add. e.g. 90 for 90%", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.keyboardAppearance = UIKeyboardAppearance.Dark
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        let addSale = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: {
            (action) -> Void in
            let textField = alert.textFields!.first as UITextField!
            if let discount = Int(textField.text!) {
                alert.dismissViewControllerAnimated(true, completion: nil)
                
                self.currentCost = max(self.currentCost*(1 - Double(discount)/100), 0)
                var savings = (self.originalCost - self.currentCost)
                
                let newCostAlert = UIAlertController(title: "You've Saved \(savings.toMoney())!", message: "Your new price is \(self.currentCost.toMoney()). Would you like to add an additional discount, or start over?", preferredStyle: UIAlertControllerStyle.Alert)
                
                let startOver = UIAlertAction(title: "Start Over", style: UIAlertActionStyle.Destructive, handler: { (action) -> Void in
                    self.originalCost = 0
                    self.currentCost = 0
                    self.OriginalCostLabel.text = self.currentCost.toMoney()
                    newCostAlert.dismissViewControllerAnimated(true, completion: nil)
                })
                
                let addSale = UIAlertAction(title: "Add Additional Discount", style: UIAlertActionStyle.Default, handler: {
                    (action) -> Void in
                    self.addSale(sender)
                })
                
                newCostAlert.addAction(startOver)
                newCostAlert.addAction(addSale)
                
                self.presentViewController(newCostAlert, animated: true, completion: nil)
            } else { //number invalid, try again
                alert.dismissViewControllerAnimated(true, completion: { () -> Void in
                    self.addSale(sender)
                })
            }
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alert.addAction(addSale)
        alert.addAction(cancel)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

extension Double {
    mutating func toMoney() -> String {
        return String(format: "$%.2f", self)
    }
}