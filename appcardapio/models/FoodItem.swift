//
//  FoodItem.swift
//  appcardapio
//
//  Created by Aluno on 04/04/23.
//

import Foundation

class FoodItem {
    var foodName: String
    var foodPrice: String
    var foodDescription: String
    var foodImage: String
    
    public init(foodName: String, foodPrice:String, foodDescription: String, foodImage: String) {
        self.foodName = foodName
        self.foodPrice = foodPrice
        self.foodDescription = foodDescription
        self.foodImage = foodImage
    }
}
