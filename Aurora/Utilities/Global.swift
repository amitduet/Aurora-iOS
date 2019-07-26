//
//  Global.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/3/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class Global: NSObject {

    static let FONTNAME_LIGHT_ITALIC = "Averta-LightItalic"
    static let FONTNAME_SEMIBOLD = "Averta-Semibold"
    static let FONTNAME_REGULAR = "Averta-Regular"

    static let STORY_BOARD_NAME = "Main"
    static let takaUniCode = "\u{09F3}"
    
    static let cellBorderColor = "9B9B9B"
    static let cellBorderWidth = 1.0
    static let previousPriceColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.6)

    class func stikeThroughPrice(previousPrice:Float) ->  NSAttributedString{
        
        let strokeEffect: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strikethroughColor:previousPriceColor,
        ]
        
        let strokeString = NSAttributedString(string: String(format:"%0.0f%@",previousPrice,Global.takaUniCode), attributes: strokeEffect)
        return strokeString
    }
    
    class func menuAperar (viewController:UIViewController){
        let menuView:MainMenuView = MainMenuView.fromNib()
        menuView.frame = CGRect(origin: CGPoint(x: -viewController.view.frame.size.width*2, y: viewController.view.frame.origin.y), size: viewController.view.frame.size)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.addSubview(menuView)
        menuView.isLogin = false
        menuView.menuApearAnimation()
    }
    
//    class func setUpNavigationBar (viewController:UIViewController){
//            let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 25))
//            backButton.setImage(UIImage(named: "nav_drawer"), for: .normal)
//        backButton.addTarget(viewController, action:#selector(viewController.menuButtonDidTap), for: .touchUpInside)
//        //    backButton.addTarget(viewController, action: #selector(viewController.menuButtonDidTap), for: .touchUpInside)
//            
//            let logoText = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 25))
//            logoText.setImage(UIImage(named: "Title"), for: .normal)
//            logoText.isUserInteractionEnabled = false
//            
//            let navSearchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 27, height: 25))
//            navSearchButton.setImage(UIImage(named: "nav_Search"), for: .normal)
//            
//            let searchBarButton = UIBarButtonItem(customView: navSearchButton)
//            
//            let navStoreButton = UIButton(frame: CGRect(x: 0, y: 0, width: 27, height: 25))
//            navStoreButton.setImage(UIImage(named: "nav_addtoCard"), for: .normal)
//            
//            let storeBarButton = UIBarButtonItem(customView: navStoreButton)
//            let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
//            space.width = 10
//            viewController.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backButton), UIBarButtonItem(customView: logoText) ]
//            viewController.navigationItem.rightBarButtonItems = [space, searchBarButton,space, storeBarButton]
//
//    }
//

//    extension NameDescribable {
//        var typeName: String {
//            return String(describing: type(of: self))
//        }
//        
//        static var typeName: String {
//            return String(describing: self)
//        }
//    }

}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    public var withoutHtml: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }
    
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }
        
        return attributedString.string
    }
    
    public var removeNewLineTag:String{
        
        return self.replacingOccurrences(of: "\n", with: " ", options: .literal, range: nil)

    }

}



