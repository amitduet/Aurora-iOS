//
//  HeaderViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 8/25/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
   // func toggleSection(header: HeaderViewCell, section: Int)
    func toggleSection (button:UIButton)
}

class HeaderViewCell: UITableViewHeaderFooterView {
    
    var section: Int = 0
    weak var delegate: HeaderViewDelegate!
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var arrowLabel: UIImageView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var ButtonToShowHide: UIButton!
    @IBOutlet weak var cellButton: UIButton!

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellButton.addTarget(self, action: #selector(self.headerCellButtonPressed(sender:)), for: .touchUpInside)

//        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
//        lineView.backgroundColor = GlobalData.Credentials.defaultTextColor
    }
    
    @objc func headerCellButtonPressed(sender: UIButton){
        self.delegate.toggleSection(button: self.ButtonToShowHide)

    }

}

// For animate your section
extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
//        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
}
