//
//  SplashInteractor.swift
//  TiendeoTest
//
//  Created Jesús Solé on 12/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import RxSwift

class SplashInteractor: SplashInteractorProtocol {

    weak var presenter: SplashPresenterProtocol?
    
    func getOffers() {
        let observer = API.manager.getOffers()
        let _ = observer.subscribe(onNext: updateOffers,
                                   onError: showError,
                                   onCompleted: nil,
                                   onDisposed: nil)
    }
    
    func updateOffers(offers: [OfferModel]) {
        self.presenter?.goToHome(offers: offers)
    }
    
    func showError(error: Error) {
        self.presenter?.showError(error: error)
    }
}
