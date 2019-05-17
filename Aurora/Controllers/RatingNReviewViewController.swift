//
//  RatingNReviewViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/14/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class RatingNReviewViewController: UIViewController {

    @IBOutlet weak var productImageView:UIImageView!
    @IBOutlet weak var productTitleLabel:UILabel!
    @IBOutlet weak var productCurrentPriceLabel:UILabel!
    @IBOutlet weak var productPreviousPriceLabel:UILabel!
    
    @IBOutlet weak var warningView:UIView!
    @IBOutlet weak var reviewView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
