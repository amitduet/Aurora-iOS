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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        APIManager.init().getProductCategories(categoryId: 59, success: { data in
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

}
