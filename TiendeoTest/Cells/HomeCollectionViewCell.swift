//
//  CatalogCollectionViewCell.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 06/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellDelegate {
    func favouriteTapped(indexPath: IndexPath)
    func saveTapped(indexPath: IndexPath)
    func shareTapped(indexPath: IndexPath)
}

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var couponLabel: UILabel!
    
    var indexPath: IndexPath!
    var delegate: HomeCollectionViewCellDelegate!
    
    func configureCell(busisnessName: String,
                       endDate: String,
                       indexPath: IndexPath,
                       delegate: HomeCollectionViewCellDelegate) {
        
        self.indexPath = indexPath
        self.delegate = delegate
        
        self.nameLabel.text = busisnessName
        self.dateLabel.text = endDate
        
        if indexPath.section == 0 {
            self.imageView.image = UIImage(named: "imageCatalog")
        } else {
            self.imageView.image = UIImage(named: "imageCoupon")
        }
        
    }
    
    @IBAction func favouriteTapped(_ sender: Any) {
        self.delegate.favouriteTapped(indexPath: self.indexPath)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        self.delegate.saveTapped(indexPath: self.indexPath)
    }
    
    @IBAction func shareTapped(_ sender: Any) {
        self.delegate.shareTapped(indexPath: self.indexPath)
    }
}
