//
//  ViewController.swift
//  7a_EOE
//
//

import UIKit

class ViewController: UIViewController,PortalServiceDelegate,UITextFieldDelegate {

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewForActivityIndicator: UIView!
    @IBOutlet weak var passwordTxt: UITextField!
    var service = PortalService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated:true);

    }

    @IBAction func Login(_ sender: AnyObject) {
//        
        let emailTxtWoWhite = emailTxt.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let passTxtWoWhite = passwordTxt.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
        if emailTxtWoWhite.characters.count>0 && passTxtWoWhite.characters.count>0{
                    service.delegate = self
                    service.SelectUserNameAndPassword(emailTxt.text!, password: passwordTxt.text!)
            hideUnhideActivity(false)
            
            
            
        }else{
            alertViewFunc("Please fill all the fields")

        }
        
//        service.delegate = self
//        service.SelectUserNameAndPassword(emailTxt.text!, password: passwordTxt.text!)
        
        
     //  performSegueWithIdentifier("home", sender: self)
      //  service.insertQOL()

        
        
    }
    
    
    
    
    @IBAction func Register(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "register", sender: self)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailTxt.resignFirstResponder()
        self.passwordTxt.resignFirstResponder()
    }
    
    func successForSelectuser(_ success: NSDictionary) {
        
        print("success:\(success)")
        
        hideUnhideActivity(true)
        print("\(UserDefaults.standard.value(forKey: "UserId"))")
        
        if UserDefaults.standard.value(forKey: "UserId") != nil{
           
            
        
            UserDefaults.standard.setValue(success["patientID"], forKey: "UserId")

                performSegue(withIdentifier: "home", sender: self)
            
        }else{
            
            let appDomain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
            UserDefaults.standard.synchronize()
            
            UserDefaults.standard.setValue(success["patientID"], forKey: "UserId")
            performSegue(withIdentifier: "home", sender: self)

        }
        
        

    }
    
    func FailureForSelectuser(_ error: String) {
        
        hideUnhideActivity(true)

        alertViewFunc("Failed to login")
     //   print("failed)")
        
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
            activityIndicator.startAnimating()
        }else{
            
            DispatchQueue.main.async(execute: {
                self.activityIndicator.stopAnimating()
                
            })
            
        }
        
        
    }
    
}

