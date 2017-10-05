//
//  RegisterViewController.swift
//  7a_EOE
//


import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,PortalServiceDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewForActivityIndicator: UIView!
    @IBOutlet weak var householdBtn: UIButton!
    @IBOutlet weak var motherBtn: UIButton!
    @IBOutlet weak var fatherBtn: UIButton!
    @IBOutlet weak var EOEBtn: UIButton!
    @IBOutlet weak var gradebtn: UIButton!
    @IBOutlet weak var hispanicBtn: UIButton!
    @IBOutlet weak var raceBtn: UIButton!
    @IBOutlet weak var genderBtn: UIButton!
    @IBOutlet weak var DobBtn: UIButton!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateToolbar: UIToolbar!
    
    @IBOutlet weak var customPicker: UIPickerView!
    @IBOutlet weak var customToolbar: UIToolbar!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var frontView: UIView!
    
    var coreData = CoreDataHelper()

    var genderArray = [String]()
    var raceArray = [String]()
    var gradeArray = [String]()
    var EoEArray = [String]()
    var EducationArray = [String]()
    var incomeArray = [String]()
    var hispanic = [String]()
    
    var decideArray = 0
    
    var service = PortalService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        genderArray = ["Male","Female"]
        raceArray = ["White","Black or African American","Asian","Pacific Islander","Other"]
        gradeArray = ["Pre-school","Kindergarten","1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th","11th","12th"]
        hispanic = ["Yes","No"]
        EducationArray = ["Less than 9th grade","9-12th no diploma","High school graduate(or GED/equilavent)","Associate Degree or Vocational training","Some college(No degree)","Bachelor degree","Graduate or professional degree"]
        
        
        incomeArray = ["Less than $10,000","$10,000 to $14,999","$15,000 to $24,999","$25,000 to $34,999","$35,000 to $49,999","$75,000 to $99,999","100,000 or more"]
        EoEArray = ["Less than a year","1-5 years","More than 5 years"]
        
        self.datePicker.backgroundColor = UIColor.gray
          self.customPicker.backgroundColor = UIColor.gray
        hideUnhideActivity(true)
        
       // NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector(showDatePicker()), name: UIKeyboardDidHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Confirm(_ sender: AnyObject) {
        
        let emailTxtWoWhite = emailTxt.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let passTxtWoWhite = passwordTxt.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
     //   let nameTxtWoWhite = nameTxt.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
         if emailTxtWoWhite.characters.count>0 && passTxtWoWhite.characters.count>0 && nameTxt.text!.characters.count>0 {
         
        service.delegate = self
        service.insertUserNameAndPassword(nameTxt.text!, password: passwordTxt.text!, email: emailTxt.text!, DOB: (DobBtn.titleLabel?.text)!, gender: (genderBtn.titleLabel?.text)!, race: (raceBtn.titleLabel?.text)!, hispanic: (hispanicBtn.titleLabel?.text)!, grade: (gradebtn.titleLabel?.text)!, eoe: (EOEBtn.titleLabel?.text)!
            , father: (fatherBtn.titleLabel?.text)!, mother: (motherBtn.titleLabel?.text)!, income: (householdBtn.titleLabel?.text)!)
            
            hideUnhideActivity(false)
         }else{
            
           alertViewFunc("Please fill all the fields")
        }
    }
    
    
    
    
    @IBAction func tap(_ sender: AnyObject) {
        resign()
    }
    @IBAction func DOBbtn(_ sender: AnyObject) {
    
        showDatePicker()
    }
    
    
    func showDatePicker(){
     // resign()

    
       UIView.animate(withDuration: 0, animations: { 
                    self.emailTxt.resignFirstResponder()
            self.passwordTxt.resignFirstResponder()
                    self.nameTxt.resignFirstResponder()
        }, completion: { (Bool) in
            
            self.frontView.isUserInteractionEnabled = false
            self.datePicker.isHidden = false
            self.dateToolbar.isHidden = false
            self.scrollView.frame = CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height-260);
        }) 
            
                      

           
//            self.emailTxt.resignFirstResponder()
//            self.passwordTxt.resignFirstResponder()
//            self.nameTxt.resignFirstResponder()
//            
        
        
      
       

        
        
    }
    
    func resign(){
       
        //showDatePicker()

    }
    
    func hideDatePicker(){
        
        self.scrollView.frame=CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height+260);
        self.scrollView.contentSize=CGSize(width: self.view.frame.size.width,height: 1000);
        self.frontView.isUserInteractionEnabled = true
        self.datePicker.isHidden = true
        self.dateToolbar.isHidden = true
        
    }
    
   
    
    func showCustomPicker(){
        
      
        UIView.animate(withDuration: 0, animations: {
            self.emailTxt.resignFirstResponder()
            self.passwordTxt.resignFirstResponder()
            self.nameTxt.resignFirstResponder()
        }, completion: { (Bool) in
            
            self.scrollView.frame = CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height-260);
            self.frontView.isUserInteractionEnabled = false
            self.customPicker.isHidden = false
            self.customToolbar.isHidden = false
        }) 
    }
    
    func hideCustomPicker(){
        
        self.scrollView.frame=CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height+260);
        self.scrollView.contentSize=CGSize(width: self.view.frame.size.width,height: 1000);
        self.frontView.isUserInteractionEnabled = true
        self.customPicker.isHidden = true
        self.customToolbar.isHidden = true
        
    }
    
    
    
    @IBAction func gender(_ sender: AnyObject) {
        
        decideArray = 10
        showCustomPicker()
        customPicker.reloadAllComponents()
    }
    
    @IBAction func raceBtn(_ sender: AnyObject) {
        decideArray = 20
        showCustomPicker()
        customPicker.reloadAllComponents()

        
    }

    @IBAction func hispanicBtn(_ sender: AnyObject) {
        decideArray = 30
        showCustomPicker()
        customPicker.reloadAllComponents()

        
    }
    
    
    
     @IBAction func gradeBtn(_ sender: AnyObject) {
        
        decideArray = 40
        showCustomPicker()
        customPicker.reloadAllComponents()

     }
    
    
    @IBAction func eoe(_ sender: AnyObject) {
        decideArray = 50

        showCustomPicker()
        customPicker.reloadAllComponents()

    }
    
    
    @IBAction func fatherBtn(_ sender: AnyObject) {
        
        decideArray = 60
        showCustomPicker()
        customPicker.reloadAllComponents()

    }
    
    @IBAction func motherBtn(_ sender: AnyObject) {
        decideArray = 70
        showCustomPicker()
        customPicker.reloadAllComponents()

        
    }
    
    @IBAction func houseHoldBtn(_ sender: AnyObject) {
        decideArray = 80
        showCustomPicker()
        customPicker.reloadAllComponents()

        
    }
    
    //MARK : Done
    
    @IBAction func dateDone(_ sender: AnyObject) {
        
        hideDatePicker()
        
        let date = self.datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        DobBtn.setTitle(dateString
            , for: UIControlState())
        DobBtn.setTitleColor(UIColor.black, for: UIControlState())
 
        
    }
    
    @IBAction func CustomDone(_ sender: AnyObject) {
        hideCustomPicker()
        setTitleForButton(decideArray)
        
    }
    
    //MARK: Picker delegates
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
       let arrayPicker  = decideArray(decideArray)
        
        
        return arrayPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let arrayPicker  = decideArray(decideArray)
        return arrayPicker[row]
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func decideArray(_ decide: Int)-> [String]{
       
        var tempArray = [String]()
        
        switch decideArray {
        case 10:
            tempArray = genderArray
            break
        case 20:
            tempArray = raceArray
            break
        case 30:
            tempArray = hispanic
            break
        case 40:
            tempArray = gradeArray
            break
        case 50:
            tempArray = EoEArray
            break
        case 60:
            tempArray = EducationArray
            break
        case 70:
            tempArray = EducationArray
            break
        case 80:
            tempArray = incomeArray
            break
        
            
        default:
            break
        }
        
        return tempArray
        
    }
    
    
    func setTitleForButton(_ decide:Int){
        switch decide {
        case 10:
            genderBtn.setTitle(genderArray[customPicker.selectedRow(inComponent: 0)], for: UIControlState())
            genderBtn.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 20:
            raceBtn.setTitle(raceArray[customPicker.selectedRow(inComponent: 0)], for: UIControlState())
              raceBtn.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 30:
            hispanicBtn.setTitle(hispanic[customPicker.selectedRow(inComponent: 0)], for: UIControlState())
              hispanicBtn.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 40:
            gradebtn.setTitle(gradeArray[customPicker.selectedRow(inComponent: 0)], for: UIControlState())
              gradebtn.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 50:
            EOEBtn.setTitle(EoEArray[customPicker.selectedRow(inComponent: 0)], for: UIControlState())
              EOEBtn.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 60:
            fatherBtn.setTitle(EducationArray[customPicker.selectedRow(inComponent: 0)], for: UIControlState())
              fatherBtn.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 70:
            
            motherBtn.setTitle(EducationArray[customPicker.selectedRow(inComponent: 0)], for: UIControlState())
              motherBtn.setTitleColor(UIColor.black, for: UIControlState())
            break
        case 80:
            
        householdBtn.setTitle(incomeArray[customPicker.selectedRow(inComponent: 0)], for: UIControlState())
          householdBtn.setTitleColor(UIColor.black, for: UIControlState())
            break
            
            
        default:
            break
        }
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    //MARK textfield delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailTxt.resignFirstResponder()
        nameTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
    }
    
    //MARK: service delegates
    
    func successForInsertuser(_ success: NSDictionary) {
        
        coreData.deleteAllData("Food")

        
        print("success:\(success)")
        
                let appDomain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
                UserDefaults.standard.synchronize()

        
        hideUnhideActivity(true)

        if (success["UserId"] != nil)  {
            
            
            
            UserDefaults.standard.setValue(success["UserId"], forKey: "UserId")
            performSegue(withIdentifier: "home", sender: self)
            
            
        }
        else
        {
            service.delegate = self
            service.insertUserNameAndPassword(nameTxt.text!, password: passwordTxt.text!, email: emailTxt.text!, DOB: (DobBtn.titleLabel?.text)!, gender: (genderBtn.titleLabel?.text)!, race: (raceBtn.titleLabel?.text)!, hispanic: (hispanicBtn.titleLabel?.text)!, grade: (gradebtn.titleLabel?.text)!, eoe: (EOEBtn.titleLabel?.text)!
                , father: (fatherBtn.titleLabel?.text)!, mother: (motherBtn.titleLabel?.text)!, income: (householdBtn.titleLabel?.text)!)
            
            hideUnhideActivity(false)
        }
        
        

    }
    
    func FailureForInsertuser(_ error: String) {
        
        hideUnhideActivity(true)
        alertViewFunc("Registration failed")
        print("failed")
        
        
    }
    
    
    func alertViewFunc(_ msg: String)  {
        
        
        let alertController = UIAlertController(title: "\(msg)", message: "", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
   
    
    
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

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
