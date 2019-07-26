//
//  WishListViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/24/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    @IBOutlet weak var productCollectionView:UICollectionView!
    var wishListDto:WishListDto!
    public var productCategoryID:NSInteger!

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

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        getWishListAPIRequest()
    }
    
    //MARK: Button Action
    @objc func menuButtonDidTap()  {
        Global.menuAperar(viewController: self)
    }

    //MARK: API Request
    func getWishListAPIRequest()  {
        APIManager.init().getWishList(customerId: 1,  success: { data in
            do {
                self.wishListDto = try JSONDecoder().decode(WishListDto.self, from: data)
                self.productCollectionView.reloadData()
            }catch let error as NSError{
                debugPrint(error)
            }
        }) { error in
        }
    }
    
    //MARK: UICollectionview Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.wishListDto == nil){
            return 0
        }
        return self.wishListDto.wishList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ListProductCollectionViewCell.wishListCellForCollectionView(collectionView: collectionView, indexPath: indexPath, product: self.wishListDto.wishList[indexPath.row]) as ListProductCollectionViewCell
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
