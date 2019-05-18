//
//  OfferSLiderCollectionViewCell.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/14/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit
import CHIPageControl
import SDWebImage

class OfferSLiderCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var sliderView:CHIPageControlJaloro!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    let sliderImageCellHieght:Float = 200.0
    
    public var  sliders: [DiscountBanner] = []

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:CollectionView Delegate and Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SliderImageCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath, bannerImage:self.sliders[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.sliderView.progress =  Double(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: CGFloat(sliderImageCellHieght))
    }
    

    //MARk:Page Changes
    @IBAction func pageChangesControllerAction(_ sender: CHIPageControlJaloro) {
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath:IndexPath, sliders:[DiscountBanner]) -> OfferSLiderCollectionViewCell {
        let identifier = String(describing: self)
        
        collectionView.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! OfferSLiderCollectionViewCell
        cell.sliders = sliders
        cell.sliderView.numberOfPages = cell.sliders.count
        cell.sliderCollectionView.reloadData()

        cell.backgroundColor = .clear
        return cell
    }

}
