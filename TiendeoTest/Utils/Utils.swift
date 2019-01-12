//
//  Utils.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 12/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit

class Utils: NSObject {
    class func openPhone(phoneNumber: String) {
        let phone = phoneNumber.replacingOccurrences(of: " ", with: "")
        self.openURL(url: "tel://\(phone)")
    }
    
    class func openURL(url: String) {
        if let urlToOpen = URL(string: url), UIApplication.shared.canOpenURL(urlToOpen) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(urlToOpen, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(urlToOpen)
            }
        }
    }
}
