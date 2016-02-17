//
//  ViewController.swift
//  ParseDemo
//
//  Created by 蔡鈞 on 2016/2/16.
//  Copyright © 2016年 mike840609. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //寫PFObject   類別若無會(自動產生)
        /*
        var friend = PFObject(className: "Contact")
        friend["firstname"] = "Tsai"
        friend["lastname"] = "Mike"
        friend["email"] = "mike840609@gmail.com"
        
        friend.saveInBackgroundWithBlock{(successful, error) -> Void in
            if successful{
                //successful
            }
            else{
                //error
            }
        }
        */
        
        //讀取單獨物件 PFQuery
        
        /*
        let query = PFQuery(className: "Contact")
        query.getObjectInBackgroundWithId("JeqRVfLMUH") { (object, error) -> Void in
            
            if object != nil && error == nil{
                print(object!["firstname"] as! String)
            }
            else{
                
            }
        }
        */
        
        //讀取 Array
        
        /*
        let query = PFQuery(className: "Contact")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if error == nil{
                
                if let returnedObjects = objects{
                
                    //array isn't nil
                    //loop through the array to get each object
                    
                    for object in returnedObjects{
                    
                        print(object["email"] as! String)
                    }
                }
        
            }
        }

        */
        
        
        //Updating and Delete Object
        /*
        let query = PFQuery(className: "Contact")
        query.getObjectInBackgroundWithId("JeqRVfLMUH") { (object, error) -> Void in
            
            if object != nil && error == nil{
                print(object!["firstname"] as! String)
                
                //更新物件
                object!["email"] = "updata@gmail.com"
                object!.saveInBackground()
                
                //刪除物件
                //object!.deleteInBackground()
            }
            else{
                
            }
        }
        */
        
        //WhereKey EqualTo Constraint======================================
        
        let query = PFQuery(className: "Contact")
        //query.whereKey("firstname", equalTo: "Tsai")
        
        
        //WhereKey NotEqualTo Constraint===================================
        
        
        //let query = PFQuery(className: "Contact")
        //query.whereKey("firstname", notEqualTo: "Tsai")
        
        
        //WhereKey ContainedIn , NotContainIn , Constraint=================
        
        
        //let names = ["Alice" , "Bob" , "Mike"]
        //let query = PFQuery(className: "Contact")
        //query.whereKey("firstname", notContainedIn: names)
        //query.whereKey("firstname", containedIn: names)
        
        
        //WhereKey Exist , DoesNotExist Constraint========================
        
        //let query = PFQuery(className: "Contact")
        //query.whereKeyExists("email")
        //query.whereKeyDoesNotExist("email")
        
        //WhereKey HasPrefix Constraint========================
        
        //query.whereKey("firstname", hasPrefix: "Ts")
        //query.whereKey("firstname", hasSuffix: "ai")
        
        //LessThan, GreatThan constraint=======================
        //query.whereKey("firstname", greaterThan: 3)
        //query.whereKey("firstname", greaterThanOrEqualTo: 3)
        
        //SelectKeys===============================
        //可以加入限制條件 並且只取需要得值
        //query.whereKey("age", greaterThan: 30)
        //query.selectKeys(["email"])
        //query.findObjectsInBackground()
        
        
        //Limit====================================
        //限制回傳的物件(預設100)
        //query.limit = 10
        
        
        
        //OrderBy===================================
        //query.orderByAscending("firstname")
        
        
        
        //Skip=====================================
        //query.skip = 10
        
        
        
        //Get first object method==================
        //query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            
            //當第一個物件回傳時執行
            
       // }
        
        
        
        //Count objects method=====================
        //query.whereKey("firstname", greaterThan: 0)
        //query.countObjectsInBackgroundWithBlock { (number, error) -> Void in
            //回傳個數時執行
        //}
        

        
        //Compound quries (OR queries)==========================
        //聯集搜尋
        
        let prefixquery = PFQuery(className: "Contact")
        prefixquery.whereKey("firstname", hasPrefix: "T")
        
        let suffixquery = PFQuery(className: "Contact")
        suffixquery.whereKey("firstname", hasSuffix: "i")
    
    
        let orQuery = PFQuery.orQueryWithSubqueries([prefixquery,suffixquery])
        orQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            //回傳時執行
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

