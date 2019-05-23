//
//  SignInViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/18/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func facebookLoginAction(_ sender:UIButton){
        
        // facebooks
        //https://www.youtube.com/watch?v=7R3DLfLkhtc
        
        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile,.email], viewController: self) { (result) in
            
            switch result{
            case .cancelled:
                    debugPrint("use cancel")
                break
            case .success(let granted, let declined, let token):
                debugPrint("Access token == \(token)")
                
                break
            case .failed(let error):
                debugPrint(error.localizedDescription)
                break
            }
            
        }
        
    }
    
    @IBAction func googleSiginButtonAction(_ sender:UIButton){
        
        // https://www.youtube.com/watch?v=jAUPRAMSc6c
        
        //google Sign in client id 819439700590-9jq8sn0426f756n69anip86o2ivs1ofo.apps.googleusercontent.com
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
