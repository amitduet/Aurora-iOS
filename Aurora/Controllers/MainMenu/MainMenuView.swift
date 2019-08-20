//
//  MainMenuViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 6/27/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit
protocol MenuDelegate {
    func didSelectCategory(categoryId:Int)
    func didSelectUserInAcitvites(activitesId:Int)
    func didSelectAppSupport(supportId:Int)
    func didSelectSignOutButton()
}

class MainMenuView: UIView,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var menuTable: UITableView?
    @IBOutlet var leftewView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    var userName:String?
    let numberOfSection = 3
    var delegate:MenuDelegate?
    
    var isLogin = false{
        didSet{
            if (isLogin){
                headerTitleLabel.text = "Hello, \(String(describing: userName))"
            }else{
                let loginTitle = "Login/SignUp to \nsave, shop and view orders"
                let textRange = NSMakeRange(0, loginTitle.count)
                let attributedText = NSMutableAttributedString(string: loginTitle)
                attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
                
                headerTitleLabel.attributedText = attributedText
            }
        }
    }
    
    let userRelatedList:[String] = ["Wishlist","My Account","My Shopping Cart","My Purchase History"]
    let appInformationList:[String] = ["About Us","Contact Us","Help & FAQ","Rate our Apps"]

    
    //MARK:UITableView DataSource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return APIManager.init().getCategoryList().count
        default:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let categorylist:[MainCategory] = APIManager.init().getCategoryList()
            let mainCategory:MainCategory = categorylist[indexPath.row]
            
            let currentCategoryId = APIManager.init().getCategoryId()
            var isCurrentCategory = false
            
            if (currentCategoryId == mainCategory.categoryID){
                isCurrentCategory = true
            }
            let cell = MenuTableViewCell.cellForTableView(tableView: tableView, indexPath: indexPath, title: mainCategory.name, isCurrentCategory:isCurrentCategory) as MenuTableViewCell
            return cell
        case 1:
            let cell = MenuTableViewCell.cellForTableView(tableView: tableView, indexPath: indexPath, title: userRelatedList[indexPath.row], isCurrentCategory:false) as MenuTableViewCell
            return cell

        default:
            let cell = MenuTableViewCell.cellForTableView(tableView: tableView, indexPath: indexPath, title: appInformationList[indexPath.row], isCurrentCategory:false) as MenuTableViewCell
            return cell
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let categorylist:[MainCategory] = APIManager.init().getCategoryList()
            let mainCategory:MainCategory = categorylist[indexPath.row]
            
            let currentCategoryId = APIManager.init().getCategoryId()
            
            if (currentCategoryId != mainCategory.categoryID){
                APIManager.init().setCurrentCategort(selectedCategoryId: mainCategory.categoryID)
                delegate?.didSelectCategory(categoryId: mainCategory.categoryID)
            }
        case 1:
            debugPrint("")
            delegate?.didSelectUserInAcitvites(activitesId: indexPath.row)
            
        default:
            delegate?.didSelectAppSupport(supportId: indexPath.row)
        }
        menuDisApearAction()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func menuApearAnimation(){
        UIView.animate(withDuration: 0.75, animations: {
            self.frame = CGRect(origin: CGPoint(x:0, y: self.frame.origin.y), size: self.frame.size)
        }) { _ in
           
        }
    }
    
    func menuDisApearAction(){
        UIView.animate(withDuration: 1, animations: {
            self.frame = CGRect(origin: CGPoint(x: -self.frame.size.width*2, y: self.frame.origin.y), size: self.frame.size)
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    //MARK: Touch Delegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        menuDisApearAction()
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

