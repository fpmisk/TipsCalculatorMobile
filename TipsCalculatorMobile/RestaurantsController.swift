//
//  FirstViewController.swift
//  TipsCalculatorMobile
//
//  Created by fpmi on 15.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

import UIKit

class RestaurantsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBAction func button(sender: AnyObject) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : RestaurantController = storyboard.instantiateViewControllerWithIdentifier("RestID") as! RestaurantController
        vc.addNew = true
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Helper.instance.restaurants.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "RestaurantCell")
        
        cell.textLabel?.text = Helper.instance.restaurants[indexPath.row].name
        cell.detailTextLabel?.text = "Rating: \(Helper.instance.restaurants[indexPath.row].rating) " +
                                        "Reviews: \(Helper.instance.restaurants[indexPath.row].reviews.count)";
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "restaurantInfo" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = Helper.instance.restaurants[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! RestaurantController
                controller.addNew = false
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData();
    }
}

