//
//  SplashPresenter.swift
//  TiendeoTest
//
//  Created Jesús Solé on 12/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SplashPresenter: SplashPresenterProtocol {

    weak private var view: SplashViewProtocol?
    var interactor: SplashInteractorProtocol?
    private let router: SplashWireframeProtocol

    init(interface: SplashViewProtocol, interactor: SplashInteractorProtocol?, router: SplashWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func getOffers() {
        self.interactor?.getOffers()
    }
    
    func goToHome(offers: [OfferModel]) {
        self.router.openHome(offers: offers)
    }
    
    func showError(error: Error) {
        self.view?.showError(error: error)
    }

}