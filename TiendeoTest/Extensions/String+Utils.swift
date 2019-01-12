//
//  String+Utils.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 08/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit

extension String {
    var localize: String {
        return NSLocalizedString(self, comment: "")
    }
    
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}
