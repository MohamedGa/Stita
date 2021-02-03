//
//  Service.swift
//  Service Valley
//
//  Created by Mohammed Gamal on 11/7/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit
import SwiftyJSON
class foodCatalog {
    
    var id: Int?
    var name: String?
    var description1: String?

    var foods = [subfoods]()
    var mediaArray = [media]()
    
    init(id: Int?, name: String?, description1: String?, foods: [Any]?,mediaArray: [Any]?) {
        self.id = id
        self.name = name
        self.description1 = description1
     
    
        
        if let foods = foods as? [[String: AnyObject]] {
            // lets iterate on the raw data
            foods.forEach({ (foodsCandidates) in
                // Create category
                let foodsCategory = subfoods(id: foodsCandidates["id"] as? Int,
                                                  name: foodsCandidates["name"] as? String,
                                                  price: foodsCandidates["price"] as? String,
                                                  discount_price: foodsCandidates["discount_price"] as? String,
                                                  description: foodsCandidates["description"] as? String,
                                                  ingredients: foodsCandidates["ingredients"] as? String,
                                                  package_items_count: foodsCandidates["package_items_count"] as? String,
                                                  weight: foodsCandidates["weight"] as? String)
                // Append to our array
                self.foods.append(foodsCategory)
            })
        }
        if let mediaArray = mediaArray as? [[String: AnyObject]] {
                              // lets iterate on the raw data
                              mediaArray.forEach({ (mediaCandidates) in
                                  // Create category
                                  let foodsCategory = media(id: mediaCandidates["id"] as? Int,
                                                                    url: mediaCandidates["url"] as? String
                                                                    )
                                  // Append to our array
                                  self.mediaArray.append(foodsCategory)
                              })
                          }
    }
}
    
    
    class subfoods {
        var id: Int?
        var name: String?
        var price: String?
        var discount_price: String?
        var description: String?
        var ingredients: String?
        var package_items_count: String?
        var weight: String?
        
    
        init(id: Int?, name: String?, price: String?, discount_price: String?,description: String?,ingredients: String?,package_items_count: String?,weight: String?) {
            self.id = id
            self.name = name
            self.price = price
            self.discount_price = discount_price
            self.description = description
            self.ingredients = ingredients
            self.package_items_count = package_items_count
            self.weight = weight
                    
      
           
            
    }
}
class media {
        var id: Int?
        
        var url: String?
        
    
        init(id: Int?, url: String?) {
            self.id = id
            self.url = url
            
                    
      
         
            
    }
}

