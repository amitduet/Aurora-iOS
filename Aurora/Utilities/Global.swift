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



