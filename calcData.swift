//
//  calcData.swift
//  discountCalculator
//
//  Created by Joshua Marvel on 3/13/17.
//  Copyright © 2017 Joshua Marvel. All rights reserved.
//

import UIKit

class calcData {
    
    
    var price: Float
    var dollarsOff: Float
    var discount: Float
    var otherDiscount: Float
    var tax: Float
    var discountedPrice: Float
    var priceBeforeDiscount: Float
    
    var price: Float {
        get
        {
            return self.price
        }
        set
        {
            price = newValue
        }
    }
    
    
    
    
    
}

let shared: calcData = calcData()
