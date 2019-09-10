//
//  FilterViewController.swift
//  Aurora
//
//  Created by Amit Chowdhury on 9/3/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var sizeCollectionView:UICollectionView!
    @IBOutlet weak var sizeViewHeightConstraint: NSLayoutConstraint!
    var sizes:NSMutableArray!

    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var minPriceLabel: UILabel!
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!

    public var productCategoryID:NSInteger!
    var selectedSizeId:NSString!
    var selectedCollectionViewCell:SizeCollectionViewCell!
    
    @objc func menuButtonDidTap(){
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sizes = NSMutableArray.init()
        self.filterOptionRequest()
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 25))
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backButton)]

    }

    @IBAction func priceChanged(_ sender: UISlider) {
        self.minPriceLabel.text = String(format:"%0.f %@",sender.value,Global.takaUniCode)
    }
    
    @IBAction func filterButtonPressed(){
        
        let filterProductList:[String:AnyObject] = ["size_filter_id":selectedSizeId, "priceStart":self.minPriceLabel.text!.dropLast() as AnyObject,"priceEnd":self.maxPriceLabel.text!.dropLast() as AnyObject, "category_id":productCategoryID as AnyObject]
        
        APIManager.init().getProductFilterList(params:filterProductList
            , success: { data in
                self.resultLabel.text = "\(10) Products"
        }) { error in
            
        }
    }
    
    //API Resonse
    func filterOptionRequest(){
        APIManager.init().getFilterOptionList(success: { data in
            do {
                let filterDto = try JSONDecoder().decode(FilterDto.self, from: data)
                self.sizes = NSMutableArray.init(array: filterDto.size)
                
                self.sizeCollectionView.reloadData()
                self.sizeViewHeightConstraint.constant = self.sizeCollectionView.collectionViewLayout.collectionViewContentSize.height
                self.priceSlider.minimumValue = (Float(filterDto.lowestPrice))!
                self.priceSlider.maximumValue = (Float(filterDto.highestPrice))!
                self.priceSlider.value = 500.0
                self.minPriceLabel.text = String(format:"%0.f %@",self.priceSlider.minimumValue,Global.takaUniCode)
                self.maxPriceLabel.text = String(format:"%0.f %@",self.priceSlider.maximumValue,Global.takaUniCode)

                }catch let error as NSError{
                                debugPrint(error)
            }
        }) { error in
            
        }
    }
    

    //MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = SizeCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, option:self.sizes?[indexPath.row] as! Color)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:70,height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (section > 3){
            return 0.0
        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if (section > 3){
            return 0.0
        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (section > 3){
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if (selectedCollectionViewCell != nil){
            selectedCollectionViewCell.backgroundColor = UIColor.clear
            selectedCollectionViewCell.sizeLabel.textColor = UIColor.black
        }
        let cell = collectionView.cellForItem(at: indexPath) as! SizeCollectionViewCell
        cell.backgroundColor = UIColor.black
        cell.sizeLabel.textColor = UIColor.white
        let color = self.sizes?[indexPath.row] as! Color
        self.selectedSizeId = "\(color.filterID)" as NSString
        selectedCollectionViewCell = cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}

