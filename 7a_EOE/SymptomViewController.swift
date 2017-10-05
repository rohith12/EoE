//
//  SymptomViewController.swift
//  7a_EOE
//


import UIKit



class SymptomViewController: UIViewController,PortalServiceDelegate {
    
    @IBOutlet weak var hideViewFront: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewForActivityIndicator: UIView!
    var service = PortalService()
    var q1f = -1
    var q1s = -1
    var q2f = -1
    var q2s = -1
    var q3f = -1
    var q3s = -1
    var q4f = -1
    var q4s = -1
    var q5f = -1
    var q5s = -1
    var q6f = -1
    var q6s = -1
    var q7f = -1
    var q7s = -1
    var q8f = -1
    var q8s = -1
    var q9f = -1
    var q9s = -1
    var q10f = -1
    var q11f = -1
    var freq_count = 0
    var sev_count = 0
    var dysphagia_count = 0
    var gerd_count = 0
    var nausea_count = 0
    var pain_count = 0
    
    var freq_score = 0.0
    var sev_score = 0.0
    var tot_score = 0.0
    var dysphagia = 0.0
    var gerd = 0.0
    var nausea = 0.0
    var pain = 0.0
    
    @IBOutlet weak var heightNineSub: NSLayoutConstraint!
    @IBOutlet weak var nineSub: UIView!
    @IBOutlet weak var heightEightSub: NSLayoutConstraint!
    @IBOutlet weak var eightSub: UIView!
    @IBOutlet weak var heightSevenSub: NSLayoutConstraint!
    @IBOutlet weak var sevenSub: UIView!
    @IBOutlet weak var heightSixSub: NSLayoutConstraint!
    @IBOutlet weak var six_sub: UIView!
    @IBOutlet weak var heightFoodStuckFive: NSLayoutConstraint!
    @IBOutlet weak var fiveSub: UIView!
    @IBOutlet weak var heightSwallowing: NSLayoutConstraint!
    @IBOutlet weak var four_sub: UIView!
    @IBOutlet weak var threeSub: UIView!
    @IBOutlet weak var heightStomachAche: NSLayoutConstraint!
    @IBOutlet weak var two_sub: UIView!
    @IBOutlet weak var heightHeartBurn: NSLayoutConstraint!
    @IBOutlet weak var one_sub: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var heightBadChest: NSLayoutConstraint!
    
    
    @IBOutlet weak var segmentStomachAche: UISegmentedControl!
    @IBOutlet weak var segementHeartBurn: UISegmentedControl!
    
    @IBOutlet weak var segmentSwallowing: UISegmentedControl!
    
    @IBOutlet weak var segmentStuck: UISegmentedControl!
    @IBOutlet weak var segmentSwallow: UISegmentedControl!
    
    @IBOutlet weak var throwUpSegment: UISegmentedControl!
    
    @IBOutlet weak var nauseaSegement: UISegmentedControl!
    
    @IBOutlet weak var foodBackSegement: UISegmentedControl!
    
    @IBOutlet weak var eatLessSegment: UISegmentedControl!
    
    @IBOutlet weak var eatMoreSegment: UISegmentedControl!
    
    
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var oneSub: UILabel!
    
    @IBOutlet weak var two: UILabel!
    
    @IBOutlet weak var twoSub: UILabel!
    @IBOutlet weak var three: UILabel!
    
    @IBOutlet weak var threeSubLbl: UILabel!
    
    @IBOutlet weak var fourLbl: UILabel!
    @IBOutlet weak var fourSubLbl: UILabel!
    
    @IBOutlet weak var fiveLbl: UILabel!
    
    @IBOutlet weak var fiveSubLbl: UILabel!
    
    @IBOutlet weak var sixLbl: UILabel!
    
    @IBOutlet weak var sixSubLbl: UILabel!
    
    @IBOutlet weak var eightLbl: UILabel!
    
    @IBOutlet weak var eightSubLbl: UILabel!
    
    @IBOutlet weak var nineLbl: UILabel!
    
    @IBOutlet weak var nineSubLbl: UILabel!
    
    @IBOutlet weak var tenLbl: UILabel!
    
    @IBOutlet weak var tenSubLbl: UILabel!
    
    @IBOutlet weak var elevenLbl: UILabel!
    
    
    @IBOutlet weak var tweleveLbl: UILabel!
    
    @IBOutlet weak var oneSubSegement: UISegmentedControl!
    
    @IBOutlet weak var twoSubSegement: UISegmentedControl!
    
    @IBOutlet weak var threeSubSegement: UISegmentedControl!
    
    @IBOutlet weak var fourSubSegement: UISegmentedControl!
    
    @IBOutlet weak var fiveSubSegement: UISegmentedControl!
    
    @IBOutlet weak var sixSubSegement: UISegmentedControl!
    
    @IBOutlet weak var sevenSubSegement: UISegmentedControl!
    
    @IBOutlet weak var eightSubSegment: UISegmentedControl!
    
    @IBOutlet weak var nineSubSegement: UISegmentedControl!
    
    @IBOutlet weak var hideView: UIView!
    
    @IBOutlet weak var hideLbl: UILabel!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        hideUnhideSubQuestions()
        
        
        
        // self.tabBarController?.navigationItem.hidesBackButton = true
//        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)

        // Do any additional setup after loading the view.
        //[self.navigationItem setHidesBackButton:YES]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        InitialhideForm()
        hideUnhideActivity(true)
    }
    
    func hideForm(){
        
        print("symp:\(UserDefaults.standard.value(forKey: "symptomsDate"))")
        if UserDefaults.standard.value(forKey: "symptomsDate") != nil
        {
            let differenceForSeven = 7
            let dateStored = "\(UserDefaults.standard.value(forKey: "symptomsDate")!)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            let dateStr = formatter.date(from: dateStored)
            
            let differenceBtwTwo = differenceInDaysWithDate(dateStr!)
            
            let diff = differenceForSeven - differenceBtwTwo
            
            if diff == 0{
               
                self.hideViewFront.isHidden = true
                self.scrollView.isScrollEnabled = true

                // close new view
            }else{
              
            
                
                DispatchQueue.main.async(execute: {
                    self.hideViewFront.isHidden = false
                    self.hideLbl.text = "The survey has been completed. Fill the form after \(diff) days"
                    self.scrollView.scrollToTop()
                    self.scrollView.isScrollEnabled = false
                    self.viewDidLoad()
                    self.viewWillAppear(true)
                    
                })
                
                //print remaining days
            }
            
        }
    }
    
    
    func InitialhideForm(){
        if UserDefaults.standard.value(forKey: "symptomsDate") != nil
        {
            let differenceForSeven = 7
            let dateStored = "\(UserDefaults.standard.value(forKey: "symptomsDate")!)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            let dateStr = formatter.date(from: dateStored)
            
            let differenceBtwTwo = differenceInDaysWithDate(dateStr!)
            
            let diff = differenceForSeven - differenceBtwTwo
            
            if diff == 0{
                
                self.hideViewFront.isHidden = true
                // close new view
            }else{
                
                
                
                DispatchQueue.main.async(execute: {
                    self.hideViewFront.isHidden = false
                    self.hideLbl.text = "The survey has been completed.Fill the form after \(diff) days"
                    self.scrollView.scrollToTop()
                    self.scrollView.isScrollEnabled = false
                    
                })
                
                //print remaining days
            }
            
        }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func hideUnhideSubQuestions(){
        heightBadChest.constant = 0.0
        one_sub.isHidden = true
        heightHeartBurn.constant = 0.0
        two_sub.isHidden = true
        heightStomachAche.constant = 0.0
        threeSub.isHidden = true
        heightSwallowing.constant = 0.0
        four_sub.isHidden = true
        heightFoodStuckFive.constant = 0.0
        fiveSub.isHidden = true
        heightSixSub.constant = 0.0
        six_sub.isHidden = true
        heightSevenSub.constant = 0.0
        sevenSub.isHidden = true
        heightEightSub.constant = 0.0
        eightSub.isHidden = true
        heightNineSub.constant = 0.0
        nineSub.isHidden = true

    }
    
    
    @IBAction func ofenChestPain(_ sender: AnyObject) {
        
        q1f = segmentedControl.selectedSegmentIndex
        q1s = oneSubSegement.selectedSegmentIndex
        
        if(segmentedControl.selectedSegmentIndex == 0)
        {
            q1s = -1
            
            heightBadChest.constant = 0.0
            one_sub.isHidden = true 
        }
        else if(segmentedControl.selectedSegmentIndex == 1)
        {
            
            heightBadChest.constant = 128.0
            one_sub.isHidden = false

        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            heightBadChest.constant = 128.0
            one_sub.isHidden = false

        }
        else if(segmentedControl.selectedSegmentIndex == 3)
        {
            
            heightBadChest.constant = 128.0
            one_sub.isHidden = false
            
        }
        else if(segmentedControl.selectedSegmentIndex == 4)
        {
            heightBadChest.constant = 128.0
            one_sub.isHidden = false
            
        }
        
        one.text = returnLblStatus(segmentedControl.selectedSegmentIndex)
    }
    
    
    @IBAction func oftenHeartBurn(_ sender: AnyObject) {
        
        q2f = segementHeartBurn.selectedSegmentIndex
        q2s = twoSubSegement.selectedSegmentIndex
        
        if(segementHeartBurn.selectedSegmentIndex == 0)
        {
            q2s = -1

            heightHeartBurn.constant = 0.0
            two_sub.isHidden = true
        }
        else if(segementHeartBurn.selectedSegmentIndex == 1)
        {
            
            heightHeartBurn.constant = 128.0
            two_sub.isHidden = false
            
        }
        else if(segementHeartBurn.selectedSegmentIndex == 2)
        {
            heightHeartBurn.constant = 128.0
            two_sub.isHidden = false

            
        }
        else if(segementHeartBurn.selectedSegmentIndex == 3)
        {
            
            heightHeartBurn.constant = 128.0
            two_sub.isHidden = false

            
        }
        else if(segementHeartBurn.selectedSegmentIndex == 4)
        {
            heightHeartBurn.constant = 128.0
            two_sub.isHidden = false

            
        }
        two.text = returnLblStatus(segementHeartBurn.selectedSegmentIndex)

        
    }
    

    @IBAction func segmentStomachAche(_ sender: AnyObject) {
        
        q3f = segmentStomachAche.selectedSegmentIndex
        q3s = threeSubSegement.selectedSegmentIndex
        
        if(segmentStomachAche.selectedSegmentIndex == 0)
        {
            q3s = -1

            heightStomachAche.constant = 0.0
            threeSub.isHidden = true
        }
        else if(segmentStomachAche.selectedSegmentIndex == 1)
        {
            
            heightStomachAche.constant = 128.0
            threeSub.isHidden = false
            
        }
        else if(segmentStomachAche.selectedSegmentIndex == 2)
        {
            heightStomachAche.constant = 128.0
            threeSub.isHidden = false
            
        }
        else if(segmentStomachAche.selectedSegmentIndex == 3)
        {
            
            heightStomachAche.constant = 128.0
            threeSub.isHidden = false
            
            
        }
        else if(segmentStomachAche.selectedSegmentIndex == 4)
        {
            heightStomachAche.constant = 128.0
            threeSub.isHidden = false
            
        }
        
        
        three.text = returnLblStatus(segmentStomachAche.selectedSegmentIndex)

        
        
    }
    
    
    @IBAction func swallowOften(_ sender: AnyObject) {
        
        q4f = segmentSwallowing.selectedSegmentIndex
        q4s = fourSubSegement.selectedSegmentIndex
        
        if(segmentSwallowing.selectedSegmentIndex == 0)
        {
            q4s = -1

            heightSwallowing.constant = 0.0
            four_sub.isHidden = true
        }
        else if(segmentSwallowing.selectedSegmentIndex == 1)
        {
            
            heightSwallowing.constant = 128.0
            four_sub.isHidden = false
            
        }
        else if(segmentSwallowing.selectedSegmentIndex == 2)
        {
            heightSwallowing.constant = 128.0
            four_sub.isHidden = false
            
        }
        else if(segmentSwallowing.selectedSegmentIndex == 3)
        {
            
            heightSwallowing.constant = 128.0
            four_sub.isHidden = false
            
        }
        else if(segmentSwallowing.selectedSegmentIndex == 4)
        {
            heightSwallowing.constant = 128.0
            four_sub.isHidden = false
            
        }
        
        fourLbl.text = returnLblStatus(segmentSwallowing.selectedSegmentIndex)

        
        
    }
    
    
    @IBAction func oftenStuck(_ sender: AnyObject) {
        
        q5f = segmentStuck.selectedSegmentIndex
        q5s = fiveSubSegement.selectedSegmentIndex
        
        if(segmentStuck.selectedSegmentIndex == 0)
        {
            q5s = -1
            heightFoodStuckFive.constant = 0.0
            fiveSub.isHidden = true
        }
        else if(segmentStuck.selectedSegmentIndex == 1)
        {
            
            heightFoodStuckFive.constant = 128.0
            fiveSub.isHidden = false
            
        }
        else if(segmentStuck.selectedSegmentIndex == 2)
        {
            heightFoodStuckFive.constant = 128.0
            fiveSub.isHidden = false
            
        }
        else if(segmentStuck.selectedSegmentIndex == 3)
        {
            
            heightFoodStuckFive.constant = 128.0
            fiveSub.isHidden = false
            
        }
        else if(segmentStuck.selectedSegmentIndex == 4)
        {
            heightFoodStuckFive.constant = 128.0
            fiveSub.isHidden = false
            
        }
        
        fiveLbl.text = returnLblStatus(segmentStuck.selectedSegmentIndex)

        
    }
    
    @IBAction func drink_Swallow(_ sender: AnyObject) {
        
        q6f = segmentSwallow.selectedSegmentIndex
        q6s = sixSubSegement.selectedSegmentIndex
        
        
        if(segmentSwallow.selectedSegmentIndex == 0)
        {
            q6s = -1
            heightSixSub.constant = 0.0
            six_sub.isHidden = true
        }
        else if(segmentSwallow.selectedSegmentIndex == 1)
        {
            
            heightSixSub.constant = 128.0
            six_sub.isHidden = false
            
        }
        else if(segmentSwallow.selectedSegmentIndex == 2)
        {
            
            heightSixSub.constant = 128.0
            six_sub.isHidden = false
        }
        else if(segmentSwallow.selectedSegmentIndex == 3)
        {
            
            heightSixSub.constant = 128.0
            six_sub.isHidden = false
            
        }
        else if(segmentSwallow.selectedSegmentIndex == 4)
        {
            
            heightSixSub.constant = 128.0
            six_sub.isHidden = false
            
        }
        sixLbl.text = returnLblStatus(segmentSwallow.selectedSegmentIndex)

        
    }
    
    
    
    @IBAction func throwingSegement(_ sender: AnyObject) {
        
        q7f = throwUpSegment.selectedSegmentIndex
        q7s = sevenSubSegement.selectedSegmentIndex
        
        
        if(throwUpSegment.selectedSegmentIndex == 0)
        {
            q7s = -1

            heightSevenSub.constant = 0.0
            sevenSub.isHidden = true
        }
        else if(throwUpSegment.selectedSegmentIndex == 1)
        {
            
            heightSevenSub.constant = 128.0
            sevenSub.isHidden = false
            
        }
        else if(throwUpSegment.selectedSegmentIndex == 2)
        {
            
            heightSevenSub.constant = 128.0
            sevenSub.isHidden = false
        }
        else if(throwUpSegment.selectedSegmentIndex == 3)
        {
            
            heightSevenSub.constant = 128.0
            sevenSub.isHidden = false
            
        }
        else if(throwUpSegment.selectedSegmentIndex == 4)
        {
            
            heightSevenSub.constant = 128.0
            sevenSub.isHidden = false
        }
       eightLbl .text = returnLblStatus(throwUpSegment.selectedSegmentIndex)

        
    }
    
    
    @IBAction func nausea(_ sender: AnyObject) {
        
        q8f = nauseaSegement.selectedSegmentIndex
        q8s = eightSubSegment.selectedSegmentIndex
        
        if(nauseaSegement.selectedSegmentIndex == 0)
        {
            q8s = -1

            heightEightSub.constant = 0.0
            eightSub.isHidden = true
        }
        else if(nauseaSegement.selectedSegmentIndex == 1)
        {
            
            heightEightSub.constant = 128.0
            eightSub.isHidden = false
            
        }
        else if(nauseaSegement.selectedSegmentIndex == 2)
        {
            
            heightEightSub.constant = 128.0
            eightSub.isHidden = false
        }
        else if(nauseaSegement.selectedSegmentIndex == 3)
        {
            
            heightEightSub.constant = 128.0
            eightSub.isHidden = false
            
        }
        else if(nauseaSegement.selectedSegmentIndex == 4)
        {
            
            heightEightSub.constant = 128.0
            eightSub.isHidden = false
        }
        nineLbl.text = returnLblStatus(nauseaSegement.selectedSegmentIndex)

    }
    
    @IBAction func foodComeBack(_ sender: AnyObject) {
        
        q9f = foodBackSegement.selectedSegmentIndex
        q9s = nineSubSegement.selectedSegmentIndex
        
        if(foodBackSegement.selectedSegmentIndex == 0)
        {
            q9s = -1

            heightNineSub.constant = 0.0
            nineSub.isHidden = true
        }
        else if(foodBackSegement.selectedSegmentIndex == 1)
        {
            
            heightNineSub.constant = 128.0
            nineSub.isHidden = false
            
        }
        else if(foodBackSegement.selectedSegmentIndex == 2)
        {
            
            heightNineSub.constant = 128.0
            nineSub.isHidden = false        }
        else if(foodBackSegement.selectedSegmentIndex == 3)
        {
            
            heightNineSub.constant = 128.0
            nineSub.isHidden = false
            
        }
        else if(foodBackSegement.selectedSegmentIndex == 4)
        {
            
            heightNineSub.constant = 128.0
            nineSub.isHidden = false
        }
        
        
        tenLbl.text = returnLblStatus(foodBackSegement.selectedSegmentIndex)
    }
    
    
    @IBAction func eatLess(_ sender: AnyObject) {
        
        q10f = eatLessSegment.selectedSegmentIndex
        
        elevenLbl.text = returnLblStatus(eatLessSegment.selectedSegmentIndex)
        
    }
    
    
    @IBAction func eatMore(_ sender: AnyObject) {
        
        q11f = eatMoreSegment.selectedSegmentIndex
        
        tweleveLbl.text = returnLblStatus(eatMoreSegment.selectedSegmentIndex)
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
    
    
    func subreturnLblStatus(_ index: Int) -> String{
        
        switch index {
        case 0:
            return "Not Bad at all"
        case 1:
            return "A little bad"
        case 2:
            return "Kind of bad"
        case 3:
            return "Bad"
        case 4:
            return "Very bad"
            
        default:
            break
        }
        return ""
    }

    //MARK: - sub segements
    
    
    @IBAction func OneSub(_ sender: AnyObject) {
      
        
        oneSub.text = subreturnLblStatus(oneSubSegement.selectedSegmentIndex)
        q1s = oneSubSegement.selectedSegmentIndex
    }
    
    
    @IBAction func twoSub(_ sender: AnyObject) {
         twoSub.text = subreturnLblStatus(twoSubSegement.selectedSegmentIndex)
        q2s = twoSubSegement.selectedSegmentIndex

    }
    
    
    @IBAction func threeSub(_ sender: AnyObject) {
        threeSubLbl.text = subreturnLblStatus(threeSubSegement.selectedSegmentIndex)
        q3s = threeSubSegement.selectedSegmentIndex

    }
    
    
    @IBAction func fourSub(_ sender: AnyObject) {
        fourSubLbl.text = subreturnLblStatus(fourSubSegement.selectedSegmentIndex)
        q4s = fourSubSegement.selectedSegmentIndex

    }
    
    
    
    @IBAction func fiveSub(_ sender: AnyObject) {
        fiveSubLbl.text = subreturnLblStatus(fiveSubSegement.selectedSegmentIndex)
        q5s = fiveSubSegement.selectedSegmentIndex

    }
    
    
    @IBAction func sixSub(_ sender: AnyObject) {
        sixSubLbl.text = subreturnLblStatus(sixSubSegement.selectedSegmentIndex)
        q6s = sixSubSegement.selectedSegmentIndex

    }
    
    @IBAction func sevenSub(_ sender: AnyObject) {
        eightSubLbl.text = subreturnLblStatus(sevenSubSegement.selectedSegmentIndex)
        q7s = sevenSubSegement.selectedSegmentIndex

    }
    
    
    @IBAction func eightSub(_ sender: AnyObject) {
        
        nineSubLbl.text = subreturnLblStatus(eightSubSegment.selectedSegmentIndex)
        q8s = eightSubSegment.selectedSegmentIndex

    }
    
    @IBAction func nineSub(_ sender: AnyObject) {
        
        tenSubLbl.text = subreturnLblStatus(nineSubSegement.selectedSegmentIndex)
        q9s = nineSubSegement.selectedSegmentIndex

    }
    
    
    
    @IBAction func submit(_ sender: AnyObject) {
 
        resultMethod()
    }
    
    func resultMethod(){
        freq_count = counter(q1f) + counter(q2f) + counter(q3f) + counter(q4f) + counter(q5f) + counter(q6f) + counter(q7f) + counter(q8f) + counter(q9f) + counter(q10f) + counter(q11f)
        freq_score = scoreCalc(q1f) + scoreCalc(q2f) + scoreCalc(q3f) + scoreCalc(q4f) + scoreCalc(q5f) + scoreCalc(q6f) + scoreCalc(q7f) + scoreCalc(q8f) + scoreCalc(q9f) + scoreCalc(q10f) + scoreCalc(q11f)
        
        sev_count = counter(q1s) + counter(q2s) + counter(q3s) + counter(q4s) + counter(q5s) + counter(q6s) + counter(q7s) + counter(q8s) + counter(q9s)
        sev_score = scoreCalc(q1s) + scoreCalc(q2s) + scoreCalc(q3s) + scoreCalc(q4s) + scoreCalc(q5s) + scoreCalc(q6s) + scoreCalc(q7s) + scoreCalc(q8s) + scoreCalc(q9s)
        
        dysphagia_count = counter(q4f) + counter(q4s) + counter(q5f) + counter(q5s) + counter(q6f) + counter(q6s) + counter(q10f) + counter(q11f)
        dysphagia = scoreCalc(q4f) + scoreCalc(q4s) + scoreCalc(q5f) + scoreCalc(q5s) + scoreCalc(q6f) + scoreCalc(q6s) + scoreCalc(q10f) + scoreCalc(q11f)
        
        gerd_count = counter(q2f) + counter(q2s) + counter(q9f) + counter(q9s)
        gerd = scoreCalc(q2f) + scoreCalc(q2s) + scoreCalc(q9f) + scoreCalc(q9s)
        
        nausea_count = counter(q7f) + counter(q7s) + counter(q8f) + counter(q8s)
        nausea = scoreCalc(q7f) + scoreCalc(q7s) + scoreCalc(q8f) + scoreCalc(q8s)
        
        pain_count = counter(q1f) + counter(q1s) + counter(q3f) + counter(q3s)
        pain = scoreCalc(q1f) + scoreCalc(q1s) + scoreCalc(q3f) + scoreCalc(q3s)
        
        print(sev_count)
        print(freq_count)
        
        
        if pain_count > 2{
            pain = 0.0
        }
        else{
            pain = pain / (4 - Double(pain_count))
        }
        
        if nausea_count > 2{
            nausea = 0.0
        }
        else{
            nausea = nausea / (4 - Double(nausea_count))
        }
        
        if gerd_count > 2 {
            gerd = 0.0
        }
        else{
            gerd = gerd / (4 - Double(gerd_count))
        }
        
        if dysphagia_count > 4 {
            dysphagia = 0.0
        }
        else{
            dysphagia = dysphagia / (8 - Double(dysphagia_count))
        }
        
        
        if freq_count + sev_count > 10 {
            tot_score = 0.0
        }
        else{
            tot_score = (sev_score + freq_score) / (20 - (Double(sev_count + freq_count)))
        }
        if freq_count > 5 {
            freq_score = 0.0
        }
        else{
            freq_score = freq_score / (11 - Double(freq_count))
        }
        
        if sev_count > 4 {
            sev_score = 0.0
        }
        else{
            sev_score = sev_score / (9 - Double(sev_count))
        }
        
        hideUnhideActivity(false)
        service.delegate = self
        service.insertSymptoms("\(q1f)", q1s: "\(q1s)", q2f: "\(q2f)", q2s: "\(q2s)", q3f: "\(q3f)", q3s: "\(q3s)", q4f: "\(q4f)", q4s: "\(q4s)", q5f: "\(q5f)", q5s: "\(q5s)", q6f: "\(q6f)", q6s: "\(q6s)", q7f: "\(q7f)", q7s: "\(q7s)", q8f: "\(q8f)", q8s: "\(q8s)", q9f: "\(q9f)", q9s: "\(q9s)", q10f: "\(q10f)", q11f: "\(q11f)", freq_score: "\(freq_score)", sev_score: "\(sev_score)", tot_score: "\(tot_score)",dysphagia: "\(dysphagia)", gerd: "\(gerd)", nausea: "\(nausea)", pain: "\(pain)")
        
        freq_count = 0
        sev_count = 0
        dysphagia_count = 0
        gerd_count = 0
        nausea_count = 0
        pain_count = 0
        
        freq_score = 0.0
        sev_score = 0.0
        tot_score = 0.0
        dysphagia = 0.0
        gerd = 0.0
        nausea = 0.0
        pain = 0.0
    }
    
    
    func scoreCalc(_ value: Int) -> Double {
        
        switch(value){
        case 0 : return 0
        case 1 : return 25
        case 2 : return 50
        case 3 : return 75
        case 4 : return 100
        default : return 0
        }
        
    }
    
    func counter(_ value: Int) -> Int {
        
        if(value == -1){
            return 1
        }
        
        return 0
        
    }
    
    func successForInsertSymptoms(_ success: String) {
        let currentDate = Date()
        UserDefaults.standard.setValue(currentDate, forKey: "symptomsDate")
        hideUnhideActivity(true)
        hideForm()
       
        //alertViewFunc("successfully inserted symptoms")
    }
    
    func FailureForInsertSumptoms(_ error: String) {
        hideUnhideActivity(true)
        alertViewFunc("failed to insert symptoms")
    }
    
    func FailureForInsertSymptomsError(_ error: String){
        resultMethod()
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
