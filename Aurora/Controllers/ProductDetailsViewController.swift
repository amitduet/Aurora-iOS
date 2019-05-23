//
//  ProductDetailsViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/24/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet var productDetatilsCollectionView:UICollectionView!
    public var productId:Int = 0
    var productDetatilsDto:ProductDetatilsDto!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProductDetatils()
    }
    

    //MARK: REQUEST TO PRODUCT DETATILES API CALL
    func fetchProductDetatils() {
        #warning("Hard coded value will remove ")
        self.productId = 30
        APIManager.init().getProductDeatiles(productId: self.productId, success: {  data in
            do {
                self.productDetatilsDto = try JSONDecoder().decode(ProductDetatilsDto.self, from: data)
                debugPrint(self.productDetatilsDto.aditionalImages)
                debugPrint(self.productDetatilsDto.productDetails.count)
                self.productDetatilsCollectionView.reloadData()
            }catch let error as NSError{
                debugPrint(error)
            }
        }) { error in
            debugPrint(error.localizedDescription)
        }
    }
    
    func gettotalNumberSection()->Int{
        var sectionNumber:Int = 0
        if (self.productDetatilsDto != nil){
            sectionNumber = sectionNumber + 1
            
            if (self.productDetatilsDto.options.count > 0){
                sectionNumber = sectionNumber + 1
            }
            if (self.productDetatilsDto.relatedProducts.count > 0){
                sectionNumber = sectionNumber + 1
            }
            
            if (self.productDetatilsDto.review.count > 0){
                sectionNumber = sectionNumber + 1
            }
        }
        return sectionNumber;
    }
    //MARK: Collection view delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (self.productDetatilsDto != nil){
            
            var numberOfRow:Int = 1;
            
            if (self.productDetatilsDto.review.count > 0){
                numberOfRow += 1
            }
            
            if (self.productDetatilsDto.relatedProducts.count > 0){
                numberOfRow += 1
            }
            
            if (self.productDetatilsDto.options.count > 0){
                numberOfRow += 1
            }
            return numberOfRow
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = ProductDescriptionCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, productDetatils: self.productDetatilsDto)
            return cell;
        case 1:
            let cell = RelatedCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, relatedProducts: self.productDetatilsDto.relatedProducts)
            return cell
        
        case 2:
            let cell = ProductReviewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, reviewList:self.productDetatilsDto.review, rating: self.productDetatilsDto.rating)
            return cell;
        default:
            let cell = ProductInformationCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, options: self.productDetatilsDto.options)
            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.width, height: CGFloat(cell.cellHeight))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        switch indexPath.row {
        case 0:
            return CGSize(width: width, height: 300)
        case 1:
            return CGSize(width: width, height: 400)
        case 2:
            return CGSize(width: width, height: 150)

           // return CGSize(width: width, height: 40)
        default:
            return CGSize(width: width, height: 400)
        }
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
