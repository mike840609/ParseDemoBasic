//
//  RelationalData&Object.swift
//  ParseDemo
//
//  Created by 蔡鈞 on 2016/2/18.
//  Copyright © 2016年 mike840609. All rights reserved.
//

import UIKit

class RelationalData_Object: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creating and saving a phonecall with Mike=====================================
        /*
        
        do{
            
            // Retrieve Mike
            let query = PFQuery(className: "Contact")
            query.whereKey("objectId", equalTo: "4KsbV9lsAh")
            let contact = try query.getFirstObject()
            
            // Create a new PhoneCall object
            let call = PFObject(className: "PhoneCall")
            
            
            // Set its key value pairs
            call["duration"] = 50
            call["topic"] = "Follow up"
            call["contact"] = contact
            
            // Save it
            call.saveInBackground()
            
        }
        catch{
            // Couldn't get the contact
        }
        */
        
        
        // A query to retrieve all phone calls with Mike (Relation Queries)=============================
        /*
        
        let callQuery = PFQuery(className: "PhoneCall")
        callQuery.whereKey("contact", equalTo: PFObject(withoutDataWithClassName: "Contact", objectId: "4KsbV9lsAh"))
        callQuery.findObjectsInBackgroundWithBlock { (object, error) -> Void in
            // All the phone calls we had with Mike
            
        }
        
        */
        
        // Retrieving all phone calls 
        let allCallQuery = PFQuery(className: "PhoneCall")
        //只搜尋含有contact的值
        //allCallQuery.includeKey("contact")
        allCallQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if let calls = objects{
                
                let firstCall = calls[0]
                let contact = firstCall["contact"]
                
                
                contact.fetchIfNeededInBackgroundWithBlock({ (object, error) -> Void in
                    if let  firstname = object?["firstname"] as? NSString{
                        print(firstname)
                    }
                })
            }
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
