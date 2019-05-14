//
//  RelatedCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/10/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class RelatedCollectionViewCell: UICollectionViewCell {

    var relatedProduct:[RelatedProduct]!
    @IBOutlet weak var relatedProductCollectionView:UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, relatedProducts:[RelatedProduct]) -> RelatedCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! RelatedCollectionViewCell
        cell.relatedProduct = relatedProducts
        cell.relatedProductCollectionView.dataSource = cell
        cell.relatedProductCollectionView.delegate = cell

        cell.relatedProductCollectionView .reloadData();
        return cell
    }
}

extension RelatedCollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.relatedProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MoreProductCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, relatedProducts:self.relatedProduct)
        return cell;
    }
}

extension RelatedCollectionViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension RelatedCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
//    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
