//
//  ProductDescriptionCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/24/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit
import CHIPageControl
import SDWebImage

class ProductDescriptionCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var sliderView:CHIPageControlJaloro!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var productNameLabel:UILabel!
    @IBOutlet weak var currentPriceLabel:UILabel!
    @IBOutlet weak var previousPriceLabel:UILabel!
    @IBOutlet weak var ratingNReviewLabel:UILabel!
    @IBOutlet weak var shareButton:UIButton!
    @IBOutlet weak var favsButton:UIButton!
    
    public var  sliders: [AditionalImage] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: BUTTON ACTION
    
    //MARK:CollectionView Delegate and Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SliderImageCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, bannerImage:sliders[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.sliderView.progress =  Double(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 200)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 5
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return 5
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    //    }
    
    //MARk:Page Changes
    
    @IBAction func pageChangesControllerAction(_ sender: CHIPageControlJaloro) {
        
        //        self.sliderCollectionView.scrollToItem(at: IndexPath.init(row: Int(sender.acti), section: 0), at:.centeredHorizontally, animated: true)
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, productDetatils:ProductDetatilsDto) -> ProductDescriptionCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductDescriptionCollectionViewCell
        cell.sliders = productDetatils.aditionalImages
        cell.sliderView.numberOfPages = cell.sliders.count
        cell.sliderCollectionView.reloadData()
        cell.productNameLabel.text = productDetatils.productDetails[0].name
        
        cell.currentPriceLabel.text = String(format:"%@ %@",productDetatils.productDetails[0].price,Global.takaUniCode)
            
        cell.previousPriceLabel.isHidden = true
//        if (productDetatils.productDetails[0].discountPrice != nil){
            cell.previousPriceLabel.isHidden = false

            if (productDetatils.productDetails[0].discountPrice is String){
                let price:String = (productDetatils.productDetails[0].discountPrice as? String)!
                let previousPriceString:String = String(format:"%@ %@",productDetatils.productDetails[0].price,Global.takaUniCode)
                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: price)
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                cell.currentPriceLabel.text = String(format:"%@ %@",price,Global.takaUniCode)
                cell.previousPriceLabel.attributedText = attributeString
            }
//        }
        cell.ratingNReviewLabel.text = String(format: "%0.2f/%d Reviews", (productDetatils.rating as NSString).doubleValue, productDetatils.review.count)
        
        return cell
    }

}
