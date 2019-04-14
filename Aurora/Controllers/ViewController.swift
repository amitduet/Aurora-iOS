//
//  ViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/1/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appIconImageView: UIImageView!
    
    @IBOutlet weak var mainCategoryHolderView: UIView!
    @IBOutlet weak var categoryLoadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var firstCategoryButton: UIButton!
    
    @IBOutlet weak var secondCategoryButton: UIButton!
    
    @IBOutlet weak var thirdCategoryButton: UIButton!
    @IBOutlet weak var titleLabel:UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        APIManager.init().getJWT(completion: {token  in
//            debugPrint(token!)
//        })
        
        
        /*
         getPostList(success: { data in
         do {
         let userList = try JSONDecoder().decode(UserList.self, from: data)
         debugPrint(userList[0].body)
         debugPrint(userList[0].title)
         debugPrint(userList[0].userID)
         debugPrint(userList[0].title)
         
         } catch let error as NSError{
         debugPrint(error)
         }
         }) { error in
         
         }

         */

//        APIManager.init().getAccessToken(success: { (token) in
//            debugPrint(token)
//            // store token
//            
//        }) { (error) in
//        }
        
//        APIManager.init().getFirstLoadData(success: { response in
//            let userList = try JSONDecoder().decode(MainCategoryDto.self, from: data)
//
//
//        }) { error in
//
//        }
        
        debugPrint(UIFont.familyNames)

        APIManager.init().getFirstLoadData(success: { (data) in

            do {
                let mainCategoryDto = try JSONDecoder().decode(MainCategoryDto.self, from: data)
                var index:NSInteger = 1;
                for mainCategory in mainCategoryDto.mainCategories{
                    self.categoryLoadingIndicator.stopAnimating()
                    debugPrint(mainCategory.name)
                    debugPrint(mainCategory.categoryID)
                    var button:UIButton!
                    self.titleLabel.alpha = 1.0
                    self.titleLabel.textColor = UIColor.black
                    self.titleLabel.font = UIFont.init(name: Global.FONTNAME_LIGHT_ITALIC, size: 14)

                    switch (index){
                    case 1:
                        button = self.firstCategoryButton
                        break
                    case 2:
                        button = self.secondCategoryButton
                        break
                    case 3:
                        button = self.thirdCategoryButton
                        break
                    default:
                        break
                    }
                    button.alpha = 1.0;
                    self.categoryButtonSet(tag: mainCategory.categoryID, title: mainCategory.name, categoryButton: button)
                    index = index+1
                }
            
            } catch let error as NSError{
                debugPrint(error)
            }
            
        }) { (Error) in
            
        }
        
        
        
    }
    

    func categoryButtonSet(tag:NSInteger,title:String, categoryButton:UIButton) -> Void {
        
        categoryButton.tag = tag
        categoryButton.layer.cornerRadius = categoryButton.frame.height/2;
        categoryButton.layer.masksToBounds = true
        categoryButton.backgroundColor = .black
        categoryButton.setTitle(title, for: .normal)
        categoryButton.titleLabel?.font = UIFont.init(name: Global.FONTNAME_SEMIBOLD, size: 20)

        categoryButton.backgroundColor = .white
        categoryButton.layer.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
        categoryButton.layer.borderWidth = 1
        categoryButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        categoryButton.addTarget(self, action:#selector(categoryButtonPressed(_:)), for: .touchUpInside)
        }
    
    @objc func categoryButtonPressed(_ sender: UIButton?) {
        print("Button Clicked%ld",sender?.tag)
        
        let homeViewController = UIStoryboard.init(name: Global.STORY_BOARD_NAME, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: HomeViewController.self))as? HomeViewController
        homeViewController?.splashImageName = (sender?.titleLabel?.text?.lowercased())!
        homeViewController?.mainCategoryId = sender!.tag
        self.navigationController?.pushViewController(homeViewController!, animated: true)
    }

    
    func categoryUISetup() -> Void {
        let categoryButton = UIButton()
        categoryButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        categoryButton.backgroundColor = .white
        self.view = categoryButton
        
        categoryButton.layer.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
        categoryButton.layer.cornerRadius = 40
        categoryButton.layer.borderWidth = 1
        categoryButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
       // let parent = self.view!
        self.view.addSubview(categoryButton)
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        categoryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        categoryButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        categoryButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 455).isActive = true

    }

}

