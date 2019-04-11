//
//  HomeCategoryViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/9/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var splashView: UIView!
    @IBOutlet weak var splashImageView:UIImageView!
    
    public var splashImageName:String!
    public var mainCategoryId:Int = 0
    
//    public func initWithViewController(imageName:String,)
    
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
        
                APIManager.init().getHome(categoryId:self.mainCategoryId, success: { data in
        
                    do {

                        let homeCategory = try JSONDecoder().decode(HomeDto.self, from: data)
                    }catch let error as NSError{
                        debugPrint(error)
                    }

                }) { error in
        
                    debugPrint(error.localizedDescription)
                }


        // Do any additional setup after loading the view.
    }
    
}
