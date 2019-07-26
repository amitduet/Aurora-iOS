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
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(hex: "F6F6F6")?.cgColor
    }
    
    func cellupdateUI(price:String, previousPrice:String, productName:String, productImageUrl:String, productDescription:String) {
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,productImageUrl))
        self.productImageView.sd_setShowActivityIndicatorView(true)
        self.productImageView.sd_setIndicatorStyle(.gray)
        self.productImageView.sd_setImage(with: imageUrl)
        
        let layer0 = CALayer()
        layer0.contents = self.productImageView.image
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 1.02, tx: 0, ty: -0.01))
        layer0.bounds = self.productImageView.bounds
        layer0.position = self.productImageView.center
        self.productImageView.layer.addSublayer(layer0)
        self.productPriceLabel.text = String(format:"%0.0f%@",price.floatValue,Global.takaUniCode)
    
        self.productDescriptionLabel.text = productDescription.withoutHtml.removeNewLineTag

        self.productPreviousPriceLabel.attributedText =
            Global.stikeThroughPrice(previousPrice: previousPrice.floatValue)
    }

    @IBAction func favoriteButtonPressed(_ sender: Any) {
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, newlyArrived:LatestProduct) -> ProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCollectionViewCell
        cell .cellupdateUI(price: newlyArrived.price, previousPrice: newlyArrived.discountPrice, productName: newlyArrived.name, productImageUrl: newlyArrived.image, productDescription:newlyArrived.latestProductDescription)
        return cell
    }

    class func discountCellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, discountProduct:DiscountProduct) -> ProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCollectionViewCell
        
        cell .cellupdateUI(price: discountProduct.price, previousPrice: discountProduct.oldPrice, productName: discountProduct.name, productImageUrl: discountProduct.image, productDescription:discountProduct.discountProductDescription);
        return cell
    }
    
    class func RelatedCellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, relatedProduct:RelatedProduct) -> ProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCollectionViewCell
        
        //relatedProduct.discountPrice!
            cell .cellupdateUI(price: relatedProduct.price, previousPrice: "500.00", productName: relatedProduct.name, productImageUrl: relatedProduct.image,productDescription:"")

        return cell
    }


}
