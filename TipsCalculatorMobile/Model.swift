//
//  main.swift
//  TipsCalculator
//
//  Created by fpmi on 15.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

import Foundation

struct Constants {
    static let standartServiceTime: Float = 30.0 // mins
    static let standartTips: [Float] = [3.0, 5.0, 7.0, 10.0]
    static let timeInterval: Float = 5.0 // mins
    static let tipsDecrement: Float = 0.5 // %
}

class Review {
    var atmosphere = 1;  // 1-5
    var mealQuality = 1; // 1-5
    var orderSum: Float = Float(); // $
    var serviceTime: Float = Float(); // mins
    
    var restaurant: Restaurant;
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant;
    }
    
    func calculateTips() -> Float {
        var tips = Constants.standartTips[self.restaurant.rating];
        tips -= (self.serviceTime - Constants.standartServiceTime) / Constants.timeInterval * Constants.tipsDecrement;
        tips *= (1 + (Float(self.mealQuality) - 3) / 5);
        tips *= (1 + (Float(self.atmosphere) - 3) / 5);
        
        if tips < 0.0 {
            tips = 0.0;
        }
        let numberOfPlaces = 2.0
        let tipsSum = Double(self.orderSum * tips / 100);
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(tipsSum * multiplier) / multiplier
        return Float(rounded);
    }
}

class Restaurant {
    var name = "";
    var rating = 0; // 0-3
    var reviews = Array<Review>();
}


