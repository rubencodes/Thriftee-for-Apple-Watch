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
    @IBOutlet var salePicker : WKInterfacePicker!
    var discount : Int = 1
    var currentCost : Double = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        currentCost = context!.objectForKey("currentCost") as! Double
        
        var pickerItems: [WKPickerItem] = []
        for var num in 1...100 {
            let item = WKPickerItem()
            item.title = "\(num)%"
            pickerItems.append(item)
        }
        self.salePicker.setItems(pickerItems)
    }
    
    @IBAction func changeDiscount(value : Int) {
        discount = value+1 //add 1 because index 0 array
    }
    
    @IBAction func takeDiscount() {
        let newCost = currentCost * (1 - Double(discount)/100)
        self.pushControllerWithName("FinalViewController", context: ["currentCost" : newCost])
    }
}