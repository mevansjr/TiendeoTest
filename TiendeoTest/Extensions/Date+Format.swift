//
//  Date+Format.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 11/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit

extension Date {
    var ddMMyyyyFormat: String {
        let formatter = DateFormatter(withFormat: "dd/MM/yyyy", locale: Locale.current.description)
        return formatter.string(from: self)
    }
}
