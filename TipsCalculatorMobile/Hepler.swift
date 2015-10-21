//
//  Hepler.swift
//  TipsCalculatorMobile
//
//  Created by Admin on 18.10.15.
//  Copyright © 2015 fpmi. All rights reserved.
//

import Foundation

class Helper {
    class var instance: Helper {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: Helper? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = Helper()
        }
        return Static.instance!
    }
    
    var restaurants: [Restaurant] = [];
    
    init() {
        
        let rest = Restaurant();
        rest.rating = 1;
        rest.name = "Bungalo";
        restaurants.append(rest)
        
        let rev1 = Review(restaurant: rest);
        rev1.atmosphere = 3;
        rev1.mealQuality = 4;
        rev1.serviceTime = 34;
        rev1.orderSum = 25.65;
        
        rest.reviews.append(rev1)
        
        for rev: Review in rest.reviews {
            print("Review from restaurant \"\(rest.name)\":")
            print("\tAtmosphere (1-5): \(rev.atmosphere)")
            print("\tMeal quality (1-5): \(rev.mealQuality)")
            print("\tService time in minutes: \(rev.serviceTime)")
            print("\tOrder sum: \(rev.orderSum) $")
            print("\tTips sum: \(rev.calculateTips()) $")
        }
    }
}