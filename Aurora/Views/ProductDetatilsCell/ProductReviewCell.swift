//
//  ProductReviewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/7/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class ProductReviewCell: UICollectionViewCell {

    @IBOutlet weak var ratingLabel:UILabel!
    @IBOutlet weak var totalNumberOfBuyerVarified:UILabel!
    
    @IBOutlet weak var fiveStarProgressBar:UIProgressView!
    @IBOutlet weak var fourStarProgressBar:UIProgressView!
    @IBOutlet weak var threeStarProgressBar:UIProgressView!
    @IBOutlet weak var twoStarProgressBar:UIProgressView!
    @IBOutlet weak var singleStarProgressBar:UIProgressView!
    
    @IBOutlet weak var totalFiveStarLabel:UILabel!
    @IBOutlet weak var totalFourStarLabel:UILabel!
    @IBOutlet weak var totalThreeStarLabel:UILabel!
    @IBOutlet weak var totalTwoStarLabel:UILabel!
    @IBOutlet weak var totalSingleStarLabel:UILabel!
    
    @IBOutlet weak var allReviewsButton:UIButton!
    @IBOutlet weak var giveReviewButton:UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let yourAttributes : [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        
        let attributeString = NSMutableAttributedString(string: "See all reviews",
                                                        attributes: yourAttributes)
        allReviewsButton.setAttributedTitle(attributeString, for: .normal)
       
        
    
        let giveReviewAttribute : [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        
        let giveReviewAttributeString = NSMutableAttributedString(string: "Give your review",
                                                        attributes: giveReviewAttribute)

        giveReviewButton.setAttributedTitle(giveReviewAttributeString, for: .normal)


        // Initialization code
    }
    
    func filterByRatingNumber( reviewList:[Review], rating:Int) -> [Review]{
        
        let filteredReviewList:NSMutableArray =  NSMutableArray.init()

        for  review:Review in reviewList{
            if (review.rating == rating){
                filteredReviewList.add(review)
            }
        }
        return filteredReviewList as! [Review]
    }
    
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, reviewList:[Review], rating: Int) -> ProductReviewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductReviewCell
        
        cell.ratingLabel.text = String(format:"%ld",rating)
        //String(format: "%@getWishList",BASE_URL)
        cell.totalNumberOfBuyerVarified.text = String(format:"%ld Number of Buyers",reviewList.count)
        
        for ratingNumber in 1..<6 {
            
            let filteredReviewList:[Review] = cell.filterByRatingNumber(reviewList: reviewList,rating: ratingNumber)
            let progress = Float(filteredReviewList.count)/Float(reviewList.count)
            switch ratingNumber{
            case 5:
                cell.fiveStarProgressBar.progress = progress
                cell.totalFiveStarLabel.text = String (filteredReviewList.count)
                break
            case 4:
                cell.fourStarProgressBar.progress = progress
                cell.totalFourStarLabel.text = String (filteredReviewList.count)
                break
            case 3:
                cell.threeStarProgressBar.progress = progress
                cell.totalThreeStarLabel.text = String (filteredReviewList.count)
                break
            case 2:
                cell.twoStarProgressBar.progress = progress
                cell.totalTwoStarLabel.text = String (filteredReviewList.count)
                break
            case 1:
                cell.singleStarProgressBar.progress = progress
                cell.totalSingleStarLabel.text = String (filteredReviewList.count)
                break

            default:
                break
            }
            
        }

        
        return cell
    }
    

}
