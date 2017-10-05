//
//  AddFoodViewController.swift
//  7a_EOE
//
//  Created by Rohith Raju on 11/19/16.
//  Copyright © 2016 Rohith Raju. All rights reserved.
//

import UIKit
import MobileCoreServices
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class AddFoodViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,CoreDataHelperDelegate,PortalServiceDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewForActivityIndicator: UIView!
    @IBOutlet weak var companyOutlet: UIButton!
    @IBOutlet weak var mealOutlet: UIButton!
    @IBOutlet weak var eatFoodOutlet: UIButton!
    @IBOutlet weak var afterSegment: UISegmentedControl!
    @IBOutlet weak var beforeSegemtn: UISegmentedControl!
    
    @IBOutlet weak var othersTextfield: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var heightOthers: NSLayoutConstraint!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var frontView: UIView!
    var PlacesToEat = [String]()
    var meal = [String]()
    var companyToEat = [String]()
    var decideArray = 0
    var imagePicker: UIImagePickerController!

    var   service = PortalService()
    
    var parent = "No"
    var worry = "No"
    
    var afterSegmentStr = ""
    var beforeSegmentStr = ""
    
    var  othersStr = " "
    
    var WhereDidYouEat = ""
    var whichMeal = ""
    var whoDidYouEat = ""
    
    @IBOutlet weak var imageView: UIImageView!
    var newMedia: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        PlacesToEat = ["Home","School","Restaurant"]
        meal = ["Breakfast","Lunch","Snack","Dinner"]
        companyToEat = ["Alone","Friends","Co-workers","Others"]
        heightOthers.constant = 0.0
        othersTextfield.isHidden = true
        
        self.pickerView.backgroundColor = UIColor.gray
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideUnhideActivity(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func eatThisFood(_ sender: AnyObject) {
        
        decideArray = 10
        self.pickerView.reloadAllComponents()
        showCustomPicker()
    }

    @IBAction func meal(_ sender: AnyObject) {
        decideArray = 20
        self.pickerView.reloadAllComponents()
        showCustomPicker()

    }
    
    @IBAction func eatWith(_ sender: AnyObject) {
        decideArray = 30
        self.pickerView.reloadAllComponents()
        showCustomPicker()

    }
    
    //segement
    
    @IBAction func BeforeSymptom(_ sender: AnyObject) {
        
        if beforeSegemtn.selectedSegmentIndex == 0 {
            beforeSegmentStr = "Symptoms"
        }else{
            beforeSegmentStr = "No Symptoms"

        }
    }
    
    @IBAction func afterSymptom(_ sender: AnyObject) {
        
        if afterSegment.selectedSegmentIndex == 0 {
            afterSegmentStr = "Symptoms"
        }else{
            afterSegmentStr = "No Symptoms"
            
        }
    }
    
    //switch
    
    @IBAction func MakeYoufeelBadSwitc(_ sender: UISwitch) {
        
        if sender.isOn{
            worry = "Yes"
 
        }else{
            worry = "No"

        }
        
        
       

    }
    
    @IBAction func parentSwitch(_ sender: UISwitch) {
        
        if sender.isOn{
            parent = "Yes"
            
        }else{
            parent = "No"
            
        }
    }
    
    //Picker done
    
    
    @IBAction func doneToolBar(_ sender: AnyObject) {
        
        hideCustomPicker()
        setTitleForButton(decideArray)
        
        if decideArray == 30{
        if companyToEat[pickerView.selectedRow(inComponent: 0)] == "Others"{
            
            print("\(companyOutlet.titleLabel?.text)")
            heightOthers.constant = 30.0
            othersTextfield.isHidden = false
        }
        else{
            heightOthers.constant = 0.0
            othersTextfield.isHidden = true
        }
        
        }
    }
    
    //MARK: - Pickers
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        return decideArray(decideArray).count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return decideArray(decideArray)[row]
    }
    
    //Tap gesture
    
    @IBAction func imageTap(_ sender: AnyObject) {
        
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        
        // Add the actions
        imagePicker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    
    
    }
    
    
    func decideArray(_ decide: Int)-> [String]{
        
        var tempArray = [String]()
        
        switch decideArray {
        case 10:
            tempArray = PlacesToEat
            break
        case 20:
            tempArray = meal
            break
        case 30:
            tempArray = companyToEat
            break
       
            
        default:
            break
        }
        
        return tempArray
        
    }
    
    func showCustomPicker(){
        
        
        
        UIView.animate(withDuration: 0, animations: {
            self.othersTextfield.resignFirstResponder()
        }, completion: { (Bool) in
            
            self.scrollView.frame = CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height-260);
            self.frontView.isUserInteractionEnabled = false
            self.pickerView.isHidden = false
            self.toolBar.isHidden = false
        }) 
        
        
      
        
    }
    
    func hideCustomPicker(){
        
        self.scrollView.frame=CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height+260);
        self.scrollView.contentSize=CGSize(width: self.view.frame.size.width,height: 700);
        self.frontView.isUserInteractionEnabled = true
        self.pickerView.isHidden = true
        self.toolBar.isHidden = true
        
    }
    
    
    func setTitleForButton(_ decide:Int){
        switch decide {
        case 10:
            eatFoodOutlet.setTitle(PlacesToEat[pickerView.selectedRow(inComponent: 0)], for: UIControlState())
            eatFoodOutlet.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 20:
            mealOutlet.setTitle(meal[pickerView.selectedRow(inComponent: 0)], for: UIControlState())
            mealOutlet.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 30:
            companyOutlet.setTitle(companyToEat[pickerView.selectedRow(inComponent: 0)], for: UIControlState())
            companyOutlet.setTitleColor(UIColor.black, for: UIControlState())
            
            break
        
            
            
        default:
            break
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self .present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alertWarning = UIAlertView(title:"Warning", message: "You don't have camera", delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:"")
            alertWarning.show()
        }
    }
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    //PickerView Delegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        var capturedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let rect = CGRect(x: 0, y: 0, width: capturedImage.size.width/6, height: capturedImage.size.height/6)
        UIGraphicsBeginImageContext(rect.size)
        capturedImage.draw(in: rect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let compressedImageData = UIImageJPEGRepresentation(resizedImage!, 0.1)
        capturedImage = UIImage(data: compressedImageData!)!
        
        imageView.image = capturedImage
        imagePicker .dismiss(animated: true, completion: nil)

        
        
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        
        imagePicker .dismiss(animated: true, completion: nil)

        print("picker cancel.")
    }
    
    
    @IBAction func done(_ sender: AnyObject) {
        
        WhereDidYouEat = (eatFoodOutlet.titleLabel?.text)!
        whichMeal = (mealOutlet.titleLabel?.text)!
        whoDidYouEat = (companyOutlet.titleLabel?.text)!
        
        
        
        if othersTextfield.text?.characters.count > 0 {
            othersStr = othersTextfield.text!
        }
        
        
   
        
        
        
        service.delegate = self
       service.uploadImage(imageView.image!)
        
        
        hideUnhideActivity(false)
    }
    
    
    func result(){
        
        if othersTextfield.text?.characters.count > 0 {
            othersStr = othersTextfield.text!
        }
        
        
        WhereDidYouEat = (eatFoodOutlet.titleLabel?.text)!
        whichMeal = (mealOutlet.titleLabel?.text)!
        whoDidYouEat = (companyOutlet.titleLabel?.text)!
        
        
        
        service.delegate = self
        service.uploadImage(imageView.image!)
    }
    
    
    func successForUploadImage(_ success: NSDictionary) {
        
        //print("\(success["fileLocation"])")
       service.insertFood("\(success["fileLocation"]!)", parent: parent, whereHome: WhereDidYouEat, whichMeal: whichMeal, whoAlone: whoDidYouEat, feelBefore: beforeSegmentStr, feelAfter: afterSegmentStr, allergic: worry, others: othersStr)
        
    }
    
    func FailureForUploadImage(_ error: String) {
        
    }
    
    func successForInsertFood(_ success: NSArray) {
        
        print("array:\(success)")
        let core = CoreDataHelper()
        core.delegate = self
        core.insertFoodItems(success)
       // alertViewFunc("successfully stored food data")
    }
    
    func FailureForInsertFood(_ error: String) {
        hideUnhideActivity(true)

        alertViewFunc("failed to store food data")
    }
    
    
    func FailureForInsertFoodError(_ error: String) {
        result()
    }
    
    func successForInserfoodCore(_ success: String) {
        hideUnhideActivity(true)

        alertViewFunc("successfully inserted food items.")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        othersTextfield.resignFirstResponder()
    }
    
    func FailureForinsertFoodCore(_ error: String) {
        hideUnhideActivity(true)
  
    }
    
    func alertViewFunc(_ msg: String)  {
        
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "\(msg)", message: "", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    func hideUnhideActivity(_ bool: Bool){
        
        viewForActivityIndicator.isHidden = bool
        
        if bool == false {
            self.view.bringSubview(toFront: self.viewForActivityIndicator)
           // activityIndicator.center = scrollView.center
            activityIndicator.startAnimating()
        }else{
            
            DispatchQueue.main.async(execute: {
                self.view.bringSubview(toFront: self.scrollView)
                self.activityIndicator.stopAnimating()
                self.viewForActivityIndicator.isHidden = bool
               // self.viewForActivityIndicator.removeFromSuperview()

            })
            
        }
        
        
    }
    

}
