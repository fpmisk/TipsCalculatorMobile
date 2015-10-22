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
        performSegueWithIdentifier("newRest", sender: self)
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("restInfo", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "restInfo" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = Helper.instance.restaurants[indexPath.row]
                let vc = segue.destinationViewController as RestaurantController;
                vc.restaurant = object;
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData();
    }
}

