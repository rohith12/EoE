//
//  TreatmentViewController.swift
//  7a_EOE
//
//  Created by Rohith Raju on 11/20/16.
//  Copyright © 2016 Rohith Raju. All rights reserved.
//

import UIKit

class TreatmentViewController: UIViewController,PortalServiceDelegate,UITextFieldDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewForActivityIndicator: UIView!
    @IBOutlet weak var eliminationText: UITextField!
    
    @IBOutlet weak var foodCurrentlyEating: UITextField!
    
    @IBOutlet weak var foodEliminationHeight: NSLayoutConstraint!
    
    @IBOutlet weak var foodEliminationView: UIView!
    
    @IBOutlet weak var eliminationBased: NSLayoutConstraint!
    
    @IBOutlet weak var eliminationBasedView: UIView!
    
    @IBOutlet weak var eliminatingText: NSLayoutConstraint!
    
    @IBOutlet weak var eliminatinationTextView: UIView!
    
    @IBOutlet weak var supplementalHeight: NSLayoutConstraint!
    
    @IBOutlet weak var supplementalView: UIView!
    @IBOutlet weak var foodTrailsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var foodTrailsView: UIView!
    @IBOutlet weak var elementaryDietHeight: NSLayoutConstraint!
    
    @IBOutlet weak var elementaryDietView: UIStackView!
    
    
    @IBOutlet weak var takingSteriodsSwitch: UISwitch!
    
    @IBOutlet weak var dietaryTherapiesSwitch: UISwitch!
    
    @IBOutlet weak var foodEliminationSwitch: UISwitch!
    
    @IBOutlet weak var eliminationDeitSwitch: UISwitch!
    
    @IBOutlet weak var foodTrailTextView: UIView!
    
    @IBOutlet weak var foodTrailTextHeight: NSLayoutConstraint!
    
    var service = PortalService()
    
    //variables
    
    var eoeSteriods = "No"
    var dietaryTherapies = "No"
    var foodElimination = "No"
    var eliminationBasedOn = "No"
    
    
    var eliminationfromDietTextfield = ""
    var elementaryDietSwitch = "No"
    var exclusiveDiet = "No"
    var supplementalFormula = "No"
    var foodTrails = "No"
    var currentlyEatingText = ""
    
    func hideUnhideActivity(_ bool: Bool){
        
        viewForActivityIndicator.isHidden = bool
        
        if bool == false {
            self.view.bringSubview(toFront: self.viewForActivityIndicator)
            // activityIndicator.center = scrollView.center
            activityIndicator.startAnimating()
        }else{
            
            self.viewForActivityIndicator.center = self.scrollView.center
            DispatchQueue.main.async(execute: {
                self.view.bringSubview(toFront: self.scrollView)
                self.activityIndicator.stopAnimating()
                self.viewForActivityIndicator.isHidden = bool
                // self.viewForActivityIndicator.removeFromSuperview()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodEliminationHeight.constant = 0
        foodEliminationView.isHidden = true
        
        eliminationBased.constant = 0
        eliminationBasedView.isHidden = true
        
        eliminatingText.constant = 0
        eliminatinationTextView.isHidden = true
        
        foodTrailsHeight.constant = 0
        foodTrailsView.isHidden = true
        
        supplementalHeight.constant = 0
        supplementalView.isHidden = true
        
        elementaryDietHeight.constant = 0
        elementaryDietView.isHidden = true
        
        foodTrailsHeight.constant = 0
        foodTrailTextView.isHidden = true
        
        
        foodTrailTextHeight.constant = 0.0
        foodTrailTextView.isHidden = true
        
        
        hideUnhideActivity(true)

        service.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(true, moveValue: 170)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(false, moveValue: 170)
    }
    
    func animateViewMoving (_ up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takingSteriodsEoE(_ sender: UISwitch) {
        
        if  sender.isOn {
         eoeSteriods = "Yes"
        }else{
            eoeSteriods = "No"
 
        }
    }
    
    
    @IBAction func dietaryTherapies(_ sender: UISwitch) {
        
        if sender.isOn {
            dietaryTherapies = "Yes"
            foodEliminationHeight.constant = 61.0
            foodEliminationView.isHidden = false
            
            elementaryDietHeight.constant = 31.0
            elementaryDietView.isHidden = false
        }else{
            
            dietaryTherapies = "No"

            foodEliminationHeight.constant = 0
            foodEliminationView.isHidden = true
            
            
            elementaryDietHeight.constant = 0
            elementaryDietView.isHidden = true
            
            eliminationBased.constant = 0
            eliminationBasedView.isHidden = true
            
            eliminatingText.constant = 0
            eliminatinationTextView.isHidden = true
            
            foodTrailsHeight.constant = 0
            foodTrailsView.isHidden = true
            
            supplementalHeight.constant = 0
            supplementalView.isHidden = true
            
            elementaryDietHeight.constant = 0
            elementaryDietView.isHidden = true
            
            foodTrailTextHeight.constant = 0.0
            foodTrailTextView.isHidden = true
        }
        
       
    }
    
    
   

    @IBAction func foodElimination(_ sender: UISwitch) {
        
//        eliminatingText.constant = 101
//        eliminatinationTextView.hidden = false
        
        if sender.isOn {
            foodElimination  = "Yes"
            eliminationBased.constant = 101
            eliminationBasedView.isHidden = false
        }else{
            foodElimination  = "No"

            
            eliminationBased.constant = 0
            eliminationBasedView.isHidden = true
            
            eliminatingText.constant = 0
            eliminatinationTextView.isHidden = true
        }
        
       
        
    }
    
    @IBAction func eliminationSegment(_ sender: UISegmentedControl) {
        
                eliminatingText.constant = 101
                eliminatinationTextView.isHidden = false
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            eliminationBasedOn = "Allergy";
        case 1:
            eliminationBasedOn = "Six food elimination on a diet";
        default:
            break; 
        }
        
        
    }
    
    @IBAction func ElementaryDiet(_ sender: UISwitch) {
        
        if sender.isOn {
            elementaryDietSwitch = "Yes"
            supplementalHeight.constant = 134.0
            supplementalView.isHidden = false
        }else{
            elementaryDietSwitch = "No"
            supplementalHeight.constant = 0.0
            supplementalView.isHidden = true
            
            
            foodTrailsHeight.constant = 0.0
            foodTrailsView.isHidden = true
        }
      
    }
    
    @IBAction func exclusiveDiet(_ sender: UISwitch) {
        if sender.isOn {
            exclusiveDiet = "Yes"
           
        }else{
            exclusiveDiet = "No"
           
        }
        
    }
    @IBAction func supplementalFoods(_ sender: UISwitch) {
        
        if sender.isOn {
            supplementalFormula  = "Yes"
            foodTrailsHeight.constant = 61.0
            foodTrailsView.isHidden = false
        }else{
            supplementalFormula  = "No"
            foodTrailsHeight.constant = 0.0
            foodTrailsView.isHidden = true
        }
       
    }
    
    @IBAction func foodTrailSwitch(_ sender: UISwitch) {
        if sender.isOn {
            foodTrails = "Yes"
            foodTrailTextHeight.constant = 101.0
            foodTrailTextView.isHidden = false
        }else{
            foodTrails = "No"
            foodTrailTextHeight.constant = 0.0
            foodTrailTextView.isHidden = true
        }
 
        
    }
    
    
    @IBAction func Done(_ sender: AnyObject) {
       
        // eliminationtext
        foodCurrentlyEating.resignFirstResponder()
        eliminationText.resignFirstResponder()
        hideUnhideActivity(false)
        service.insertUserTreatment(eoeSteriods, dietary: dietaryTherapies, foodElimination: foodElimination, allergy_syptoms: eliminationBasedOn, allergy_syptoms_food: eliminationText.text!, elementalDiet: elementaryDietSwitch, exclElemental: exclusiveDiet, formula: supplementalFormula, foodTrial: foodTrails, foodTrial_food: foodCurrentlyEating.text!)
        
        
    }
    
    func result(){
        service.insertUserTreatment(eoeSteriods, dietary: dietaryTherapies, foodElimination: foodElimination, allergy_syptoms: eliminationBasedOn, allergy_syptoms_food: eliminationText.text!, elementalDiet: elementaryDietSwitch, exclElemental: exclusiveDiet, formula: supplementalFormula, foodTrial: foodTrails, foodTrial_food: foodCurrentlyEating.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func successForInsertUT(_ success: String) {
        hideUnhideActivity(true)

        alertViewFunc("Successfully stored the responses.")
    }
    
    func FailureForInsertUTError(_ error: String) {
        
        result()
    }
    
    func FailureForInsertUT(_ error: String) {
        hideUnhideActivity(true)

        alertViewFunc("Failed")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.foodCurrentlyEating.resignFirstResponder()
        eliminationText.resignFirstResponder()
    }
    
    func alertViewFunc(_ msg: String)  {
        
       DispatchQueue.main.async { 
                    let alertController = UIAlertController(title: "\(msg)", message: "", preferredStyle: .alert)
        
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(defaultAction)
        
                   self.present(alertController, animated: true, completion: nil)
        }
        
    }

}
