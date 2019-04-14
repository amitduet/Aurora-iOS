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
}
