//
//  LocalDatastore.swift
//  ParseDemo
//
//  Created by 蔡鈞 on 2016/2/16.
//  Copyright © 2016年 mike840609. All rights reserved.
//

import UIKit

class LocalDatastore: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //先到 linkedFramworks and Libraries 新增 libsqlite3.tbd
        //AppDelegate.swift -> Parse.enableLocalDatastore()
        // Create a contact pfobject to store locally==============================
        
        //let contact = PFObject(className: "Contact")
        //contact["firstname"] = "Kevin"
        //contact["lastname"] = "Smith"
        //contact["email"] = "kevin@gmail.com"
        //contact.pinInBackground()
        
        
        //Retrieve from the local data store=============================
        let query = PFQuery(className: "Contact")
        query.whereKey("firstname", equalTo: "Kevin")
        query.fromLocalDatastore()
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            if error == nil{
                if let contact = object{
                    print(contact["firstname"])
                }
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
