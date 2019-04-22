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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
