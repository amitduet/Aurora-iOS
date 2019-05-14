//
//  SizeCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/13/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sizeLabel:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = CGFloat(Global.cellBorderWidth);
        self.layer.borderColor = UIColor.init(hex: Global.cellBorderColor)?.cgColor
    }

    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, option:Option) -> SizeCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SizeCollectionViewCell
        cell.sizeLabel.text = option.optionValueDescriptionName
        return cell
    }

}
