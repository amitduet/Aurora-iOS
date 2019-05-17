//
//  ProductCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/12/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productPreviousPriceLabel: UILabel!

    
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

//        self.layer.borderColor = UIColor.lightGray.cgColor
//        self.layer.borderWidth = 1
//        
//        self.contentView.layer.cornerRadius = 10
//        self.contentView.layer.borderWidth = 1.0
//        
//        self.contentView.layer.borderColor = UIColor.clear.cgColor
//        self.contentView.layer.masksToBounds = true
//        
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        self.layer.shadowRadius = 2.0
//        self.layer.shadowOpacity = 1.0
//        self.layer.masksToBounds = false
//        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
        
    }
    
    func cellupdateUI(price:String, previousPrice:String, productName:String, productImageUrl:String) {
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,productImageUrl))
        self.productImageView.sd_setShowActivityIndicatorView(true)
        self.productImageView.sd_setIndicatorStyle(.gray)
        self.productImageView.sd_setImage(with: imageUrl)
        
        self.productDescriptionLabel.text = productName
        self.productPriceLabel.text = String(format:"%0.2f %@",price.floatValue,Global.takaUniCode)
        self.productPreviousPriceLabel.text = String(format:"%0.2f ",previousPrice.floatValue)
    }

    @IBAction func favoriteButtonPressed(_ sender: Any) {
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, newlyArrived:LatestProduct) -> ProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCollectionViewCell
        cell .cellupdateUI(price: newlyArrived.price, previousPrice: "500.00", productName: newlyArrived.name, productImageUrl: newlyArrived.image)
        //        cell .cellupdateUI(price: newlyArrived.price, previousPrice: newlyArrived.discountPrice, productName: newlyArrived.name, productImageUrl: newlyArrived.image)

        return cell
    }

    class func discountCellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, discountProduct:DiscountProduct) -> ProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCollectionViewCell
        
        cell .cellupdateUI(price: discountProduct.price, previousPrice: discountProduct.oldPrice, productName: discountProduct.name, productImageUrl: discountProduct.image);
        return cell
    }

}
