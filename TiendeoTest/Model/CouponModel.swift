//
//  CouponModel.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 10/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import ObjectMapper

class CouponModel: Mappable {
    var buttons: [CouponButtonsModel]?
    var couponDescription: CouponModel?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        buttons <- map["Buttons"]
        couponDescription <- map["description"]
    }
}
