//
//  ListProductCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/17/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ListProductCollectionViewCell: UICollectionViewCell {
    
    /*
     Image
     Current price -Averta-Semibold - 15, old price Averta-Semibold -  10 -> label
     Favs button
     Description -> label  Averta-Regular- 13
     
     
     Star (image ) and rate label UIFont(name: "Roboto-Regular", size: 13)

     */
    
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

}
