//
//  String+Localize.swift
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
}
