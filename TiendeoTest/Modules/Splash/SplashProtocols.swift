//
//  SplashProtocols.swift
//  TiendeoTest
//
//  Created Jesús Solé on 12/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol SplashWireframeProtocol: class {
    func openHome(offers: [OfferModel], api: API)

}
//MARK: Presenter -
protocol SplashPresenterProtocol: class {
    func getOffers()
    func showError(error: Error)
    func goToHome(offers: [OfferModel], api: API)
}

//MARK: Interactor -
protocol SplashInteractorProtocol: class {

    var presenter: SplashPresenterProtocol?  { get set }
    
    func getOffers()
    func showError(error: Error)
}

//MARK: View -
protocol SplashViewProtocol: class {

    var presenter: SplashPresenterProtocol?  { get set }
    
    func getOffers()
    func showError(error: Error)
}
