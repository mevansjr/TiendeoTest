//
//  HomeViewController.swift
//  TiendeoTest
//
//  Created Jesús Solé on 06/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: HomePresenterProtocol?
    let spaceBetweenCells: CGFloat = 10
    let catalogHeight: CGFloat = 300
    let couponHeight: CGFloat = 250

	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.getOffers()
    }

    func setupView() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.mainRedColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white,
                                                                        .font : Fonts.navigationFont!]
        self.navigationItem.title = "kHomeNavigationTitle".localize.uppercased()
    }
    
    func getOffers() {
        self.presenter?.getOffers()
    }
    
    func updateOffers() {
        self.collectionView.reloadData()
    }
    
    func showError(error: Error) {
        AlertsManager.showAlertMessage(controller: self,
                                       title: "kError".localize,
                                       message: error.localizedDescription,
                                       buttonString: "kOk".localize)
    }
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    func favouriteTapped(indexPath: IndexPath) {
        
    }
    
    func saveTapped(indexPath: IndexPath) {
        
    }
    
    func shareTapped(indexPath: IndexPath) {
        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.getNumberOfElements(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = indexPath.section == 0 ? Cells.Catalog : Cells.Coupon
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                      for: indexPath) as! HomeCollectionViewCell
        cell.configureCell(busisnessName: self.presenter?.getBusisness(indexPath: indexPath) ?? "",
                           endDate: self.presenter?.getEndDate(indexPath: indexPath) ?? "",
                           indexPath: indexPath,
                           delegate: self)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                      withReuseIdentifier: SuplementaryViews.Home,
                                                                      for: indexPath) as! HomeCollectionReusableView
        section.titleLabel.text = self.presenter?.getTitle(section: indexPath.section)
        return section
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenBounds = UIScreen.main.bounds
        let width = (screenBounds.width - self.spaceBetweenCells * 3.0) / 2.0
        let height = indexPath.section == 0 ? self.catalogHeight : self.couponHeight
        
        return CGSize(width: width, height: height)
    }
}