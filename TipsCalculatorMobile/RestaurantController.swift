//
//  NewRestaurantController.swift
//  TipsCalculatorMobile
//
//  Created by Admin on 22.10.15.
//  Copyright © 2015 fpmi. All rights reserved.
//

import UIKit

class RestaurantController: UIViewController {
    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var restaurantRating: UISegmentedControl!
    
    var addNew: Bool = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if addNew {
            let save : UIBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Done, target: self, action: "saveRestaurant:")
        
            self.navigationItem.rightBarButtonItem = save
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveRestaurant(sender:UIButton!) {
        let restName = restaurantName.text
        if restName == "" {
            let alertController = UIAlertController(title: "Error", message:
                "Restaurant name must be not empty.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            return;
        }
        
        let rest = Restaurant();
        rest.rating = restaurantRating.selectedSegmentIndex;
        rest.name = restName!;
        Helper.instance.restaurants.append(rest)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
