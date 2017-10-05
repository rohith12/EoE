//
//  CoreDataHelper.swift
//  7a_EOE
//
//  Created by Rohith Raju on 11/27/16.
//  Copyright © 2016 Rohith Raju. All rights reserved.
//

import UIKit
import CoreData
@objc protocol CoreDataHelperDelegate {
    
    @objc optional func successForInserfoodCore(_ success:String)
    @objc optional func FailureForinsertFoodCore(_ error:String)
    
    @objc optional func successForRetfoodCore(_ success:NSArray)
    @objc optional func FailureForRetFoodCore(_ error:String)
}


class CoreDataHelper: NSObject {
    var delegate: CoreDataHelperDelegate?

    
    func insertFoodItems(_ food:NSArray){
        
        
      
        
        
     


     //   let ArrayOfData = food[0] as! NSDictionary
        
        for ArrayOfData in food {
            
            let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedObjectContext = appDel.managedObjectContext
            
            let entity = NSEntityDescription.insertNewObject(forEntityName: "Food", into: managedObjectContext)
            let diaryID = ((ArrayOfData as AnyObject).value(forKey: "diaryID") as AnyObject).int32Value
            let patientID = ((ArrayOfData as AnyObject).value(forKey: "patientID") as AnyObject).int32Value
            
            entity.setValue(NSNumber(value: diaryID! as Int32), forKey: "diaryID")
            entity.setValue(NSNumber(value: patientID! as Int32), forKey: "patientID")
            
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "feelAfter"), forKey: "feelAfter")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "feelBefore"), forKey: "feelBefore")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "image"), forKey: "image")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "inputPerson"), forKey: "inputPerson")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "location"), forKey: "location")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "meal"), forKey: "meal")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "others"), forKey: "others")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "partner"), forKey: "partner")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "someone"), forKey: "someone")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "time"), forKey: "time")
            entity.setValue((ArrayOfData as AnyObject).value(forKey: "worry"), forKey: "worry")
            
            do {
                
                try managedObjectContext.save()
                
            } catch {
                self.delegate?.FailureForinsertFoodCore!("error")
                print("There was a problem!")
                
            }
        }
        
        
        self.delegate?.successForInserfoodCore!("done")

       
    
    }
    
    
    
    func retriveFood(){
        
        
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedObjectContext = appDel.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: "Food", in: managedObjectContext)
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        do {
            let result = try managedObjectContext.fetch(fetchRequest)
            var foodArray = [FoodModel]()

            //  var arrayAid = [Int]()
            if (result.count > 0) {
                
                for res in result as! [NSManagedObject] {
                    
                    let food = FoodModel()
                    food.afterSymptom = "\(res.value(forKey: "feelBefore")!)"
                    food.beforeSymptom = "\(res.value(forKey: "feelAfter")!)"
                    food.worry = "\(res.value(forKey: "worry")!)"
                    food.companyToEat = "\(res.value(forKey: "partner")!)"
                    food.placeYouAte = "\(res.value(forKey: "location")!)"
                    food.mealType = "\(res.value(forKey: "meal")!)"
                    food.foodImg = "\(res.value(forKey: "image")!)"
                    //print("\(food.foodImg)")
                    
                    foodArray.append(food)

                }
                
                self.delegate?.successForRetfoodCore!(foodArray as NSArray)
                
               // print("leagueDictionary:\(LeagueDictionary),\(LeagueDictionary[1])")
            }else{
                self.delegate?.FailureForRetFoodCore!("")

            }
        }
        catch {
            let fetchError = error as NSError
            self.delegate?.FailureForRetFoodCore!("\(fetchError.localizedDescription)")
            print(fetchError)
        }
        
    }
    
    func deleteAllData(_ entity: String)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
    
}
