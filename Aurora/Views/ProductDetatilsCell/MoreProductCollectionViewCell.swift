//
//  ProductCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/10/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class MoreProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel:UILabel!
    @IBOutlet weak var currentPriceLabel:UILabel!
    @IBOutlet weak var previousPriceLabel:UILabel!
    @IBOutlet weak var favsButton:UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.lightGray.cgColor;
        self.layer.borderWidth = 1;
        // Initialization code
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, relatedProducts:[RelatedProduct]) -> MoreProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MoreProductCollectionViewCell
        
        let relatedProduct = relatedProducts[indexPath.row]
        
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,relatedProduct.image))
        cell.productImageView.sd_setShowActivityIndicatorView(true)
        cell.productImageView.sd_setIndicatorStyle(.gray)
        cell.productImageView.sd_setImage(with: imageUrl)
        
        cell.productNameLabel.text = relatedProduct.name
        cell.currentPriceLabel.text = String(format:"%@ %@",relatedProduct.price,Global.takaUniCode)
//        cell.previousPriceLabel.text = String(format:"%@ %@",relatedProduct.discountPrice,Global.takaUniCode)

        return cell
    }

}
