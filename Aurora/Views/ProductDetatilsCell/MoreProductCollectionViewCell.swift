//
//  ProductCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/10/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel:UILabel!
    @IBOutlet weak var currentPriceLabel:UILabel!
    @IBOutlet weak var previousPriceLabel:UILabel!
    @IBOutlet weak var favsButton:UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
