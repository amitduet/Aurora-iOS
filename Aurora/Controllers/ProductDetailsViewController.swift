//
//  ProductDetailsViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/24/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    public var productId:Int = 0
    var productDetatilsDto:ProductDetatilsDto!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProductDetatils()
    }
    

    //MARK: REQUEST TO PRODUCT DETATILES API CALL
    
    func fetchProductDetatils() {
        
        APIManager.init().getProductDeatiles(productId: self.productId, success: {  data in
            do {
                
                self.productDetatilsDto = try JSONDecoder().decode(ProductDetatilsDto.self, from: data)
                debugPrint(self.productDetatilsDto.aditionalImages)
                debugPrint(self.productDetatilsDto.productDetails.count)
//                self.productionCollectionView.reloadData()
            }catch let error as NSError{
                debugPrint(error)
            }
        }) { error in
            debugPrint(error.localizedDescription)
        }
    }
    

}
