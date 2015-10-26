//
//  RestaurantController.swift
//  TipsCalculatorMobile
//
//  Created by fpmi on 22.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

import UIKit

class RestaurantController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @IBOutlet weak var restNameLbl: UILabel!
    @IBOutlet weak var restRatingLbl: UILabel!
    var restaurant: Restaurant!;
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        restNameLbl.text? = restaurant.name
        restRatingLbl.text? = "\(restaurant.rating)"
    }
    
    @IBAction func addNewReview(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ReviewControllerID") as? ReviewController
        vc?.restaurant = restaurant;
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.reviews.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "restaurantReviewCellID")
        
        cell.textLabel?.text = "Order sum: \(restaurant.reviews[indexPath.row].orderSum)"
        cell.detailTextLabel?.text = "Tips: \(restaurant.reviews[indexPath.row].calculateTips())$"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ReviewControllerID") as? ReviewController
        vc?.review = restaurant.reviews[indexPath.row]
        vc?.restaurant = restaurant;
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData();
    }
}