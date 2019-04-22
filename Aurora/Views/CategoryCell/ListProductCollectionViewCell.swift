//
//  ListProductCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/17/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ListProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var productImageView:UIImageView!
    @IBOutlet var productCurrentPriceLabel:UILabel!
    @IBOutlet var productPreviousPriceLabel:UILabel!
    @IBOutlet var addToWishListButton:UIButton!
    @IBOutlet var productDescriptionLabel:UILabel!
    @IBOutlet var productRatingImageView:UIImageView!
    @IBOutlet var productRatingLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, product:ProductByCategory) -> ListProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ListProductCollectionViewCell
        
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,product.image))
        cell.productImageView.sd_setShowActivityIndicatorView(true)
        cell.productImageView.sd_setIndicatorStyle(.gray)
        cell.productImageView.sd_setImage(with: imageUrl)
        
        cell.productDescriptionLabel.text = product.description
        cell.productCurrentPriceLabel.text = String(format:"%@ %@",product.price,Global.takaUniCode)
        //        cell.productPreviousPriceLabel.text = newlyArrived.pri
        cell.backgroundColor = .lightGray
        return cell
    }


}
