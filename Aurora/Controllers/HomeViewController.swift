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

        // Do any additional setup after loading the view.
    }
    
}
