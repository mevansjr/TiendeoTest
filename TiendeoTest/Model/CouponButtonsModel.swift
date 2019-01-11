//
//  CouponButtonsModel.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 10/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import ObjectMapper

class CouponButtonsModel: Mappable {
    var action: Int?
    var text: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        action <- map["action"]
        text <- map["text"]
    }
}
