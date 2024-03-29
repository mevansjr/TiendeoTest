//
//  HomePresenter.swift
//  TiendeoTest
//
//  Created Jesús Solé on 06/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomePresenter: HomePresenterProtocol {

    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    private let router: HomeWireframeProtocol

    init(interface: HomeViewProtocol, interactor: HomeInteractorProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func getOffers() {
        self.interactor?.getOffers()
    }
    
    func getNumberOfElements(section: Int) -> Int? {
        return section == 0 ? self.interactor?.getNumberOfCatalogs() : self.interactor?.getNumberOfCoupons()
    }
    
    func getTitle(section: Int) -> String {
        return section == 0 ? "kCatalogs".localize.uppercased() : "kCoupons".localize.uppercased()
    }
    
    func updateOffers() {
        self.view?.updateOffers()
    }
    
    func showError(error: Error) {
        self.view?.showError(error: error.localizedDescription)
    }
    
    func getBusisness(indexPath: IndexPath) -> String? {
        return indexPath.section == 0 ? self.interactor?.getCatalogBusisness(index: indexPath.row)
            : self.interactor?.getCouponBusisness(index: indexPath.row)
    }
    
    func getEndDate(indexPath: IndexPath) -> String? {
        return indexPath.section == 0 ? self.interactor?.getCatalogEndDate(index: indexPath.row)
            : self.interactor?.getCouponEndDate(index: indexPath.row)
    }
    
    func getShareText(indexPath: IndexPath) -> String {
        var shareText = ""
        if indexPath.section == 0 {
            shareText = String(format: "kShareCatalog".localize,
                               self.interactor?.getCatalogBusisness(index: indexPath.row) ?? "",
                               self.interactor?.getCatalogEndDate(index: indexPath.row) ?? "")
        } else {
            shareText = String(format: "kShareCoupon".localize,
                               self.interactor?.getCouponBusisness(index: indexPath.row) ?? "",
                               self.interactor?.getCouponEndDate(index: indexPath.row) ?? "")
        }
        return shareText
    }
    
    func goToStore(indexPath: IndexPath) {
        let store = indexPath.section == 0 ? self.interactor?.getCatalogStore(index: indexPath.row)
            : self.interactor?.getCouponStore(index: indexPath.row)
        
        if let nearestStore = store {
            self.router.openStore(store: nearestStore)
        } else {
            self.view?.showError(error: ErrorMessage.noStore)
        }
    }
    
    func getNumberOfItemsPerRow() -> CGFloat {
        if UI_USER_INTERFACE_IDIOM() == .phone {
            return 2
        } else if UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown {
            return 3
        } else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            return 4
        }
        return 2
    }
    
    func isElementFavourite(indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return self.interactor?.isCatalogFavourite(index: indexPath.row) ?? false
        }
        return self.interactor?.isCouponFavourite(index: indexPath.row) ?? false
    }
    
    func elementFavouriteAction(indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.interactor?.catalogFavouriteAction(index: indexPath.row)
        } else {
            self.interactor?.couponFavouriteAction(index: indexPath.row)
        }
    }
}
