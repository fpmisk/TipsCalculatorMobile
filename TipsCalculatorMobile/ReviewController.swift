//
//  ReviewController.swift
//  TipsCalculatorMobile
//
//  Created by Admin on 26.10.15.
//  Copyright © 2015 fpmi. All rights reserved.
//

import UIKit

class ReviewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    var review: Review!;
    var restaurant: Restaurant!
    @IBOutlet weak var atmoBar: UISegmentedControl!
    @IBOutlet weak var mealQualityBar: UISegmentedControl!
    @IBOutlet weak var serviseTimeLbl: UITextField!
    @IBOutlet weak var orderSumLbl: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (review != nil) {
            saveBtn.hidden = true;
            atmoBar.selectedSegmentIndex = review.atmosphere;
            atmoBar.enabled = false;
            mealQualityBar.selectedSegmentIndex = review.mealQuality;
            mealQualityBar.enabled = false;
            serviseTimeLbl.text = "\(review.serviceTime)";
            serviseTimeLbl.enabled = false;
            orderSumLbl.text = "\(review.orderSum)";
            orderSumLbl.enabled = false;
        } else {
            self.title = "New Review";
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveReview(sender: AnyObject) {
        let review = Review(restaurant: restaurant)
        review.serviceTime = Float(serviseTimeLbl.text!)!;
        review.orderSum = Float(orderSumLbl.text!)!;
        review.atmosphere = atmoBar.selectedSegmentIndex;
        review.mealQuality = mealQualityBar.selectedSegmentIndex;
        restaurant.reviews.insert(review, atIndex: 0)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}

