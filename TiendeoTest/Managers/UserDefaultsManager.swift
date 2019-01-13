//
//  UserDefaultsManager.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 13/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit

class UserDefaultsManager: NSObject {
    
    class func saveFavourite(id: String) {
        UserDefaults.standard.set("true", forKey: UserDefaultsKey.favourites + id)
        UserDefaults.standard.synchronize()
    }
    
    class func isFavourite(id: String) -> Bool {
        if let _ = UserDefaults.standard.string(forKey: UserDefaultsKey.favourites + id) {
            return true
        }
        return false
    }

    class func removeFavourite(id: String) {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.favourites + id)
        UserDefaults.standard.synchronize()
    }
}
