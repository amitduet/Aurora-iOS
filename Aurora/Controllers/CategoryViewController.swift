//
//  CategoryViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/16/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var categoryTableView:UITableView!
    var categoryDto:CategoryDto!
    public var categoryId:NSInteger!
    
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
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()

        self.navigationController?.title = "Categories"
        APIManager.init().getProductCategories(categoryId: categoryId, success: { data in
            do {
                self.categoryDto = try JSONDecoder().decode(CategoryDto.self, from: data)
                debugPrint(self.categoryDto.category.count)
                self.categoryTableView.reloadData()
            }catch let error as NSError{
                debugPrint(error)
            }
        }) { error in
        }
    }
    
    //MARK: Button Action
    @objc func menuButtonDidTap()  {
        Global.menuAperar(viewController: self)
    }

    
    //MARK:UITableView DataSource and Delegate 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (categoryDto != nil){
            return categoryDto.category.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategoryTableViewCell.cellForTableView(tableView: tableView, indexPath: indexPath, category: categoryDto.category[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetatilsVC =  UIStoryboard.init(name: Global.STORY_BOARD_NAME, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: CategoryWiseProductViewController.self))as? CategoryWiseProductViewController
        productDetatilsVC?.productCategoryID = categoryDto.category[indexPath.row].categoryID
        self.navigationController?.pushViewController(productDetatilsVC!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }

}
