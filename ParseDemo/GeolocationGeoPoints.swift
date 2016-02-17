//
//  GeolocationGeoPoints.swift
//  ParseDemo
//
//  Created by 蔡鈞 on 2016/2/17.
//  Copyright © 2016年 mike840609. All rights reserved.
//

import UIKit

class GeolocationGeoPoints: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set location
        /*
        let contact = PFObject(className: "Contact")
        contact["firstname"] = "Chris"
        contact["lastname"] = "Ching"
        contact["email"] = "asd@gmail.com"
        
        // TODO: Get the users current location
        contact["location"] = PFGeoPoint(latitude: 29, longitude: 38)
        contact.saveInBackground()
        */
        
        // Query contacts based on location 
        let query = PFQuery(className: "Contact")
        query.whereKey("location", nearGeoPoint: PFGeoPoint(latitude: 12, longitude: 23))
        query.findObjectsInBackgroundWithBlock { (object, error) -> Void in
            if error == nil{
                if let contact = object{
                    print(contact)
                }
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    

}
