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
import GoogleSignIn

class SignInViewController: UIViewController,GIDSignInUIDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!

//    let googleSiginButton = GIDSignInButton(frame: CGRect(x: 10, y: 10, width: 100, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
//        googleSiginButton.center = self.view.center
//        self.view.addSubview(googleSiginButton)
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
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }

    
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            // ...
        } else {
           debugPrint(error.localizedDescription)
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            return
        }
        
//        guard let authentication = user.authentication else { return }
//        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
//                                                       accessToken: authentication.accessToken)
        // ...
    }

    
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        //myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }

}
