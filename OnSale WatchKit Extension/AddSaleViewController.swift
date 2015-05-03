//
//  AddSaleViewController.swift
//  OnSale
//
//  Created by Ruben on 5/1/15.
//  Copyright (c) 2015 Ruben.Codes. All rights reserved.
//

import Foundation
import WatchKit

class AddSaleViewController: WKInterfaceController {
    var currentCost : Double = 0
    var newCost : Double = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        currentCost = context!.objectForKey("currentCost") as! Double
        newCost = currentCost
    }
    
    @IBAction func ten() {
        newCostWithDiscount(0.9)
    }
    
    @IBAction func fifteen() {
        newCostWithDiscount(0.85)
    }
    
    @IBAction func twenty() {
        newCostWithDiscount(0.8)
    }
    
    @IBAction func twentyfive() {
        newCostWithDiscount(0.75)
    }
    
    @IBAction func thirty() {
        newCostWithDiscount(0.7)
    }
    
    @IBAction func thirtythree() {
        newCostWithDiscount(0.67)
    }
    
    @IBAction func thirtyfive() {
        newCostWithDiscount(0.65)
    }
    
    @IBAction func fourty() {
        newCostWithDiscount(0.6)
    }
    
    @IBAction func fourtyfive() {
        newCostWithDiscount(0.55)
    }
    
    @IBAction func fifty() {
        newCostWithDiscount(0.5)
    }
    
    @IBAction func fiftyfive() {
        newCostWithDiscount(0.45)
    }
    
    @IBAction func sixty() {
        newCostWithDiscount(0.4)
    }
    
    @IBAction func sixtyfive() {
        newCostWithDiscount(0.35)
    }
    
    @IBAction func sixtysix() {
        newCostWithDiscount(0.34)
    }
    
    @IBAction func seventy() {
        newCostWithDiscount(0.3)
    }
    
    @IBAction func seventyfive() {
        newCostWithDiscount(0.25)
    }
    
    @IBAction func eighty() {
        newCostWithDiscount(0.2)
    }
    
    @IBAction func eightyfive() {
        newCostWithDiscount(0.15)
    }
    
    @IBAction func ninty() {
        newCostWithDiscount(0.1)
    }
    
    @IBAction func nintyfive() {
        newCostWithDiscount(0.95)
    }
    
    func newCostWithDiscount(discount : Double) {
        newCost = currentCost * discount
        self.pushControllerWithName("FinalViewController", context: ["currentCost" : newCost])
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}