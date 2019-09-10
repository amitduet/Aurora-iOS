//
//  CategoryViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/16/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MenuDelegate,HeaderViewDelegate {
    
    var collapaseHandlerArray = [Int]()

    @IBOutlet var categoryTableView:UITableView!
    var categoryDto:CategoryDto!
    var numberOfSubCategory:Int = 0
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
        let headerNib = UINib.init(nibName: "HeaderViewCell", bundle: Bundle.main)
        categoryTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderViewCell")

//        self.navigationController?.title = "Categories"
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
        Global.menuAperar(viewController: self).delegate = self
    }

    func numberOfSubCategory(categoryId:Int)->NSArray{
        let subCategories:NSMutableArray = NSMutableArray.init()
        
        for category in self.categoryDto.subCategory{
            if category.parentID == categoryId{
                subCategories.add(category)
            }
        }
        
        return subCategories
    }
    //MARK:UITableView DataSource and Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if (categoryDto != nil){
            return self.categoryDto.category.count
        }
        return 0
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (categoryDto != nil){
            if self.collapaseHandlerArray.contains(section){
                let category:Category = categoryDto.category[section]
                let subCategories =  numberOfSubCategory(categoryId: category.categoryID)
                return subCategories.count
            }
            else{
                return 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let category:Category = categoryDto.category[indexPath.section]
        let subCategories =  numberOfSubCategory(categoryId: category.categoryID)

        if (subCategories.count > 0){
            let cell = CategoryTableViewCell.cellForTableView(tableView: tableView, indexPath: indexPath, category: subCategories[indexPath.row] as! Category)
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let category:Category = categoryDto.category[indexPath.section]
        let subCategories =  numberOfSubCategory(categoryId: category.categoryID)
        let subCategory = subCategories[indexPath.row] as! Category
        
        let productDetatilsVC =  UIStoryboard.init(name: Global.STORY_BOARD_NAME, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: CategoryWiseProductViewController.self))as? CategoryWiseProductViewController
        productDetatilsVC?.productCategoryID = subCategory.categoryID
        self.navigationController?.pushViewController(productDetatilsVC!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewCell") as! HeaderViewCell
        headerView.delegate = self
        let category:Category = categoryDto.category[section]
        headerView.titleLabel?.text = category.name
        if (numberOfSubCategory(categoryId: category.categoryID).count == 0){
            headerView.ButtonToShowHide.isHidden = true
        }
        
        if self.collapaseHandlerArray.contains(section){//if its opened
            headerView.ButtonToShowHide.setImage(UIImage.init(named: "up-arrow"), for: .normal)
        }else{ //if closed
            headerView.ButtonToShowHide.setImage(UIImage.init(named: "down-arrow"), for: .normal)
        }
        headerView.ButtonToShowHide.tag = section
        headerView.ButtonToShowHide.addTarget(self, action: #selector(self.HandleheaderButton(sender:)), for: .touchUpInside)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
     @objc func HandleheaderButton(sender: UIButton){
        
        let category:Category = categoryDto.category[sender.tag]

        if (numberOfSubCategory(categoryId: category.categoryID).count == 0){
            let productDetatilsVC =  UIStoryboard.init(name: Global.STORY_BOARD_NAME, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: CategoryWiseProductViewController.self))as? CategoryWiseProductViewController
            productDetatilsVC?.productCategoryID = category.categoryID
            self.navigationController?.pushViewController(productDetatilsVC!, animated: true)
        }else{
            if let buttonTitle = sender.image(for: .normal) {
                if buttonTitle == UIImage.init(named: "down-arrow"){
                    //if yes
                    self.collapaseHandlerArray.append(sender.tag)
                    sender.setImage(UIImage.init(named: "down-arrow"), for: .normal)
                }
                else {
                    //if no
                    while self.collapaseHandlerArray.contains(sender.tag){
                        if let itemToRemoveIndex = self.collapaseHandlerArray.firstIndex(of: sender.tag) {
                            //remove title of header from array
                            self.collapaseHandlerArray.remove(at: itemToRemoveIndex)
                            sender.setImage(UIImage.init(named: "down-arrow"), for: .normal)
                            
                        }
                    }
                }
            }
            self.categoryTableView.reloadSections(IndexSet(integer: sender.tag), with: .none)
        }
    }
    
    func toggleSection (button:UIButton){
        HandleheaderButton(sender: button)
    }

    //MARK: Menu Delgate
    func didSelectCategory(categoryId: Int) {
        
        let productDetatilsVC =  UIStoryboard.init(name: Global.STORY_BOARD_NAME, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: CategoryWiseProductViewController.self))as? CategoryWiseProductViewController
        productDetatilsVC?.productCategoryID = categoryId
        self.navigationController?.pushViewController(productDetatilsVC!, animated: true)
    }
    
    func didSelectUserInAcitvites(activitesId: Int) {
        
    }
    
    func didSelectAppSupport(supportId: Int) {
        
    }
    
    func didSelectSignOutButton() {
        
    }

}
