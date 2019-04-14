//
//  SliderImageCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/14/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit
import SDWebImage
class SliderImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sliderImage:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath,banner:DiscountBanner) -> SliderImageCollectionViewCell {
        let identifier = String(describing: self)

        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SliderImageCollectionViewCell
        
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,banner.image))
        cell.sliderImage.sd_setShowActivityIndicatorView(true)
        cell.sliderImage.sd_setIndicatorStyle(.gray)
        cell.sliderImage.sd_setImage(with: imageUrl)
        cell.backgroundColor = .gray
        return cell
    }

    

}
