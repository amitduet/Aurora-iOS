//
//  CategoryViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/16/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    var categoryDto:CategoryDto!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        APIManager.init().getProductCategories(categoryId: 59, success: { data in
            do {
                self.categoryDto = try JSONDecoder().decode(CategoryDto.self, from: data)
                debugPrint(self.categoryDto.category.count)
            }catch let error as NSError{
                debugPrint(error)
            }

        }) { error in
            
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
