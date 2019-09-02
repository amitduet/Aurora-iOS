//
//  CategoryTableViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/17/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet var categoryNameLabel:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    class func cellForTableView(tableView: UITableView, indexPath:IndexPath, category:Category) -> CategoryTableViewCell {
        let identifier = String(describing: self)
        
        tableView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CategoryTableViewCell
        cell.categoryNameLabel.text = category.name;
        return cell
    }

}
