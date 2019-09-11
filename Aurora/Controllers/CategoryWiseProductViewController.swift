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
    @IBOutlet weak var listButton:UIButton!
    @IBOutlet weak var gridButton:UIButton!
    @IBOutlet weak var filterButton:UIButton!
    @IBOutlet weak var sortButton:UIButton!
    
    @IBOutlet weak var sortView:UIView!
    
    @IBOutlet weak var newSortButton:UIButton!
    @IBOutlet weak var popularitySortButton:UIButton!
    @IBOutlet weak var lowPriceSortButton:UIButton!
    @IBOutlet weak var highPriceSortButton:UIButton!
    
    var productList:CategoryDetailsDto!
    public var productCategoryID:NSInteger!

    @objc func menuButtonDidTap(){
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductListByCategoryId()
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 25))
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backButton)]
        defaultSortSet()
        sortView.layer.zPosition = 1
    }
    
    func defaultSortSet (){
        let index = 1
        switch  index{
        case 1:
            newSortButton.isSelected = true
            break
        case 2:
            popularitySortButton.isSelected = true
            break
        case 3:
            lowPriceSortButton.isSelected = true
            break
        case 4:
            highPriceSortButton.isSelected = true
            break
        default:
            break
        }
    }
    
    //MARK: Sort product list
    
    func sortProductList(selectedIndex:Int){
        if (self.productList != nil){
            switch  selectedIndex{
            case 1:
                self.productList.productByCategory = self.productList.productByCategory.sorted(by: { $0.productID > $1.productID })

                break
            case 2:
                self.productList.productByCategory = self.productList.productByCategory.sorted(by: { $0.review >  $1.review })

                break
            case 3:
                self.productList.productByCategory = self.productList.productByCategory.sorted(by: { $0.price.floatValue < $1.price.floatValue  })
                break
            default:
                self.productList.productByCategory = self.productList.productByCategory.sorted(by: { $0.price.floatValue > $1.price.floatValue  })
                break
            }
            self.productCollectionView.reloadData()
        }

    }
    
    //MARK: UIButton Action
    @IBAction func sortsButtonPressed(_ sender:UIButton){
        
        for subView in sortView.subviews{
            if subView is UIButton{
                let subViewButton:UIButton = subView as! UIButton
                if (sender == subView){
                    sender.isSelected = true
                }else{
                   subViewButton.isSelected = false
                }
            }
        }
        
        self.sortProductList(selectedIndex: sender.tag)

    }
    
    @IBAction func listButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func gridButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        let productDetatilsVC =  UIStoryboard.init(name: Global.STORY_BOARD_NAME, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: FilterViewController.self))as? FilterViewController
        productDetatilsVC?.productCategoryID = productCategoryID
        self.navigationController?.pushViewController(productDetatilsVC!, animated: true)
    }
    
    @IBAction func sortButtonPressed(_ sender: UIButton) {
        sortView.isHidden = !sortView.isHidden
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

extension String {
//    var floatValue: Float {
//        return (self as NSString).floatValue
//    }
}

