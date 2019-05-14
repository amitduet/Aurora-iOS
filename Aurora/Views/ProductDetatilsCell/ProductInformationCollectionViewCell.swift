//
//  ProductInformationCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/11/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ProductInformationCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var sizeGuideButton:UIButton!
    
    @IBOutlet weak var sizeViews: UIView!
    @IBOutlet weak var colorViews: UIView!
    @IBOutlet weak var sizeViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var colorViewsHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var sizeCollectionView:UICollectionView!
    @IBOutlet weak var colorsCollectionView:UICollectionView!
    
    var cellHeight:Float = 0.0
    
    
    var colors:NSMutableArray!
    var sizes:NSMutableArray!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellHeight = Float(self.frame.size.height)
        // Initialization code
        //CGFloat height = self.collectionView.collectionViewLayout.collectionViewContentSize.height;

    }
    
    @IBAction func sizeButtonPressed(_ sender: UIButton) {
    }
    
    func filterOption(options:[Option]){
        colors = NSMutableArray.init()
        sizes = NSMutableArray.init()

        for colorOption in options{
            switch colorOption.optionDescriptionName{
                case OptionDescriptionName.color:
                    colors.add(colorOption)
                break
                case OptionDescriptionName.size:
                    sizes.add(colorOption)
                break
            }
        }
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, options:[Option]) -> ProductInformationCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductInformationCollectionViewCell
        cell.filterOption(options: options)
        cell.sizeCollectionView.reloadData()
        cell.colorsCollectionView.reloadData()
        
        cell.cellHeight = cell.cellHeight - Float(cell.sizeViewHeightConstraint.constant) - Float(cell.colorViewsHeightConstraint.constant)

        cell.sizeViewHeightConstraint.constant = cell.sizeCollectionView.collectionViewLayout.collectionViewContentSize.height
        cell.colorViewsHeightConstraint.constant = cell.colorsCollectionView.collectionViewLayout.collectionViewContentSize.height
        
        cell.cellHeight = cell.cellHeight + Float(cell.sizeViewHeightConstraint.constant) + Float(cell.colorViewsHeightConstraint.constant)
        return cell
    }
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.sizeCollectionView){
            return self.sizes.count
        }else if (collectionView == self.colorsCollectionView){
            
            self.colorViewsHeightConstraint.constant = CGFloat((self.colors.count/3)*40)
            return self.colors.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.sizeCollectionView){
            let cell = SizeCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, option:self.sizes?[indexPath.row] as! Option)
            
            return cell
        }else {
            let cell = ColorCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, option: self.colors?[indexPath.row] as! Option)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100,height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (section > 3){
            return 0.0
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if (section > 3){
            return 0.0
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (section > 3){
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }


    
}
