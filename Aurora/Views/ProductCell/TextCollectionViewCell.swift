//
//  TextCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/15/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var infoLabel:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let shadows = UIView()
//        shadows.frame = infoLabel.frame
//        shadows.clipsToBounds = false
//        infoLabel.addSubview(shadows)
//
//        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
//        let layer0 = CALayer()
//        layer0.shadowPath = shadowPath0.cgPath
//        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        layer0.shadowOpacity = 1
//        layer0.shadowRadius = 4
//        layer0.shadowOffset = CGSize(width: 0, height: 4)
//        layer0.bounds = shadows.bounds
//        layer0.position = shadows.center
//        shadows.layer.addSublayer(layer0)
        
        infoLabel.font = UIFont(name: "Averta-Semibold-", size: 16)
        infoLabel.text = "On SALE"
        infoLabel.textColor = .lightGray
    }
    
    
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath) -> TextCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! TextCollectionViewCell
        return cell
    }


}
