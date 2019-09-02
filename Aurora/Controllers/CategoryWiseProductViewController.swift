//
//  CategoryWiseProductViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/19/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class CategoryWiseProductViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    @IBOutlet weak var productCollectionView:UICollectionView!
    var productList:CategoryDetailsDto!
    public var productCategoryID:NSInteger!

    override func viewDidLoad() {
        super.viewDidLoad()
        getProductListByCategoryId()
    }
    
    //MARK: API Request
    func getProductListByCategoryId()  {
        APIManager.init().getCategoryProducts(categoryId: self.productCategoryID, success: { data in
            do {
                self.productList = try JSONDecoder().decode(CategoryDetailsDto.self, from: data)
                self.productCollectionView.reloadData()
            }catch let error as NSError{
                debugPrint(error)
            }
        }) { error in
        }
    }
    
    //MARK: UICollectionview Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.productList == nil){
            return 0
        }
        return self.productList.productByCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ListProductCollectionViewCell.cellCategoryDetatils(collectionView: collectionView, indexPath: indexPath, product: self.productList.productByCategory[indexPath.row]) as ListProductCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let heightRatio:CGFloat = 0.47385
        
        return CGSize(width: (view.frame.width - 20), height: ((view.frame.width - 20)*heightRatio))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }


}
