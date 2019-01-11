//
//  OfferModel.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 10/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import ObjectMapper

class OfferModel: Mappable {
    var catalogId: String?
    var coupon: CouponModel?
    var dateEnd: String?
    var nearestStore: StoreModel?
    var retailerId: String?
    var retailerName: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        catalogId <- map["catalog_id"]
        coupon <- map["coupon"]
        dateEnd <- map["date_end"]
        nearestStore <- map["nearest_store"]
        retailerId <- map["retailer_id"]
        retailerName <- map["retailer_name"]
    }
}
