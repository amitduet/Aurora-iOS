//
//  APIManager.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/3/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    //http://aurorafashionbd.com/testphase/aurora/image/
    //http://aurorafashionbd.com/testphase/image/catalog/Men/Shirt/shirt.jpg
    //http://aurorafashionbd.com/testphase/aurora/image/catalog/Men/Shirt/shirt.jpg
    let BASE_URL:String = "https://aurorafashionbd.com/ocLiveApi/public/api/"
    static let IMAGE_BASE_URL = "http://aurorafashionbd.com/testphase/image/"
    let TOKEN_KEY = "token"
    
    let authError:NSError = NSError.init(domain: "token expire", code: 401, userInfo: nil)

    func getJWTToken ()->String{
        
        if (UserDefaults.standard.value(forKey: TOKEN_KEY) == nil){
            return ""
        }
        let token:String = UserDefaults.standard.value(forKey: TOKEN_KEY) as! String
        let jwtToken = String(format: "Bearer %@",token)
        
        return jwtToken
    }
    
    func getCategoryId() -> Int {
        return 61; // restore from UserDefaults
    }
    
    //MARK: API Login and Get app access Token
    func getAccessToken(success:@escaping (_ response : String)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@apiLogin",BASE_URL)) else {
            return
        }
        let headers = ["Content-Type": "application/x-www-form-urlencoded"]
        Alamofire.request(url, method: .post, parameters: ["email":"ram@aurorafashionbd.com","password":"super123"], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
            case .success:
                if let data = response.result.value {
                    
                    if (data is NSDictionary){
                        let dataDic:NSDictionary = data as! NSDictionary
                        let tokenString = dataDic.value(forKey: self.TOKEN_KEY)
                        UserDefaults.standard.set(tokenString, forKey: self.TOKEN_KEY)
                        success(tokenString as! String)
                    }
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK get First load data like Man, Women, Kids
    func getFirstLoadData( success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@firstLoad",BASE_URL)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK: Login
    func login(email:String, password:String,success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        
        guard let url = URL(string: String(format: "%@login",BASE_URL)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: ["email":email,"password":password], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    
    
    //MARK: get Home category
    func getHome( categoryId:Int, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@homeByCategory/%d?",BASE_URL,categoryId)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
        
    //MARK: get Product Categories
    func getProductCategories(categoryId:Int, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@category",BASE_URL)) else {
            return
        }
        
        let headers = ["Authorization": self.getJWTToken()]
        
        Alamofire.request(url, method: .post, parameters: ["category_id":categoryId], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK: get category products using category id
    func getCategoryProducts( categoryId:Int, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@productsByCategory/%d",BASE_URL,categoryId)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK: get product detatils using product id
    func getProductDeatiles( productId:Int, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@productDetails/%d",BASE_URL,productId)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK: get wish list
    func getWishList( customerId:Int, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@getWishList",BASE_URL)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: ["customer_id":customerId], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
   
    //MARK: add wish list
    func addWishList( customerId:Int,productId:Int, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@addWishlist?",BASE_URL)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: ["customer_id":customerId, "product_id":productId], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK: delete wish list
    func deleteFromWishList( customerId:Int,productId:Int, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@deleteWishlist?",BASE_URL)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: ["customer_id":customerId, "product_id":productId], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    
    //MARK: Registraion Related API

    //MARK: register API
    func registerUser( userProfile:[String: AnyObject], success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@register?",BASE_URL)) else {
            return
        }
        
        /*
         let userProfile : [String: AnyObject] =
         [
         "email": "amit@gmail.com",
         "password": "123456"
         "firstname": "Amit",
         "lastname": "Chy",
         "phone": "01716395821",
         "country_id": "18", // Ask to Ram Da regarding country id
         "zone_id": "23", // Ask to Ram Da regarding zone id
         "postcode": "1229", // Ask to Ram Da regarding country id
         "address": "1229",
         "city": "Dhaka",
         ]
         */
        let headers = ["Content-Type": "application/x-www-form-urlencoded", "Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: userProfile, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }

    //MARK:Forgot password api
    func forgotPassword( email:String, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@forgotPassword",BASE_URL)) else {
            return
        }
        
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: ["customer_email":email], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK:get customer profile API
    func getCustomerProfile( customerId:Int, success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@customerProfile",BASE_URL)) else {
            return
        }
        
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: ["customer_id":customerId], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK: Coupon API
    
    func couponApply( params:[String:AnyObject], success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@couponApply",BASE_URL)) else {
            return
        }
        /*
         let coupontData : [String: AnyObject] =
         [
         "coupon_code": "amit@gmail.com",
         "customer_id": "123456"
         ]
         */
        
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
   
    //MARK: Add Review
    func addReview( params:[String:AnyObject], success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@addReview?",BASE_URL)) else {
            return
        }
        /*
         let addReviewData : [String: AnyObject] =
         [
         "product_id": "amit@gmail.com",
         "customer_id": "123456",
         "text": "amit@gmail.com",
         "rating": "123456",
         ]
         */
        
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK:Filter
    
    //MARK: filter option list
    func getFilterOptionList( success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@filterOptionList",BASE_URL)) else {
            return
        }
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //MARK:Product filter list
    
    func getProductFilterList( params:[String:AnyObject], success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->())  {
        guard let url = URL(string: String(format: "%@filterProductList?",BASE_URL)) else {
            return
        }
        /*
         let addReviewData : [String: AnyObject] =
         [
         "size_filter_id": "1",
         "priceStart": "50",
         "priceEnd": "500",
         "category_id": "59",
         ]
         */
        
        let headers = ["Authorization": self.getJWTToken()]
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 401 {
                failure(self.authError)
            }
            switch response.result {
            case .success:
                if let data = response.data {
                    success(data)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    
    
    
    
}

