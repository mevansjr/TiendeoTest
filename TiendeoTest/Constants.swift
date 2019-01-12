//
//  Constants.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 06/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit

struct Controllers {
    static let Home             = "HomeViewController"
    static let Splash           = "SplashViewController"
    static let Store            = "StoreViewController"
}

struct Cells {
    static let Catalog          = "catalogCell"
    static let Coupon           = "couponCell"
}

struct SuplementaryViews {
    static let Home             = "homeSuplementaryView"
}

struct Fonts {
    static let navigationFont   = UIFont(name: "Helvetica-Bold", size: 24)
}

struct Network {
    static let baseUrl          = "https://interview-ios.firebaseio.com/"
    static let offers           = "offers.json"
}

struct ErrorMessage {
    static let noStore          = "kErrorNoStore".localize
}
