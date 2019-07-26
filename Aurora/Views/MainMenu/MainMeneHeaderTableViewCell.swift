//
//  MainMeneHeaderTableViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 6/27/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class MainMeneHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerTitleLabel: UILabel!
    var userName:String?
    
    var isLogin = false{
        didSet{
            if (isLogin){
                headerTitleLabel.text = "Hello, \(String(describing: userName))"
            }else{
                let loginTitle = "Login/SignUp to \nsave, shop and view orders"
                let textRange = NSMakeRange(0, loginTitle.count)
                let attributedText = NSMutableAttributedString(string: loginTitle)
                attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
                
                headerTitleLabel.attributedText = attributedText
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
