//
//  DisplayFoodViewController.swift
//  7a_EOE
//
//  Created by Rohith Raju on 11/19/16.
//  Copyright © 2016 Rohith Raju. All rights reserved.
//

import UIKit
import SDWebImage

class DisplayFoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,PortalServiceDelegate,CoreDataHelperDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewForActivityIndicator: UIView!
    var foodArray = [FoodModel]()
    var core = CoreDataHelper()
    var service = PortalService()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideUnhideActivity(true)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        core.delegate = self

        core.retriveFood()

        hideUnhideActivity(false)
    }
    
    func successForGetFood(_ success: NSArray) {
        
        if success.count > 0{
            core.insertFoodItems(success)
        }
        
        
    }
    
    
    
    func successForInserfoodCore(_ success: String) {
        core.retriveFood()

    }
    
    func FailureForinsertFoodCore(_ error: String) {
        
    }
    
    
    func FailureForGetFood(_ error: String) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: AnyObject) {
        performSegue(withIdentifier: "add", sender: self)
    }
    
   
    
    func successForRetfoodCore(_ success: NSArray) {
        
        if success.count < 0 {
            service.delegate = self
            service.getFoodDiary()
        }else{
            foodArray = []
            foodArray = success as! [FoodModel]
            hideUnhideActivity(true)
            
            self.tableview.reloadData()
        }
       
    }
    
    func FailureForRetFoodCore(_ error: String) {
        service.delegate = self
        service.getFoodDiary()
        hideUnhideActivity(true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        var foodModel = FoodModel()
        
        foodModel = foodArray[indexPath.row]
        
        
        cell.mealType.text = "Meal type: \(foodModel.mealType!)"
        cell.company.text = "Company: \(foodModel.companyToEat!)"
        cell.placeEat.text = "Place: \(foodModel.placeYouAte!)"
        cell.beforeSymp.text = "Before symptom: \(foodModel.beforeSymptom!)"
        cell.afterSymp.text = "After symptom: \(foodModel.afterSymptom!)"
        cell.worried.text = "Worried: \(foodModel.worry!)"
        print("foodModelStr:\(foodModel.foodImg!)")
        
        let url : NSString = foodModel.foodImg! as NSString
        let urlStr : NSString = url.addingPercentEscapes(using: String.Encoding.utf8.rawValue)! as NSString
        let searchURL : URL = URL(string: urlStr as String)!
        print("serach:\(searchURL)")
      

        cell.foodImg?.sd_setImage(with: searchURL, placeholderImage:UIImage(named: "Food_vector_icon_restaurant_pixel_perfect"))
        return cell
    }
    

    
    func hideUnhideActivity(_ bool: Bool){
        
        viewForActivityIndicator.isHidden = bool
        
        if bool == false {
           
            // activityIndicator.center = scrollView.center
            activityIndicator.startAnimating()
        }else{
            
            DispatchQueue.main.async(execute: {
                
                self.activityIndicator.stopAnimating()
                self.viewForActivityIndicator.isHidden = bool
                // self.viewForActivityIndicator.removeFromSuperview()
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
