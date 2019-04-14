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
    @IBOutlet weak var splashImageView:UIImageView!
    @IBOutlet weak var productionCollectionView:UICollectionView!
    
    public var splashImageName:String!
    public var mainCategoryId:Int = 0

    public var homeDataDto:HomeDto!
    
    public func splashScreenUISetUp(imageName:String){
        self.splashImageView.image = UIImage.init(named: imageName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(true)
        self.splashImageView.image = UIImage.init(named: splashImageName)

        DispatchQueue.main.asyncAfter(deadline:.now() + 1) {
            self.splashView.isHidden = true
            self.navigationController?.isNavigationBarHidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHomeCategoryRequest()
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
    
    //MARK:UICollectionView Data Source and Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (homeDataDto != nil){
            return 2;
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = OfferSLiderCollectionViewCell.cellForCollectionView(collectionView: self.productionCollectionView, indexPath: indexPath, sliders: homeDataDto.sliders)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: 200)
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
