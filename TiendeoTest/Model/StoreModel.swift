//
//  StoreModel.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 10/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import ObjectMapper

class StoreModel: Mappable {
    var distance: String?
    var latitude: String?
    var longitude: String?
    var phoneNumber: String?
    var storeAddress: String?
    var storeCity: String?
    var storeId: String?
    var storeName: String?
    var storeZipCode: String?
    var webUrl: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        distance <- map["distance"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        phoneNumber <- map["phone_number"]
        storeAddress <- map["store_address"]
        storeCity <- map["store_city"]
        storeId <- map["store_id"]
        storeName <- map["store_name"]
        storeZipCode <- map["store_zip_code"]
        webUrl <- map["web_url"]
    }
}
