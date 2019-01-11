//
//  AlertsManager.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 10/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit

class AlertsManager: NSObject {
    
    static func showAlertMessage(controller: UIViewController, title: String, message: String, buttonString: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.isModalInPopover = true
        
        let okAction = UIAlertAction(title: buttonString, style: .default, handler: nil)
        alert.addAction(okAction)
        
        controller.present(alert, animated: true, completion: nil)
    }
    
}
