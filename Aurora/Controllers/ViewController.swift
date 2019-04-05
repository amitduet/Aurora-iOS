//
//  ViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/1/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

        APIManager.init().getAccessToken(success: { (token) in
            debugPrint(token)
            // store token
            
        }) { (error) in
        }
        
        APIManager.init().getHome(success: { data in
            
        }) { error in
            
            debugPrint(error.localizedDescription)
        }
        
        
    }


}

