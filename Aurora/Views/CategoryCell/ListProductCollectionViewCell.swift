//
//  ListProductCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/17/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit
import MBProgressHUD


class ListProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var productImageView:UIImageView!
    @IBOutlet var productCurrentPriceLabel:UILabel!
    @IBOutlet var productPreviousPriceLabel:UILabel!
    @IBOutlet var addToWishListButton:UIButton!
    @IBOutlet var productDescriptionLabel:UILabel!
    @IBOutlet var productRatingImageView:UIImageView!
    @IBOutlet var productRatingLabel:UILabel!
    
    var productId:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.backgroundColor = UIColor.init(hex: "#E5E5E5")
//        self.layer.borderColor = UIColor.red.cgColor
//        self.layer.borderWidth = 1
        
        self.addToWishListButton.setImage(UIImage.init(named: "wish"), for: .normal)
        self.addToWishListButton.setImage(UIImage.init(named: "fav-selected"), for: .selected)

    }
    
    @IBAction func wishButtonPressed(_ sender:UIButton){
        
        if (!sender.isSelected){
            APIManager.init().addWishList(customerId: 1, productId: self.productId, success:{ data in
                do {
                    
                    let wishStatus = try JSONDecoder().decode(WishStatusDto.self, from: data)
                    sender.isSelected = !sender.isSelected
                    
                    let loadingNotification = MBProgressHUD.showAdded(to: self, animated: true)
                    loadingNotification.mode = .customView
                    loadingNotification.customView = UIImageView.init(image: UIImage.init(named: "Checkmark"))
                    loadingNotification.label.text = "Added"
                    loadingNotification.show(animated: true)
                    loadingNotification.isUserInteractionEnabled = false
                    loadingNotification.hide(animated: true, afterDelay: 2.0)

                    debugPrint(wishStatus.message)
                }catch let error as NSError{
                    debugPrint(error)
                }
            }) { error in
                
            }
        }else{
            APIManager.init().deleteFromWishList(customerId: 1, productId: self.productId, success:{ data in
                do {
                    
                    
                    if let json:NSDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] as NSDictionary?
                        {
                            let wishStatus = try JSONDecoder().decode(WishStatusDto.self, from: data)
                            sender.isSelected = !sender.isSelected
                            
                            debugPrint(wishStatus.message)

                        }
                    } catch {
                        print("error in JSONSerialization")
                }
                    
            }) { error in
                
            }
        }
    }
    class func cellCategoryDetatils(collectionView: UICollectionView, indexPath:IndexPath, product:ProductByCategoryDetatils) -> ListProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ListProductCollectionViewCell
        
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,product.image))
        cell.productImageView.sd_setShowActivityIndicatorView(true)
        cell.productImageView.sd_setIndicatorStyle(.gray)
        cell.productImageView.sd_setImage(with: imageUrl)
        
        cell.productCurrentPriceLabel.text = String(format:"%@ %@",product.price,Global.takaUniCode)
        
        cell.productId = product.productID
        cell.addToWishListButton.tag = product.productID
        
        if let temp = product.specialPrice {
            cell.productPreviousPriceLabel.attributedText =
                Global.stikeThroughPrice(previousPrice: temp.floatValue)
        } else {
            print("Name is nil. Cannot process")
        }
        cell.backgroundColor = .lightGray
        return cell
    }
    
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, product:ProductByCategory) -> ListProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ListProductCollectionViewCell
        
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,product.image))
        cell.productImageView.sd_setShowActivityIndicatorView(true)
        cell.productImageView.sd_setIndicatorStyle(.gray)
        cell.productImageView.sd_setImage(with: imageUrl)
        
        cell.productCurrentPriceLabel.text = String(format:"%@ %@",product.price,Global.takaUniCode)
        
        cell.productId = product.productID
        cell.addToWishListButton.tag = product.productID

        if let temp = product.discountPrice {
            cell.productPreviousPriceLabel.attributedText =
                Global.stikeThroughPrice(previousPrice: temp.floatValue)
        } else {
            print("Name is nil. Cannot process")
        }


        cell.backgroundColor = .lightGray
        return cell
    }

    class func wishListCellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, product:WishProduct) -> ListProductCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ListProductCollectionViewCell
        
        let imageUrl = URL(string: String(format: "%@%@",APIManager.IMAGE_BASE_URL,product.image))
        cell.productImageView.sd_setShowActivityIndicatorView(true)
        cell.productImageView.sd_setIndicatorStyle(.gray)
        cell.productImageView.sd_setImage(with: imageUrl)
        
        cell.productDescriptionLabel.text = product.wishListDescription
        cell.productCurrentPriceLabel.text = String(format:"%@ %@",product.price,Global.takaUniCode)
        //        cell.productPreviousPriceLabel.text = newlyArrived.pri
        cell.addToWishListButton.isSelected = true
        cell.productId = product.productID

        cell.addToWishListButton.tag = product.productID
        cell.backgroundColor = .lightGray
        return cell
    }


}
