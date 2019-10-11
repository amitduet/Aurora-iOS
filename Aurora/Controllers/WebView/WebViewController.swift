//
//  WebViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 9/19/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    
    public var supportActionType:Int = 0
    
    @objc func menuButtonDidTap(){
        self.navigationController?.popViewController(animated: true)
    }

    fileprivate func setUpNavigationBar() {
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 25))
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backButton)]

        let logoText = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 25))
        logoText.setImage(UIImage(named: "Title"), for: .normal)
        logoText.isUserInteractionEnabled = false
        
        let navSearchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 27, height: 25))
        navSearchButton.setImage(UIImage(named: "nav_Search"), for: .normal)
        
        let searchBarButton = UIBarButtonItem(customView: navSearchButton)
        
        let navStoreButton = UIButton(frame: CGRect(x: 0, y: 0, width: 27, height: 25))
        navStoreButton.setImage(UIImage(named: "nav_addtoCard"), for: .normal)
        
        let storeBarButton = UIBarButtonItem(customView: navStoreButton)
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 10
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backButton), UIBarButtonItem(customView: logoText) ]
        self.navigationItem.rightBarButtonItems = [space, searchBarButton,space, storeBarButton]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        let webView = WKWebView()
        self.view = webView
    
        var urlString:String = ""
        
        switch supportActionType {
        case 0:
            urlString = "https://aurorafashionbd.com/about_Aurora"
            break
        case 1:
            urlString = "https://aurorafashionbd.com/contact"
            break
        case 2:
            urlString = "https://aurorafashionbd.com/privacy"
            break
        default:
            urlString = "https://aurorafashionbd.com/cancellation_return_refund"
            break
        }
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

