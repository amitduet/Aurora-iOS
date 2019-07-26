//
//  MenuTableViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 7/24/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var menuTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            if backgroundColor != nil && backgroundColor!.cgColor.alpha == 0 {
                backgroundColor = oldValue
            }
        }
    }
    
    class func cellForTableView(tableView: UITableView, indexPath:IndexPath, title:String, isCurrentCategory:Bool) -> MenuTableViewCell {
        let identifier = String(describing: self)
        
        tableView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MenuTableViewCell
        cell.menuTitleLabel.text = title
        if (isCurrentCategory){
            cell.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.9)
            cell.menuTitleLabel.textColor = .white
        }else{
            cell.backgroundColor = .white
            cell.menuTitleLabel.textColor = .black
        }
        return cell
    }
    
}
