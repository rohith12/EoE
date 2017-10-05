//
//  ReminderViewController.swift
//  7a_EOE
//
//  Created by Rohith Raju on 11/20/16.
//  Copyright © 2016 Rohith Raju. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {

    var decidePicker = -1
    
    @IBOutlet weak var qolOut: UIButton!
    @IBOutlet weak var symOut: UIButton!
    @IBOutlet weak var dinOut: UIButton!
    @IBOutlet weak var lunOut: UIButton!
    @IBOutlet weak var bfOut: UIButton!
    
    
    @IBOutlet weak var lunch: UISwitch!
    @IBOutlet weak var breakFast: UISwitch!
    @IBOutlet weak var customToolbar: UIToolbar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var symptoms: UISwitch!
    @IBOutlet weak var dinner: UISwitch!
    @IBOutlet weak var frontView: UIView!
    
    @IBOutlet weak var qol: UISwitch!
    
    @IBOutlet weak var bfHeight: NSLayoutConstraint!
    @IBOutlet weak var bfView: UIView!
    
    
    @IBOutlet weak var lunchHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lunchView: UIView!
    
    @IBOutlet weak var dinView: UIView!
    @IBOutlet weak var dinHeight: NSLayoutConstraint!
    
    @IBOutlet weak var sympHeight: NSLayoutConstraint!
    
    @IBOutlet weak var sympView: UIView!
    
    
    @IBOutlet weak var qolHeight: NSLayoutConstraint!
    @IBOutlet weak var qolView: UIView!
    
    override func viewDidLoad() {
        
        hideAllViews()

        super.viewDidLoad()
        switches()
        self.datePicker.backgroundColor = UIColor.lightGray
        for notification in UIApplication.shared.scheduledLocalNotifications!{
            print("notic:\(notification.userInfo)")
        }
        
       // allNotifiaction()
        // Do any additional setup after loading the view.
    }
    
    func DeleteNotifiaction(_ name: String){
        
        let app:UIApplication = UIApplication.shared
        for oneEvent in app.scheduledLocalNotifications! {
            let notification = oneEvent as UILocalNotification
            let userInfoCurrent = notification.userInfo! as! [String:AnyObject]
            let dict  = userInfoCurrent.keys.first
            
            
            print("userInfo:\(userInfoCurrent)")
            
            if dict  == name {
                let uid = userInfoCurrent[name]!.int32Value

                if uid  == 1 {
                    //Cancelling local notification
                    app.cancelLocalNotification(notification)
                    break;
                }else if uid == 2{
                    app.cancelLocalNotification(notification)
                    break;
                    
                }else if uid == 3{
                    app.cancelLocalNotification(notification)
                    break;
                }else if uid == 4{
                    app.cancelLocalNotification(notification)
                    break;
                }else if uid == 5{
                    app.cancelLocalNotification(notification)
                    break;
                }

            }
            
                        print("userInfo:\(oneEvent)")
           
        }
    }
    
    func switches(){
      //edit
    
        if UserDefaults.standard.value(forKey: "Bf") != nil
        {
            let bf = "\(UserDefaults.standard.value(forKey: "Bf")!)"

            if ( bf == "On" && bf.characters.count>0) {
                
                breakFast.setOn(true, animated: false)
                
                
                bfHeight.constant = 101.0
                bfView.isHidden = false
                if UserDefaults.standard.value(forKey: "BfDate") != nil
                {
                    bfOut.setTitle("\(UserDefaults.standard.value(forKey: "BfDate")!)", for: UIControlState())
                    
                }
                

            }else{
                
                //NSUserDefaults.standardUserDefaults().setValue("Breakfast reminder", forKeyPath: "bfName")
            
                breakFast.setOn(false, animated: false)
                
            }
            
            
        }else{
            breakFast.setOn(false, animated: false)

        }
        
        
        if UserDefaults.standard.value(forKey: "Lunch") != nil
        {
            let bf = "\(UserDefaults.standard.value(forKey: "Lunch")!)"
            
            if ( bf == "On" && bf.characters.count>0) {
                lunch.setOn(true, animated: false)
                
                lunchHeight.constant = 102.0
                lunchView.isHidden = false
                if UserDefaults.standard.value(forKey: "LunDate") != nil
                {
                    lunOut.setTitle("\(UserDefaults.standard.value(forKey: "LunDate")!)", for: UIControlState())
                    
                }
                
            }else{
                lunch.setOn(false, animated: false)
                
            }
            
            
        }else{
            lunch.setOn(false, animated: false)
            
        }
        
        if UserDefaults.standard.value(forKey: "Dinner") != nil
        {
            let Dinner = "\(UserDefaults.standard.value(forKey: "Dinner")!)"
            
            if ( Dinner == "On" && Dinner.characters.count>0) {
                dinner.setOn(true, animated: false)
                dinHeight.constant = 113.0
                dinView.isHidden = false
                if UserDefaults.standard.value(forKey: "DinDate") != nil
                {
                    dinOut.setTitle("\(UserDefaults.standard.value(forKey: "DinDate")!)", for: UIControlState())
                    
                }
            }else{
                dinner.setOn(false, animated: false)
                
            }
            
            
        }else{
            dinner.setOn(false, animated: false)
            
        }
        
        
        
        if UserDefaults.standard.value(forKey: "Symptoms") != nil
        {
            let Symptoms = "\(UserDefaults.standard.value(forKey: "Symptoms")!)"
            
            if ( Symptoms == "On" && Symptoms.characters.count>0) {
                symptoms.setOn(true, animated: false)
                sympHeight.constant = 97.0
                sympView.isHidden = false
                if UserDefaults.standard.value(forKey: "SymDate") != nil
                {
                    symOut.setTitle("\(UserDefaults.standard.value(forKey: "SymDate")!)", for: UIControlState())
                    
                }
            }else{
                symptoms.setOn(false, animated: false)
                
            }
            
            
        }else{
            symptoms.setOn(false, animated: false)
            
        }
       
        
        if UserDefaults.standard.value(forKey: "QOL") != nil
        {
            let QOL = "\(UserDefaults.standard.value(forKey: "QOL")!)"
            
            if ( QOL == "On" && QOL.characters.count>0) {
                qol.setOn(true, animated: false)
                qolHeight.constant = 124.0
                qolView.isHidden = false
                if UserDefaults.standard.value(forKey: "QolDate") != nil
                {
                    qolOut.setTitle("\(UserDefaults.standard.value(forKey: "QolDate")!)", for: UIControlState())
                    
                }
            }else{
                
                
                qol.setOn(false, animated: false)
                
            }
            
            
        }else{
            qol.setOn(false, animated: false)
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        for notification in UIApplication.shared.scheduledLocalNotifications!{
            print("notic:\(notification)")
        }
        
        
    }
    
    func hideAllViews(){
        bfHeight.constant = 0.0
        bfView.isHidden = true
        qolHeight.constant = 0.0
        qolView.isHidden = true
        bfHeight.constant = 0.0
        bfView.isHidden = true
        lunchHeight.constant = 0.0
        lunchView.isHidden = true
        sympHeight.constant = 0.0
        sympView.isHidden = true
        dinHeight.constant = 0.0
        dinView.isHidden = true
    }
    
    @IBAction func Breakfast(_ sender: UISwitch) {
        
        
        if sender.isOn {
            
            bfHeight.constant = 101.0
            bfView.isHidden = false
            UserDefaults.standard.setValue("On", forKey: "Bf")
            decidePicker = 1
            showCustomPicker()
            
                
            
            self.datePicker.reloadInputViews()
            
            
        }else{
            
            bfHeight.constant = 0.0
            bfView.isHidden = true
            UserDefaults.standard.setValue("Off", forKey: "Bf")
            DeleteNotifiaction(UserDefaults.standard.value(forKey: "bfName") as! String)
            
        }
}
    
    @IBAction func Lunch(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.setValue("On", forKey: "Lunch")
            lunchHeight.constant = 102.0
            lunchView.isHidden = false
            decidePicker = 2
            showCustomPicker()
            self.datePicker.reloadInputViews()
        }else{
            UserDefaults.standard.setValue("Off", forKey: "Lunch")
            lunchHeight.constant = 0.0
            lunchView.isHidden = true
            DeleteNotifiaction(UserDefaults.standard.value(forKey: "LunName") as! String)

        }
  
    }
    
    @IBAction func Dinner(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.setValue("On", forKey: "Dinner")
            dinHeight.constant = 113.0
            dinView.isHidden = false
            decidePicker = 3
            showCustomPicker()
            self.datePicker.reloadInputViews()
        }else{
            dinHeight.constant = 0.0
            dinView.isHidden = true
            DeleteNotifiaction(UserDefaults.standard.value(forKey: "DinName") as! String)

            UserDefaults.standard.setValue("Off", forKey: "Dinner")

        }
    
    }

    @IBAction func Symptoms(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.setValue("On", forKey: "Symptoms")
            sympHeight.constant = 97.0
            sympView.isHidden = false
            decidePicker = 4
            showCustomPicker()
            self.datePicker.reloadInputViews()
        }else{
            UserDefaults.standard.setValue("Off", forKey: "Symptoms")
            sympHeight.constant = 0.0
            sympView.isHidden = true
            DeleteNotifiaction(UserDefaults.standard.value(forKey: "SymName") as! String)

        }
       
    }
    
    
    
    @IBAction func reminders(_ sender: UISwitch) {
        
        
        if sender.isOn {
            UserDefaults.standard.setValue("On", forKey: "QOL")
            qolHeight.constant = 124.0
            qolView.isHidden = false
            decidePicker = 5
            showCustomPicker()
            self.datePicker.reloadInputViews()
 
        }else{
            qolHeight.constant = 0.0
            qolView.isHidden = true
            UserDefaults.standard.setValue("Off", forKey: "QOL")
            DeleteNotifiaction(UserDefaults.standard.value(forKey: "QolName") as! String)

        }
}
    
    
    
    @IBAction func Done(_ sender: AnyObject) {
        
        switch decidePicker {
        case 1:
        //    scheduleNotification("Breakfast reminder", date: dateFormatter(self.datePicker.date))
            UserDefaults.standard.setValue("Breakfast reminder", forKeyPath: "bfName")
            scheduleNotification("Breakfast reminder", date: self.datePicker.date, num: 1)
            break
        case 2:
            UserDefaults.standard.setValue("Lunch reminder", forKeyPath: "LunName")

            //scheduleNotification("Lunch reminder", date: dateFormatter(self.datePicker.date))
        scheduleNotification("Lunch reminder", date: self.datePicker.date, num: 2)

            break
        case 3:
            UserDefaults.standard.setValue("Dinner reminder", forKeyPath: "DinName")

            scheduleNotification("Dinner reminder", date: self.datePicker.date, num: 3)
            //scheduleNotification("Dinner reminder", date: dateFormatter(self.datePicker.date))
            break
        case 4:
            UserDefaults.standard.setValue("Symptoms reminder", forKeyPath: "SymName")
            scheduleNotificationWeekly("Symptoms reminder", date: self.datePicker.date, num: 4)//scheduleNotificationWeekly("Symptoms reminder", date: dateFormatter(self.datePicker.date))
            break
        case 5:
            UserDefaults.standard.setValue("QOL reminder", forKeyPath: "QolName")
            scheduleNotificationMonthly("QOL reminder", date: self.datePicker.date, num: 5)//scheduleNotificationWeekly("Symptoms reminder", date: dateFormatter(self.datePicker.date))
           // scheduleNotificationMonthly("QOL reminder", date: dateFormatter(self.datePicker.date))
            break
        default:
            break
        }
        
      //  UIApplication.sharedApplication().scheduledLocalNotifications as! [UILocalNotification]
     //   UIApplication.sharedApplication().cancelLocalNotification(notification)

        hideCustomPicker()
      //  setButtonTitle()
        
        
    }
    
    func dateFormatter(_ date: Date)-> String{
        

        print("date before:\(date)")
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.autoupdatingCurrent
        formatter.locale =  Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss a"
        let DateVal = formatter.string(from: date)
        //print("date after:\(DateVal)")
        //print("date after:\(strDate)")
        return DateVal
        
    }
    
    
    func dateFormatterWoDate(_ date: Date)-> NSString{
        
        
        print("date before:\(date)")
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss a"
        let DateVal = formatter.string(from: date)
        print("date after:\(DateVal)")
      
        return DateVal as NSString
        
    }
    
    
    
 
    
    func showCustomPicker(){
        
        self.scrollView.frame = CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height-260);
        self.frontView.isUserInteractionEnabled = false
        self.datePicker.isHidden = false
        self.customToolbar.isHidden = false
        
    }
    
    func hideCustomPicker(){
        
        self.scrollView.frame=CGRect(x: 0, y: self.scrollView.frame.origin.y, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height+260);
        self.scrollView.contentSize=CGSize(width: self.view.frame.size.width,height: 1000);
        self.frontView.isUserInteractionEnabled = true
        self.datePicker.isHidden = true
        self.customToolbar.isHidden = true
        
    }
    
    
    
    func scheduleNotification(_ alert: String,date: Date ,num: Int){
        print("date:\(date)")
        let localNotification = UILocalNotification()
        localNotification.fireDate = date
        localNotification.repeatInterval = NSCalendar.Unit.day
        localNotification.alertBody = alert
        localNotification.alertTitle = alert
        localNotification.userInfo = [alert:num]

        localNotification.timeZone = TimeZone.current
        localNotification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
        for notification in UIApplication.shared.scheduledLocalNotifications!{
            print("notic:\(notification.alertBody)")
        }
        
      settitle()

    }
    
    
    func settitle(){
        switch decidePicker {
        case 1:
            UserDefaults.standard.setValue("\(dateFormatterWoDate(datePicker.date))", forKeyPath: "BfDate")
            bfOut.setTitle("\(dateFormatterWoDate(datePicker.date))", for: UIControlState())
            break
        case 2:
            
             UserDefaults.standard.setValue("\(dateFormatterWoDate(datePicker.date))", forKeyPath: "LunDate")
            lunOut.setTitle("\(dateFormatterWoDate(datePicker.date))", for: UIControlState())
            break
        case 3:
             UserDefaults.standard.setValue("\(dateFormatterWoDate(datePicker.date))", forKeyPath: "DinDate")
            dinOut.setTitle("\(dateFormatterWoDate(datePicker.date))", for: UIControlState())
            break
        case 4:
              UserDefaults.standard.setValue("\(dateFormatter(datePicker.date))", forKeyPath: "SymDate")
            symOut.setTitle("\(dateFormatter(datePicker.date))", for: UIControlState())
            break
        case 5:
            UserDefaults.standard.setValue("\(dateFormatter(datePicker.date))", forKeyPath: "QolDate")

            qolOut.setTitle("\(dateFormatter(datePicker.date))", for: UIControlState())
            break
        default:
            break
        }
        
    }
    
    func scheduleNotificationMonthly(_ alert: String,date: Date,num: Int ){
        print("date:\(date)")
        let localNotification = UILocalNotification()
        localNotification.fireDate = date
       // localNotification.repeatInterval = NSCalendarUnit.Month
        localNotification.alertBody = alert
        localNotification.alertTitle = alert
        localNotification.userInfo = [alert:num]

        localNotification.timeZone = TimeZone.current
        localNotification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
        for notification in UIApplication.shared.scheduledLocalNotifications!{
            print("notic:\(notification)")
        }
       settitle()
       
    }

    func scheduleNotificationWeekly(_ alert: String,date: Date,num: Int  ){
        print("date:\(date)")
        let localNotification = UILocalNotification()
        localNotification.fireDate = date
      //  localNotification.repeatInterval = NSCalendarUnit.WeekOfMonth
        localNotification.alertBody = alert
        localNotification.alertTitle = alert
        localNotification.timeZone = TimeZone.current
        localNotification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
        localNotification.userInfo = [alert:num]

        UIApplication.shared.scheduleLocalNotification(localNotification)
        for notification in UIApplication.shared.scheduledLocalNotifications!{
            print("notic:\(notification.alertBody)")
        }
       settitle()
    
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
