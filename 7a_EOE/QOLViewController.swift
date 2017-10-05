//
//  QOLViewController.swift
//  7a_EOE
//


import UIKit
extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}
class QOLViewController: UIViewController,PortalServiceDelegate {
    
    @IBOutlet weak var viewForActivityIndicator: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var service = PortalService()
    var  qol1 = -1
    var  qol2 = -1
    var  qol3 = -1
    var  qol4 = -1
    var  qol5 = -1
    var  qol6 = -1
    var  qol7 = -1
    var  qol8 = -1
    var  qol9 = -1
    var  qol10 = -1
    var  qol11 = -1
    var  qol12 = -1
    var  qol13 = -1
    var  qol14 = -1
    var  qol15 = -1
    var  qol16 = -1
    var  qol17 = -1
    var  qol18 = -1
    var  qol19 = -1
    var  qol20 = -1
    var  qol21 = -1
    var  qol22 = -1
    var  qol23 = -1
    var  qol24 = -1
    var  qol25 = -1
    var  qol26 = -1
    var  qol27 = -1
    var  qol28 = -1
    var  qol29 = -1
    var  qol30 = -1
    var  qol31 = -1
    var  qol32 = -1
    var  qol33 = -1
    var  qol34 = -1
    var  qol35 = -1
    var  qol36 = -1
    
    var sym1count = 0
    var sym1score = 0.0
    var sym2count = 0
    var sym2score = 0.0
    var treatcount = 0
    var treatscore = 0.0
    var worrycount = 0
    var worryscore = 0.0
    var commcount = 0
    var commscore = 0.0
    var fecount = 0
    var fescore = 0.0
    var ffcount = 0
    var ffscore = 0.0
    var totcount = 0
    var totscore = 0.0
    var symcount = 0
    var symscore = 0.0
    
    var switch2 = -1
    var switch1 = -1
    
    @IBOutlet weak var feedingTubeView: UIView!
    @IBOutlet weak var feedingTubeHeight: NSLayoutConstraint!
    @IBOutlet weak var foodAlergic: UIView!
    @IBOutlet weak var heightFoodAlergic: NSLayoutConstraint!
    
    @IBOutlet weak var segment1Field: UILabel!
    @IBOutlet weak var segment1: UISegmentedControl!
    
    @IBOutlet weak var hideLbl: UILabel!
    @IBOutlet weak var hideView: UIView!
    @IBAction func segment1Action(_ sender: AnyObject) {
        
        segment1Field.text = returnLblStatus(segment1.selectedSegmentIndex)
        qol1 = segment1.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment2: UISegmentedControl!
    @IBOutlet weak var segment2field: UILabel!
    
    @IBAction func segment2Action(_ sender: AnyObject) {
        segment2field.text = returnLblStatus(segment2.selectedSegmentIndex)
        qol2 = segment2.selectedSegmentIndex
        
    }
    
    
    
    @IBOutlet weak var segment3Field: UILabel!
    @IBOutlet weak var segment3: UISegmentedControl!
    @IBAction func segment3Action(_ sender: AnyObject) {
        segment3Field.text = returnLblStatus(segment3.selectedSegmentIndex)
        qol3 = segment3.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment4Field: UILabel!
    @IBOutlet weak var segment4: UISegmentedControl!
    @IBAction func segment4Action(_ sender: AnyObject) {
        segment4Field.text = returnLblStatus(segment4.selectedSegmentIndex)
        qol4 = segment4.selectedSegmentIndex
        
        
    }
    
    @IBOutlet weak var segment5Field: UILabel!
    @IBOutlet weak var segment5: UISegmentedControl!
    @IBAction func segment5Action(_ sender: AnyObject) {
        segment5Field.text = returnLblStatus(segment5.selectedSegmentIndex)
        qol5 = segment5.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment6Field: UILabel!
    @IBOutlet weak var segment6: UISegmentedControl!
    @IBAction func segment6Action(_ sender: AnyObject) {
        segment6Field.text = returnLblStatus(segment6.selectedSegmentIndex)
        qol6 = segment6.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment7Field: UILabel!
    @IBOutlet weak var segment7: UISegmentedControl!
    @IBAction func segment7Action(_ sender: AnyObject) {
        segment7Field.text = returnLblStatus(segment7.selectedSegmentIndex)
        qol7 = segment7.selectedSegmentIndex
        
    }
    
    @IBOutlet weak var segment8Field: UILabel!
    @IBOutlet weak var segment8: UISegmentedControl!
    @IBAction func segment8Action(_ sender: AnyObject) {
        segment8Field.text = returnLblStatus(segment8.selectedSegmentIndex)
        qol8 = segment8.selectedSegmentIndex
        
    }
    
    
    
    
    @IBOutlet weak var segment10Field: UILabel!
    @IBOutlet weak var segment10: UISegmentedControl!
    @IBAction func segment10Action(_ sender: AnyObject) {
        segment10Field.text = returnLblStatus(segment10.selectedSegmentIndex)
        qol10 = segment10.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment11Field: UILabel!
    @IBOutlet weak var segment11: UISegmentedControl!
    @IBAction func segment11Action(_ sender: AnyObject) {
        segment11Field.text = returnLblStatus(segment11.selectedSegmentIndex)
        qol11 = segment11.selectedSegmentIndex
        
    }
    
    @IBOutlet weak var segment12Field: UILabel!
    @IBOutlet weak var segment12: UISegmentedControl!
    @IBAction func segment12Action(_ sender: AnyObject) {
        segment12Field.text = returnLblStatus(segment12.selectedSegmentIndex)
        qol12 = segment12.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment13Field: UILabel!
    @IBOutlet weak var segment13: UISegmentedControl!
    @IBAction func segment13Action(_ sender: AnyObject) {
        segment13Field.text = returnLblStatus(segment13.selectedSegmentIndex)
        qol13 = segment13.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment14Field: UILabel!
    @IBOutlet weak var segment14: UISegmentedControl!
    @IBAction func segment14Action(_ sender: AnyObject) {
        segment14Field.text = returnLblStatus(segment14.selectedSegmentIndex)
        qol14 = segment14.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment15Field: UILabel!
    @IBOutlet weak var segment15: UISegmentedControl!
    @IBAction func segment15Action(_ sender: AnyObject) {
        segment15Field.text = returnLblStatus(segment15.selectedSegmentIndex)
        qol15 = segment15.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment16Field: UILabel!
    @IBOutlet weak var segment16: UISegmentedControl!
    @IBAction func segment16Action(_ sender: AnyObject) {
        segment16Field.text = returnLblStatus(segment16.selectedSegmentIndex)
        qol16 = segment16.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment17Field: UILabel!
    @IBOutlet weak var segment17: UISegmentedControl!
    @IBAction func segment17Action(_ sender: AnyObject) {
        segment17Field.text = returnLblStatus(segment17.selectedSegmentIndex)
        qol17 = segment17.selectedSegmentIndex
        
    }
    
    @IBOutlet weak var segment18Field: UILabel!
    @IBOutlet weak var segment18: UISegmentedControl!
    @IBAction func segment18Action(_ sender: AnyObject) {
        segment18Field.text = returnLblStatus(segment18.selectedSegmentIndex)
        qol18 = segment18.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment19Field: UILabel!
    @IBOutlet weak var segment19: UISegmentedControl!
    @IBAction func segment19Action(_ sender: AnyObject) {
        segment19Field.text = returnLblStatus(segment19.selectedSegmentIndex)
        qol19 = segment19.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment20Field: UILabel!
    @IBOutlet weak var segment20: UISegmentedControl!
    @IBAction func segment20Action(_ sender: AnyObject) {
        segment20Field.text = returnLblStatus(segment20.selectedSegmentIndex)
        qol20 = segment20.selectedSegmentIndex
        
    }
    
    
    
    @IBOutlet weak var segment21Field: UILabel!
    @IBOutlet weak var segment21: UISegmentedControl!
    @IBAction func segment21Action(_ sender: AnyObject) {
        segment21Field.text = returnLblStatus(segment21.selectedSegmentIndex)
        qol21 = segment21.selectedSegmentIndex
        
    }
    
    
    
    @IBOutlet weak var segment22Field: UILabel!
    @IBOutlet weak var segment22: UISegmentedControl!
    @IBAction func segment22Action(_ sender: AnyObject) {
        segment22Field.text = returnLblStatus(segment22.selectedSegmentIndex)
        qol22 = segment22.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment23Field: UILabel!
    @IBOutlet weak var segment23: UISegmentedControl!
    @IBAction func segment23Action(_ sender: AnyObject) {
        segment23Field.text = returnLblStatus(segment23.selectedSegmentIndex)
        qol23 = segment23.selectedSegmentIndex
        
    }
    
    @IBOutlet weak var segment24Field: UILabel!
    
    @IBOutlet weak var segment24: UISegmentedControl!
    
    @IBAction func segment24Action(_ sender: AnyObject) {
        segment24Field.text = returnLblStatus(segment24.selectedSegmentIndex)
        qol24 = segment24.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment25Field: UILabel!
    @IBOutlet weak var segment25: UISegmentedControl!
    @IBAction func segment25Action(_ sender: AnyObject) {
        segment25Field.text = returnLblStatus(segment25.selectedSegmentIndex)
        qol25 = segment25.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment26Field: UILabel!
    @IBOutlet weak var segment26: UISegmentedControl!
    @IBAction func segment26Action(_ sender: AnyObject) {
        segment26Field.text = returnLblStatus(segment26.selectedSegmentIndex)
        qol26 = segment26.selectedSegmentIndex
        
    }
    
    @IBOutlet weak var segment27Field: UILabel!
    @IBOutlet weak var segment27: UISegmentedControl!
    
    @IBAction func segment27Action(_ sender: AnyObject) {
        segment27Field.text = returnLblStatus(segment27.selectedSegmentIndex)
        qol27 = segment27.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment28Field: UILabel!
    @IBOutlet weak var segment28: UISegmentedControl!
    
    @IBAction func segment28Action(_ sender: AnyObject) {
        segment28Field.text = returnLblStatus(segment28.selectedSegmentIndex)
        qol28 = segment28.selectedSegmentIndex
        
    }
    
    @IBOutlet weak var segment29Field: UILabel!
    @IBOutlet weak var segment29: UISegmentedControl!
    
    @IBAction func segment29Action(_ sender: AnyObject) {
        segment29Field.text = returnLblStatus(segment29.selectedSegmentIndex)
        qol29 = segment29.selectedSegmentIndex
        
        
    }
    
    
    @IBOutlet weak var segment30Field: UILabel!
    @IBOutlet weak var segment30: UISegmentedControl!
    @IBAction func segment30Action(_ sender: AnyObject) {
        segment30Field.text = returnLblStatus(segment30.selectedSegmentIndex)
        qol30 = segment30.selectedSegmentIndex
        
    }
    
    
    @IBOutlet weak var segment31Field: UILabel!
    @IBOutlet weak var segment31: UISegmentedControl!
    @IBAction func segment31Action(_ sender: AnyObject) {
        segment31Field.text = returnLblStatus(segment31.selectedSegmentIndex)
        qol31 = segment31.selectedSegmentIndex
        
        
    }
    
    
    @IBOutlet weak var segment32Field: UILabel!
    
    @IBOutlet weak var segment32: UISegmentedControl!
    
    @IBAction func segment32Action(_ sender: AnyObject) {
        segment32Field.text = returnLblStatus(segment32.selectedSegmentIndex)
        qol32 = segment32.selectedSegmentIndex
        
    }
    
    @IBOutlet weak var segment34Field: UILabel!
    @IBOutlet weak var segment34: UISegmentedControl!
    
    @IBAction func segment34Action(_ sender: AnyObject) {
        segment34Field.text = returnLblStatus(segment34.selectedSegmentIndex)
        qol34 = segment34.selectedSegmentIndex
        
        
    }
    
    
    
    
    @IBOutlet weak var segment33Field: UILabel!
    @IBOutlet weak var segment33: UISegmentedControl!
    @IBAction func segment33Action(_ sender: AnyObject) {
        segment33Field.text = returnLblStatus(segment33.selectedSegmentIndex)
        qol33 = segment33.selectedSegmentIndex
        
        
    }
    
    
    @IBOutlet weak var segment35Field: UILabel!
    
    @IBOutlet weak var segment35: UISegmentedControl!
    
    @IBAction func segment35Action(_ sender: AnyObject) {
        segment35Field.text = returnLblStatus(segment35.selectedSegmentIndex)
        qol35 = segment35.selectedSegmentIndex
        
    }
    
    @IBOutlet weak var segment36Field: UILabel!
    @IBOutlet weak var segment36: UISegmentedControl!
    
    @IBAction func segment36Action(_ sender: AnyObject) {
        segment36Field.text = returnLblStatus(segment36.selectedSegmentIndex)
        qol36 = segment36.selectedSegmentIndex
        
    }
    
    func returnLblStatus(_ index: Int) -> String{
        
        switch index {
        case 0:
            return "Never"
        case 1:
            return "Almost Never"
        case 2:
            return "Sometimes"
        case 3:
            return "Often"
        case 4:
            return "Almost Always"
        default:
            break
        }
        return ""
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       InitailhideViews()
        hideUnhideActivity(true)
    }
    
    func hideViews(){
        print("qoldate:\(UserDefaults.standard.value(forKey: "QOLDate"))")
        if UserDefaults.standard.value(forKey: "QOLDate") != nil
        {
            let differenceForSeven = 30
            let dateStored = "\(UserDefaults.standard.value(forKey: "QOLDate")!)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            let dateStr = formatter.date(from: dateStored)
            
            let differenceBtwTwo = differenceInDaysWithDate(dateStr!)
            
            let diff = differenceForSeven - differenceBtwTwo
            
            if diff == 0{
                self.hideView.isHidden = true
                scrollView.isScrollEnabled = true
                // close new view
            }else{
                
                DispatchQueue.main.async(execute: {
                    self.hideView.isHidden = false
                    self.hideLbl.text = "The survey has been completed.Fill the form after \(diff) days"
                    self.scrollView.scrollToTop()
                    self.scrollView.isScrollEnabled = false
                    self.viewDidLoad()
                    self.viewWillAppear(true)

                    })
               
                            print("remaining days:\(diff)")
                //print remaining days
            }
            //
            
        }
    }
    
    
    func InitailhideViews(){
        print("qoldate:\(UserDefaults.standard.value(forKey: "QOLDate"))")
        if UserDefaults.standard.value(forKey: "QOLDate") != nil
        {
            let differenceForSeven = 30
            let dateStored = "\(UserDefaults.standard.value(forKey: "QOLDate")!)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            let dateStr = formatter.date(from: dateStored)
            
            let differenceBtwTwo = differenceInDaysWithDate(dateStr!)
            
            let diff = differenceForSeven - differenceBtwTwo
            
            if diff == 0{
                self.hideView.isHidden = true
                scrollView.isScrollEnabled = true
                // close new view
            }else{
                
                DispatchQueue.main.async(execute: {
                    self.hideView.isHidden = false
                    self.hideLbl.text = "The survey has been completed.Fill the form after \(diff) days"
                    self.scrollView.scrollToTop()
                    self.scrollView.isScrollEnabled = false
                  
                    
                })
                
                print("remaining days:\(diff)")
                //print remaining days
            }
            //
            
        }
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightFoodAlergic.constant = 0
        foodAlergic.isHidden = true
        feedingTubeHeight.constant = 0
        feedingTubeView.isHidden = true
        //        self.tabBarController?.navigationItem.hidesBackButton = true
        // self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func foodAlergic(_ sender: UISwitch) {
        
        if sender.isOn{
            switch1 = 1

            heightFoodAlergic.constant = 1086
            foodAlergic.isHidden = false
            
        }else{
            switch1 = -1
            qol28 = -1
            qol29 = -1
            qol30 = -1
            qol31 = -1
            qol32 = -1
            qol33 = -1
            qol34 = -1
            heightFoodAlergic.constant = 0
            foodAlergic.isHidden = true
        }
        
        
    }
    
    @IBAction func feedingTube(_ sender: UISwitch) {
        if sender.isOn{
            switch2 = 1

            feedingTubeHeight.constant = 353
            feedingTubeView.isHidden = false
            
        }else{
            switch2 = -1

            feedingTubeHeight.constant = 0
            feedingTubeView.isHidden = true
        }
        
        
    }
    
    
    @IBAction func submit(_ sender: AnyObject) {
     //  hideViews()
       result()
    }
    
    func result()
    {
        sym1count = counter(qol1) + counter(qol2) + counter(qol3) + counter(qol4) + counter(qol5) + counter(qol6)
        sym1score = scoreCalc(qol1) + scoreCalc(qol2) + scoreCalc(qol3) + scoreCalc(qol4) + scoreCalc(qol5) + scoreCalc(qol6)
        
        sym2count = counter(qol7) + counter(qol8) + counter(qol10) + counter(qol11)
        sym2score = scoreCalc(qol7) + scoreCalc(qol8) + scoreCalc(qol10) + scoreCalc(qol11)
        
        treatcount = counter(qol12) + counter(qol13) + counter(qol14) + counter(qol15) + counter(qol16)
        treatscore = scoreCalc(qol12) + scoreCalc(qol13) + scoreCalc(qol14) + scoreCalc(qol15) + scoreCalc(qol16)
        
        worrycount = counter(qol17) + counter(qol18) + counter(qol19) + counter(qol20) + counter(qol21) + counter(qol22)
        worryscore = scoreCalc(qol17) + scoreCalc(qol18) + scoreCalc(qol19) + scoreCalc(qol20) + scoreCalc(qol21) + scoreCalc(qol22)
        
        commcount = counter(qol23) + counter(qol24) + counter(qol25) + counter(qol26) + counter(qol27)
        commscore = scoreCalc(qol23) + scoreCalc(qol24) + scoreCalc(qol25) + scoreCalc(qol26) + scoreCalc(qol27)
        
        fecount = counter(qol28) + counter(qol29) + counter(qol30) + counter(qol31)
        fescore = scoreCalc(qol28) + scoreCalc(qol29) + scoreCalc(qol30) + scoreCalc(qol31)
        
        ffcount = counter(qol32) + counter(qol33) + counter(qol34)
        ffscore = scoreCalc(qol32) + scoreCalc(qol33) + scoreCalc(qol34)
        
        totcount = sym1count + sym2count + treatcount + worrycount + commcount + fecount + ffcount
        totscore = sym1score + sym2score + treatscore + worryscore + commscore + fescore + ffscore
        
        symcount = sym1count + sym2count
        symscore = sym1score + sym2score
        
        
        if sym1count > 3 {
            
            sym1score = 0.0
        }
        else{
            
            sym1score = sym1score / (6 - Double(sym1count))
            
        }
        
        if sym2count > 2 {
            
            sym2score = 0.0
        }
        else{
            
            sym2score = sym2score / (4 - Double(sym2count))
            
        }
        
        if treatcount > 2 {
            
            treatscore = 0.0
        }
        else{
            
            treatscore = treatscore / (5 - Double(treatcount))
            
        }
        
        if worrycount > 3 {
            
            worryscore = 0.0
        }
        else{
            
            worryscore = worryscore / (6 - Double(worrycount))
            
        }
        if commcount > 2 {
            
            commscore = 0.0
        }
        else{
            
            commscore = commscore / (5 - Double(commcount))
            
        }
        
        if fecount > 2 {
            
            fescore = 0.0
        }
        else{
            
            fescore = fescore / (4 - Double(fecount))
            
        }
        
        if ffcount > 1 {
            
            ffscore = 0.0
        }
        else{
            
            ffscore = ffscore / (3 - Double(ffcount))
            
        }
        
        if totcount > 16 {
            
            totscore = 0.0
        }
        else{
            totscore = totscore / (33 - Double(totcount))
        }
        
        if symcount > 5 {
            
            symscore = 0.0
        }
        else{
            symscore = symscore / (10 - Double(symcount))
        }
        
        
        
        
        
        service.delegate = self
        service.insertQOL("\(qol1)", s1q2: "\(qol2)", s1q3: "\(qol3)", s1q4: "\(qol4)", s1q5: "\(qol5)", s1q6: "\(qol6)", s2q1: "\(qol7)", s2q2: "\(qol8)", s2q3: "\(qol10)", s2q4: "\(qol11)", s3q1: "\(qol12)", s3q2: "\(qol13)", s3q3: "\(qol14)", s3q4: "\(qol15)", s3q5: "\(qol16)", s4q1: "\(qol17)", s4q2: "\(qol18)", s4q3: "\(qol19)", s4q4: "\(qol20)", s4q5: "\(qol21)", s4q6: "\(qol22)", s5q1: "\(qol23)", s5q2: "\(qol24)", s5q3: "\(qol25)", s5q4: "\(qol26)", s5q5: "\(qol27)", s6q1: "\(qol28)", s6q2: "\(qol29)", s6q3: "\(qol30)", s6q4: "\(qol31)", s7q1: "\(qol32)", s7q2: "\(qol34)", s7q3: "\(qol33)", s8: "\(switch2)", s8q1: "\(qol35)", s8q2: "\(qol36)",switch1: "\(switch1)", sym1score: "\(sym1score)", sym2score: "\(sym2score)", treatscore: "\(treatscore)", worryscore: "\(worryscore)", commscore: "\(commscore)", fescore: "\(fescore)", ffscore: "\(ffscore)", totscore: "\(totscore)", symscore: "\(symscore)")
        
        hideUnhideActivity(false)
    }
    
    func differenceInDaysWithDate(_ date: Date) -> Int
    {
        let calendar: Calendar = Calendar.current
        
        
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: date)
        
        let components = (calendar as NSCalendar).components(.day, from: date2, to: date1, options: [])
        let days = components.day
        return days!
        
    }
    
    func scoreCalc(_ value: Int) -> Double {
        
        switch(value){
        case 0 : return 100
        case 1 : return 75
        case 2 : return 50
        case 3 : return 25
        case 4 : return 0
        default : return 0
        }
        
    }
    
    func counter(_ value: Int) -> Int {
        
        if(value == -1){
            return 1
        }
        
        return 0
        
    }
    
    
    func successForInsertQOL(_ success: String) {
        let currentDate = Date()
        UserDefaults.standard.setValue(currentDate, forKey: "QOLDate")
        hideUnhideActivity(true)
        hideViews()
        //alertViewFunc("successfully saved QOL data")
    }
    
    
    func FailureForInsertQOL(_ error: String) {
        hideUnhideActivity(true)
        alertViewFunc("failed to save QOL data")
        
    }
    
    func FailureForInsertQOLError(_ error: String) {
        result()
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
            
            self.viewForActivityIndicator.center = self.scrollView.center
            DispatchQueue.main.async(execute: {
                self.view.bringSubview(toFront: self.scrollView)
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
