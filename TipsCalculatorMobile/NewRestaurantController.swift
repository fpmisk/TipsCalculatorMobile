//
//  NewRestaurantController.swift
//  TipsCalculatorMobile
//
//  Created by Admin on 22.10.15.
//  Copyright © 2015 fpmi. All rights reserved.
//

import UIKit

class NewRestaurantController: UIViewController {
    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var restaurantRating: UISegmentedControl!
    
    var addNew: Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let homeButton : UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("backButton:"))
//        self.navigationItem.leftBarButtonItem = homeButton
    }
    
    func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
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
        Helper.instance.restaurants.insert(rest, atIndex: 0)
        self.navigationController?.popViewControllerAnimated(true);
    }
}
