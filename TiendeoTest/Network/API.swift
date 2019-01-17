//
//  API.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 10/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import AlamofireObjectMapper

class API: NSObject {
    
    func getOffers() -> Observable<[OfferModel]> {
        
        return Observable.create({ observer -> Disposable in
            
            let URL = Network.baseUrl + Network.offers
            let task = Alamofire.request(URL).responseArray { (response: DataResponse<[OfferModel]>) in
                
                if let citiesArray = response.result.value {
                    observer.on(.next(citiesArray))
                    observer.on(.completed)
                } else {
                    if let error = response.error {
                        observer.on(.error(error))
                    }
                }
            }
            return Disposables.create {
                task.cancel()
            }
        })
    }
}

