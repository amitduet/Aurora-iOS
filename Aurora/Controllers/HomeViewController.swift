//
//  HomeCategoryViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/9/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,DiscountProductDelegate {

    @IBOutlet weak var splashView: UIView!
    var splashImageView:UIImageView!
    @IBOutlet weak var productionCollectionView:UICollectionView!
    
    public var splashImageName:String!
    public var mainCategoryId:Int = 0
    public var homeDataDto:HomeDto!
    
    public func splashScreenUISetUp(imageName:String){
        self.splashImageView.image = UIImage.init(named: imageName)
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
    
    fileprivate func setUpNavigationBar() {
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 25))
        backButton.setImage(UIImage(named: "nav_drawer"), for: .normal)
        backButton.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)
        
        let logoText = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 25))
        logoText.setImage(UIImage(named: "Title"), for: .normal)
        logoText.isUserInteractionEnabled = false
        
        let navSearchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 27, height: 25))
        navSearchButton.setImage(UIImage(named: "nav_Search"), for: .normal)
        
        let searchBarButton = UIBarButtonItem(customView: navSearchButton)
        
        let navStoreButton = UIButton(frame: CGRect(x: 0, y: 0, width: 27, height: 25))
        navStoreButton.setImage(UIImage(named: "nav_addtoCard"), for: .normal)
        
        let storeBarButton = UIBarButtonItem(customView: navStoreButton)
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 10
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backButton), UIBarButtonItem(customView: logoText) ]
        self.navigationItem.rightBarButtonItems = [space, searchBarButton,space, storeBarButton]
    }
    
    //MARK: View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
  
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        fetchHomeCategoryRequest()
        splashViewShow()
    }
    
    //MARK: Button Action
    @objc func menuButtonDidTap()  {
        Global.menuAperar(viewController: self)
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
            let cell = OnSaleProductsCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath,  withDiscountProductList:self.homeDataDto.discountProducts, delegate: self)
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
            return CGSize(width: width, height: 400)
        default:            
            let height =  (width - 15)/2 * 1.34
            return CGSize(width: (width - 15)/2, height:height)
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
            let latestProduct = homeDataDto.latestProducts[indexPath.row-3]
            navigateToProductDetails(productId: latestProduct.productID);
        }
    }
    
    func navigateToProductDetails(productId: String) {
        let productDetatilsVC =  UIStoryboard.init(name: Global.STORY_BOARD_NAME, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: ProductDetailsViewController.self))as? ProductDetailsViewController
        productDetatilsVC?.productId = productId
        self.navigationController?.pushViewController(productDetatilsVC!, animated: true)

    }

}
