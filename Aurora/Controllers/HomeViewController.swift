//
//  HomeCategoryViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/9/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var splashView: UIView!
    var splashImageView:UIImageView!
    @IBOutlet weak var productionCollectionView:UICollectionView!
    
    public var splashImageName:String!
    public var mainCategoryId:Int = 0

    public var homeDataDto:HomeDto!
    
    public func splashScreenUISetUp(imageName:String){
        self.splashImageView.image = UIImage.init(named: imageName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false

    }

    func splashViewShow() {
        self.navigationController?.isNavigationBarHidden = true
        
        let window = UIApplication.shared.windows.first;
        self.splashImageView = UIImageView.init(frame: window!.frame)
        
        self.splashImageView.image = UIImage.init(named: splashImageName)
        
        window?.addSubview(self.splashImageView)
        DispatchQueue.main.asyncAfter(deadline:.now() + 3) {
            self.splashView.alpha = 0.0
            self.splashImageView.alpha = 0.0
            self.navigationController?.isNavigationBarHidden = false
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHomeCategoryRequest()
        splashViewShow()
    }
    
    //MARK: API Request
    func fetchHomeCategoryRequest(){
        APIManager.init().getHome(categoryId:self.mainCategoryId, success: { data in
            do {
                self.homeDataDto = try JSONDecoder().decode(HomeDto.self, from: data)
                debugPrint(self.homeDataDto.discountBanner)
                debugPrint(self.homeDataDto.sliders)
                self.productionCollectionView.reloadData()
            }catch let error as NSError{
                debugPrint(error)
            }
        }) { error in
            debugPrint(error.localizedDescription)
        }
    }
    
    func calculateNumberOfSection() -> NSInteger {
        
        var numberOfSection :NSInteger = 0;
        if (homeDataDto.sliders.count > 0){
                numberOfSection += 1
        }
        
        if (homeDataDto.discountBanner.count > 0){
            numberOfSection += 1
        }

//        if (homeDataDto.discountProducts.count > 0){
//            numberOfSection += homeDataDto.discountProducts.count  + 1
//        }

        if (homeDataDto.latestProducts.count > 0){
            numberOfSection += homeDataDto.latestProducts.count  + 1
        }
        

        return numberOfSection
    }
    
    //MARK:UICollectionView Data Source and Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (homeDataDto != nil){
            return calculateNumberOfSection();
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = OfferSLiderCollectionViewCell.cellForCollectionView(collectionView: self.productionCollectionView, indexPath: indexPath, sliders: homeDataDto.sliders)
            return cell
        case 1:
            let cell = SliderImageCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, bannerImage:self.homeDataDto.discountBanner[0].image)
            return cell
        case 2:
            let cell = OnSaleProductsCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath,  withDiscountProductList:self.homeDataDto.discountProducts)
            return cell
        
        default:
            let cell = ProductCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, newlyArrived: self.homeDataDto!.latestProducts[indexPath.row-3])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let width = view.frame.width
        switch indexPath.row {
        case 0:
            return CGSize(width: width, height: 200)
        case 1:
            return CGSize(width: width, height: 100)
        case 2:
            return CGSize(width: width, height: 300)
        default:
            return CGSize(width: (width - 15)/2, height: (width - 15)/2)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (indexPath.row > 2){
            let newlyArrived = homeDataDto.newlyArrived[indexPath.row-3]
            debugPrint("Go to Product Detatils %ld",newlyArrived.productID)
            
            let productDetatilsVC =  UIStoryboard.init(name: Global.STORY_BOARD_NAME, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: ProductDetailsViewController.self))as? ProductDetailsViewController
            productDetatilsVC?.productId = newlyArrived.productID
            self.navigationController?.pushViewController(productDetatilsVC!, animated: true)
        }
    }
    

    
}
