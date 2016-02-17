//
//  SavingImageSoundFile.swift
//  ParseDemo
//
//  Created by 蔡鈞 on 2016/2/16.
//  Copyright © 2016年 mike840609. All rights reserved.
//

import UIKit

class SavingImageSoundFile: UIViewController {
    
    @IBOutlet var  ViewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Save  Image =============================================================
        
        /*
        let query = PFQuery(className: "Contact")
        //query.whereKey("lastname", equalTo: "Joy")
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            if error == nil{
                if let contact = object{
                    
                    //返回值為UIImage? Get data
                    let image = UIImage(named: "cafelore")
                    
                    if let cafeimage = image{
                        
                        //Get data
                        let imagedata:NSData? = UIImagePNGRepresentation(cafeimage)
                        
                        //設定Parse中的名稱以及資料型態
                        let file = PFFile(name: "cafe.png", data: imagedata!)
                        contact["profilephoto"] = file
                        
                        //Save the object back to the Parse backend
                        contact.saveInBackgroundWithBlock({ (result, error) -> Void in
                            print("done")
                        })
                    }
                }
            }
        }
        */
        
        //Retrieve  Image =============================================================
        let query = PFQuery(className: "Contact")
        query.whereKey("firstname", equalTo: "Mike")
        
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            if error == nil {
                if let contact = object{
                    
                    //here we have a contact named Mike
                    let file = contact["profilephoto"] as! PFFile
                    file.getDataInBackgroundWithBlock({ (data, error) -> Void in
                        
                        if error == nil{
                            if let imagedata = data{
                                
                                let image = UIImage(data: imagedata)
                                self.ViewImage.image = UIImage(data: imagedata)!
                                
                            }
                        
                        }
                        
                    })
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
