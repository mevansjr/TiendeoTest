//
//  HomeProtocols.swift
//  TiendeoTest
//
//  Created Jesús Solé on 06/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol HomeWireframeProtocol: class {
    func openStore(store: StoreModel)

}
//MARK: Presenter -
protocol HomePresenterProtocol: class {
    
    func getOffers()
    func updateOffers()
    
    func showError(error: Error)
    
    func getNumberOfElements(section: Int) -> Int?
    func getTitle(section: Int) -> String
    
    func getBusisness(indexPath: IndexPath) -> String?
    func getEndDate(indexPath: IndexPath) -> String?
    
    func goToStore(indexPath: IndexPath)
}

//MARK: Interactor -
protocol HomeInteractorProtocol: class {

    var presenter: HomePresenterProtocol?  { get set }
    
    func getOffers()
    func setOffers(offers: [OfferModel])
    func updateOffers(offers: [OfferModel])
    
    func showError(error: Error)
    
    func getNumberOfCatalogs() -> Int?
    func getNumberOfCoupons() -> Int?
    
    func getCatalogBusisness(index: Int) -> String?
    func getCouponBusisness(index: Int) -> String?
    
    func getCatalogEndDate(index: Int) -> String?
    func getCouponEndDate(index: Int) -> String?
    
    func getCatalogStore(index: Int) -> StoreModel?
    func getCouponStore(index: Int) -> StoreModel?
}

//MARK: View -
protocol HomeViewProtocol: class {

    var presenter: HomePresenterProtocol?  { get set }
    
    func getOffers()
    func updateOffers()
    
    func showError(error: String)
}
