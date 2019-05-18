//
//  OnSaleProductsCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/17/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class OnSaleProductsCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var discountProductCollectionView: UICollectionView!
    var discountProducts: [DiscountProduct] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, withDiscountProductList:[DiscountProduct]) -> OnSaleProductsCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! OnSaleProductsCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.discountProducts = withDiscountProductList
        cell.discountProductCollectionView.reloadData()
        return cell
    }
    
    //MARK
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.discountProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ProductCollectionViewCell.discountCellForCollectionView(collectionView: collectionView, indexPath: indexPath, discountProduct: self.discountProducts[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
            let height =  (width - 15)/2 * 1.34
            return CGSize(width: (width - 15)/2, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (section > 3){
            return 0.0
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if (section > 3){
            return 0.0
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (section > 3){
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    
}
