//
//  PortalService.swift
//  7a_EOE
//


import UIKit
import Alamofire

@objc protocol PortalServiceDelegate {

    @objc optional func successForSelectuser(_ success:NSDictionary)
    @objc optional func FailureForSelectuser(_ error:String)
    
    
    @objc optional func successForInsertuser(_ success:NSDictionary)
    @objc optional func FailureForInsertuser(_ error:String)
    
    @objc optional func successForInsertQOL(_ success:String)
    @objc optional func FailureForInsertQOL(_ error:String)
    @objc optional func FailureForInsertQOLError(_ error:String)

    @objc optional func successForUploadImage(_ success:NSDictionary)
    @objc optional func FailureForUploadImage(_ error:String)
    
    @objc optional func successForInsertFood(_ success:NSArray)
    @objc optional func FailureForInsertFood(_ error:String)
    @objc optional func FailureForInsertFoodError(_ error:String)

    @objc optional func successForGetFood(_ success:NSArray)
    @objc optional func FailureForGetFood(_ error:String)
    
    
    @objc optional func successForInsertSymptoms(_ success:String)
    @objc optional func FailureForInsertSumptoms(_ error:String)
    @objc optional func FailureForInsertSymptomsError(_ error:String)
    
    @objc optional func successForInsertUT(_ success:String)
    @objc optional func FailureForInsertUT(_ error:String)
    @objc optional func FailureForInsertUTError(_ error:String)

    
}


class PortalService: NSObject {

    var delegate: PortalServiceDelegate?

    
    func SelectUserNameAndPassword(_ name: String, password: String) {
        
        Alamofire.request(.GET, "https://people.cs.clemson.edu/~rraju/eoeScripts/login.php", parameters: ["email": name,"password":password])
            .responseJSON { request, response, result in
                switch result {
                case .success(let JSON):
                    print("Success with JSON: \(JSON)")
                    self.delegate?.successForSelectuser!(JSON as! NSDictionary)
                case .failure(let data, let error):
                    print("Request failed with error: \(error)")
                    
                    if let data = data {
                        print("Response data: \(NSString(data: data, encoding: String.Encoding.utf8)!)")
                        self.delegate?.FailureForSelectuser!("\(NSString(data: data, encoding: String.Encoding.utf8)!)")
                    }
                }
        }
        
        
    }
    
    func insertUserNameAndPassword(_ name: String, password: String,email: String,DOB: String,gender: String,race:String,hispanic: String,grade: String,eoe: String,father: String,mother: String,income: String) {
        
        Alamofire.request(.POST, "https://people.cs.clemson.edu/~rraju/eoeScripts/insertpatient.php", parameters: ["email": email,"password":password,"patientName":name,"gender":gender,"date":DOB,"Grade":grade,"Ethnicity":hispanic,"Race":race,"LenDisease":eoe,"FamIncome":income,"FathEduc":father,"MotherEduc":mother])
            .responseJSON { (request, response, result) in

                switch result {
                case .success(let JSON):
                    print("Success with JSON: \(JSON)")
                    self.delegate?.successForInsertuser!(JSON as! NSDictionary)
                    
                case .failure(let data, let error):
                    print("Request failed with error: \(error)")
                    
                    if let data = data {
                        print("Response data: \(NSString(data: data, encoding: String.Encoding.utf8)!)")
                        self.delegate?.FailureForInsertuser!("\(NSString(data: data, encoding: String.Encoding.utf8)!)")
                    }
                }
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    func insertQOL(_ s1q1:String,s1q2:String,s1q3:String,s1q4:String,s1q5:String,s1q6:String,s2q1:String,s2q2:String,s2q3:String,s2q4:String,s3q1:String,s3q2:String,s3q3:String,s3q4:String,s3q5:String,s4q1:String,s4q2:String,s4q3:String,s4q4:String,s4q5:String,s4q6:String,s5q1:String,s5q2:String,s5q3:String,s5q4:String,s5q5:String,s6q1:String,s6q2:String,s6q3:String,s6q4:String,s7q1:String,s7q2:String,s7q3:String,s8:String,s8q1:String,s8q2:String,switch1: String, sym1score:String, sym2score:String, treatscore:String, worryscore:String, commscore:String, fescore:String, ffscore:String, totscore:String, symscore:String){
        
        
        let timeCurrent = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let values:[String:String] = ["user_patientid":"\(UserDefaults.standard.value(forKey: "UserId")!)","time":dateFormat.string(from: timeCurrent),"s1q1":s1q1,"s1q2":s1q2,"s1q3":s1q3,"s1q4":s1q4,"s1q5":s1q5,"s1q6":s1q6,"s2q1":s2q1,"s2q2":s2q2,"s2q3":s2q3,"s2q4":s2q4,"s3q1":s3q1,"s3q2":s3q2,"s3q3":s3q3,"s3q4":s3q4,"s3q5":s3q5,"s4q1":s4q1,"s4q2":s4q2,"s4q3":s4q3,"s4q4":s4q4,"s4q5":s4q5,"s4q6":s4q6,"s5q1":s5q1,"s5q2":s5q2,"s5q3":s5q3,"s5q4":s5q4,"s5q5":s5q5,"s6q1":s6q1,"s6q2":s6q2,"s6q3":s6q3,"s6q4":s6q4,"s7q1":s7q1,"s7q2":s7q2,"s7q3":s7q3,"s8":s8,"s8q1":s8q1,"s8q2":s8q2,"s67":switch1, "sym1score":sym1score, "sym2score":sym2score, "treatscore":treatscore, "worryscore":worryscore,"commscore":commscore, "fescore":fescore, "ffscore":ffscore,"totscore":totscore,"symscore":symscore]
        
        let request = NSMutableURLRequest(url: URL(string: "https://people.cs.clemson.edu/~rraju/eoeScripts/insertQol.php")!)
        request.timeoutInterval = 35
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("text/html", forHTTPHeaderField: "Accept")
        request.setValue("iOS/8.0", forHTTPHeaderField: "User-Agent")
        request.httpBody = try! JSONSerialization.data(withJSONObject: ["qol":values], options: [])
        
        
        
        // or if you think the conversion might actually fail (which is unlikely if you built `parameters` yourself)
        //
        // do {
        //    request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])
        // } catch {
        //    print(error)
        // }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("error: \(error)")
                self.delegate?.FailureForInsertQOLError!((error?.localizedDescription)!)

                return
            }
            
            // this, on the other hand, can quite easily fail if there's a server error, so you definitely
            // want to wrap this in `do`-`try`-`catch`:
            
            do {
                if let json = String(data: data, encoding: String.Encoding.utf8){
                    
                    
                    let success = json                                  // Okay, the `json` is here, let's get the value for 'success' out of it
                    self.delegate?.successForInsertQOL!("done")
                    print("Success: \(success)")
                } else {
                    let jsonStr = String(data: data, encoding: String.Encoding.utf8)    // No error thrown, but not NSDictionary
                    self.delegate?.FailureForInsertQOL!("jsonStr")
                    print("Error could not parse JSON: \(jsonStr)")
                }
            }
            
            
        }) 
        
        task.resume()
        
        
    }
    
    func uploadImage(_ imageToUpload: UIImage){
        
        let timeCurrent = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let fileName = "file\(dateFormat.string(from: timeCurrent)).png"
//
//        Alamofire.upload(
//            .POST,
//            "https://people.cs.clemson.edu/~rraju/eoeScripts/saveImage.php",
//            multipartFormData: { multipartFormData in
//                
//                if let imageData = UIImageJPEGRepresentation(imageToUpload, 1) {
//                    multipartFormData.appendBodyPart(data: imageData, name: "file", fileName: fileName, mimeType: "image/png")
//                }
//                
//              
//            }, encodingCompletion: { encodingResult in
//                
//                
//                switch encodingResult {
//                case .Success(let upload, _, _):
//                    
//                    upload.responseJSON { response in
//                       print("success: \(response)")
//                        let json = response.2.value!
//                        
//                       let dict = json as! NSDictionary
//                        
//                        print("req:\(dict["fileLocation"]!)")
//                       // debugPrint(response)
//                        self.delegate?.successForUploadImage!(dict)
//                        
//                    }
//                case .Failure(let encodingError):
//                    print("error:\(encodingError)")
//                    self.delegate?.FailureForUploadImage!("error")
//                }
//            }
//        )
        
        let url = URL(string: "https://people.cs.clemson.edu/~rraju/eoeScripts/saveImage.php")
        
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let boundary = generateBoundaryString()
        
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
       
        
        let image_data = UIImagePNGRepresentation(imageToUpload)
        
        
        if(image_data == nil)
        {
            return
        }
        
        
        let body = NSMutableData()
        
        let fname = fileName
        let mimetype = "image/png"
        
        
        
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"test\"\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append("hi\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append(image_data!)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        request.httpBody = body as Data
        
        
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request, completionHandler: {
            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            
//         let   jsonObject = try! NSJSONSerialization.JSONObjectWithData(data!, options: [])
//            print("json:\(jsonObject)")
           //let json = jsonObject.2.value!
//            
//                let dict = json as! NSDictionary
//            
//                print("req:\(dict["fileLocation"]!)")
//
//        self.delegate?.successForUploadImage!(dict)
            
            
           
            let dataString = try! JSONSerialization.jsonObject(with: data!, options: [])
            
            if ((dataString["fileLocation"]) != nil){
                self.delegate?.successForUploadImage!(dataString as! NSDictionary)
            }else{
                
                
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8)
                
                print(dataString)
                self.delegate?.FailureForUploadImage!("\(dataString)")
            }
            
            
            
        }) 
        
        task.resume()
        

}
    
    func generateBoundaryString() -> String
    {
        return "Boundary-\(UUID().uuidString)"
    }
    
    
    func insertFood(_ imageName: String,parent: String,whereHome: String,whichMeal: String,whoAlone: String,feelBefore: String,feelAfter: String,allergic: String,others: String){
        
        
        let timeCurrent = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        
        let values:[String:String] = ["user_patientid":"\(UserDefaults.standard.value(forKey: "UserId")!)","time":dateFormat.string(from: timeCurrent),"imgName":"https://people.cs.clemson.edu/~rraju/eoeScripts/eoeImgs/\(imageName)","whoisinput":parent,"wherelinternal":whereHome,"whichMealinternal":whichMeal,"whointernal":whoAlone,"feelBeforeint":feelBefore,"feelAfterint":feelAfter,"allergicint":allergic,"others":others]
        
        
        print("valuesForFood:\(values)")
        
        
//        Alamofire.request(.POST, "https://people.cs.clemson.edu/~rraju/eoeScripts/insertfoodDiary.php", parameters: ["food": values],encoding: .JSON
//            )
//            
//            
//           .responseJSON { (request, response, result) in
//                switch result {
//                    
//                    
//                    
//                case .Success(let JSON):
//                    
//                    print("Success with JSON: \(JSON)")
//                    // self.delegate?.successForInsertuser!(JSON as! NSArray)
//                    self.delegate?.successForInsertFood!(JSON as! NSArray)
//                    
//                    
//                case .Failure(let data, let error):
//                    print("Request failed with error: \(error)")
//                    
//                    if let data = data {
//                        
//                        
//                        print("Response data: \(NSString(data: data, encoding: NSUTF8StringEncoding)!)")
//                        // self.delegate?.FailureForInsertuser!("\(NSString(data: data, encoding: NSUTF8StringEncoding)!)")
//                        
//                        self.delegate?.FailureForInsertFood!("success")
//                    }
//                }
//        }
        
        
        
        
        
        
        
        
        let request = NSMutableURLRequest(url: URL(string: "https://people.cs.clemson.edu/~rraju/eoeScripts/insertfoodDiary.php")!)
        request.timeoutInterval = 35
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("text/html", forHTTPHeaderField: "Accept")
        request.setValue("iOS/8.0", forHTTPHeaderField: "User-Agent")
        request.httpBody = try! JSONSerialization.data(withJSONObject: ["food":values], options: [])
        
        // or if you think the conversion might actually fail (which is unlikely if you built `parameters` yourself)
        //
        // do {
        //    request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])
        // } catch {
        //    print(error)
        // }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("error: \(error)")
                self.delegate?.FailureForInsertFoodError!((error?.localizedDescription)!)
                return
            }
            
            // this, on the other hand, can quite easily fail if there's a server error, so you definitely
            // want to wrap this in `do`-`try`-`catch`:
            
            do {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                
                if  json.count > 0
                {
                    
                    
                    let success = json                                  // Okay, the `json` is here, let's get the value for 'success' out of it
                    self.delegate?.successForInsertFood!(success)
                    print("Success: \(success)")
                } else {
                    let jsonStr = String(data: data, encoding: String.Encoding.utf8)    // No error thrown, but not NSDictionary
                    self.delegate?.FailureForInsertFood!("error")
                    print("Error could not parse JSON: \(jsonStr)")
                }
            }
            
            
        }) 
        
        task.resume()
    }
    
    func getFoodDiary(){
        
        Alamofire.request(.GET, "https://people.cs.clemson.edu/~rraju/eoeScripts/getFood.php",parameters: ["patientID":"\(UserDefaults.standard.value(forKey: "UserId")!)"])
            
            
            .responseJSON { request, response, result in
                print("\(request)")
                switch result {
                case .success(let JSON):
                    print("Success with JSON: \(JSON)")
                    self.delegate?.successForGetFood!(JSON as! NSArray)
                   // self.delegate?.successForSelectMultipleTeamsByUSerId!(JSON as! NSArray)
                case .failure(let data, let error):
                    print("Request failed with error: \(error)")
                    
                    if let data = data {
                        print("Response data: \(NSString(data: data, encoding: String.Encoding.utf8)!)")
                        self.delegate?.FailureForGetFood!("\(NSString(data: data, encoding: String.Encoding.utf8)!)")
                      //  self.delegate?.failureFrSelectMultipleTeamsByUSerId!("\(NSString(data: data, encoding: NSUTF8StringEncoding)!)")
                    }
                }
        }
        

        
        
        
        
    }
    
    
    func insertSymptoms(_ q1f:String,q1s:String,q2f:String,q2s:String,q3f:String,q3s:String,q4f:String,q4s:String,q5f:String,q5s:String,q6f:String,q6s:String,q7f:String,q7s:String,q8f:String,q8s:String,q9f:String,q9s:String,q10f:String,q11f:String,freq_score:String,sev_score:String,tot_score:String,dysphagia:String,gerd:String,nausea:String,pain:String){
        
        
        let timeCurrent = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let values:[String:String] = ["user_patientid":"\(UserDefaults.standard.value(forKey: "UserId")!)","time":dateFormat.string(from: timeCurrent),"q1f":q1f,"q1s":q1s,"q2f":q2f,"q2s":q2s,"q3f":q3f,"q3s":q3s,"q4f":q4f,"q4s":q4s,"q5f":q5f,"q5s":q5s,"q6f":q6f,"q6s":q6s,"q7f":q7f,"q7s":q7s,"q8f":q8f,"q8s":q8s,"q9f":q9f,"q9s":q9s,"q10f":q10f,"q11f":q11f,"freq_score":freq_score,"sev_score":sev_score,"tot_score":tot_score,"dysphagia":dysphagia,"gerd":gerd,"nausea":nausea,"pain":pain]
        
        
        print("valuesForSymptoms:\(values)")
        
        
        let request = NSMutableURLRequest(url: URL(string: "https://people.cs.clemson.edu/~rraju/eoeScripts/insertSymptoms.php")!)

        let session = URLSession.shared
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("text/html", forHTTPHeaderField: "Accept")
        request.setValue("iOS/8.0", forHTTPHeaderField: "User-Agent")
        request.timeoutInterval = 35

        request.httpBody = try! JSONSerialization.data(withJSONObject: ["symptoms":values], options: [])
        
        // or if you think the conversion might actually fail (which is unlikely if you built `parameters` yourself)
        //
        // do {
        //    request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])
        // } catch {
        //    print(error)
        // }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                
                
                print("error: \(error)")
                self.delegate?.FailureForInsertSymptomsError!("error")
                return
            }
            
            // this, on the other hand, can quite easily fail if there's a server error, so you definitely
            // want to wrap this in `do`-`try`-`catch`:
            
            do {
                if let json = String(data: data, encoding: String.Encoding.utf8){
                    
                    
                    let success = json                                  // Okay, the `json` is here, let's get the value for 'success' out of it
                    self.delegate?.successForInsertSymptoms!("success")
                    print("Success: \(success)")
                } else {
                    let jsonStr = String(data: data, encoding: String.Encoding.utf8)    // No error thrown, but not NSDictionary
                    self.delegate?.FailureForInsertSumptoms!("error")
                    print("Error could not parse JSON: \(jsonStr)")
                }
            } catch let parseError {
                print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
                let jsonStr = String(data: data, encoding: String.Encoding.utf8)
                print("Error could not parse JSON: '\(jsonStr)'")
            }
        }) 
        
        task.resume()
        

}

    
    
    
    func insertUserTreatment(_ steroid:String,dietary:String,foodElimination:String,allergy_syptoms:String,allergy_syptoms_food:String,elementalDiet:String,exclElemental:String,formula:String,foodTrial:String,foodTrial_food:String){
        
        
        let timeCurrent = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let values:[String:String] = ["user_patientid":"\(UserDefaults.standard.value(forKey: "UserId")!)","time":dateFormat.string(from: timeCurrent),"steroid":steroid,"dietary":dietary,"foodElimination":foodElimination,"allergy_syptoms":allergy_syptoms,"allergy_syptoms_food":allergy_syptoms_food,"elementalDiet":elementalDiet,"exclElemental":exclElemental,"formula":formula,"foodTrial":foodTrial,"foodTrial_food":foodTrial_food]
        
        
        print("valuesForSymptoms:\(values)")
        
        
        let request = NSMutableURLRequest(url: URL(string: "https://people.cs.clemson.edu/~rraju/eoeScripts/insertUT.php")!)
        
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("text/html", forHTTPHeaderField: "Accept")
        request.setValue("iOS/8.0", forHTTPHeaderField: "User-Agent")
        request.timeoutInterval = 35
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: ["ut":values], options: [])
        
        // or if you think the conversion might actually fail (which is unlikely if you built `parameters` yourself)
        //
        // do {
        //    request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])
        // } catch {
        //    print(error)
        // }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                
                
                print("error: \(error)")
                self.delegate?.FailureForInsertUTError!("error")
                return
            }
            
            // this, on the other hand, can quite easily fail if there's a server error, so you definitely
            // want to wrap this in `do`-`try`-`catch`:
            
            do {
                if let json = String(data: data, encoding: String.Encoding.utf8){
                    
                    
                    let success = json                                  // Okay, the `json` is here, let's get the value for 'success' out of it
                    self.delegate?.successForInsertUT!("success")
                    print("Success: \(success)")
                } else {
                    let jsonStr = String(data: data, encoding: String.Encoding.utf8)    // No error thrown, but not NSDictionary
                    self.delegate?.FailureForInsertUT!("error")
                    print("Error could not parse JSON: \(jsonStr)")
                }
            } catch let parseError {
                print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
                let jsonStr = String(data: data, encoding: String.Encoding.utf8)
                print("Error could not parse JSON: '\(jsonStr)'")
            }
        }) 
        
        task.resume()
        
        
    }
    
    
    
}




