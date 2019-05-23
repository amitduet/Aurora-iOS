//
//  TextCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/15/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var discountProductCollectionView: UICollectionView!
    let discountProducts: [DiscountProduct] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, withDiscountProductList:[DiscountProduct]) -> DiscountCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! DiscountCollectionViewCell
        cell.backgroundColor = UIColor.green
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
    
}
