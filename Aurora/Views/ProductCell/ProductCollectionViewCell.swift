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
        
        /*
         let taka = "\u{09F3}"
         let unicode:String = String(format:"%@ %@", title,taka)
         */

    }

    @IBAction func favoriteButtonPressed(_ sender: Any) {
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, newlyArrived:NewlyArrived) -> ProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCollectionViewCell
        
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,newlyArrived.image))
        cell.productImageView.sd_setShowActivityIndicatorView(true)
        cell.productImageView.sd_setIndicatorStyle(.gray)
        cell.productImageView.sd_setImage(with: imageUrl)

        cell.productDescriptionLabel.text = newlyArrived.description
        cell.productPriceLabel.text = String(format:"%@ %@",newlyArrived.price,Global.takaUniCode)
//        cell.productPreviousPriceLabel.text = newlyArrived.pri
        cell.backgroundColor = .lightGray
        return cell
    }

}
