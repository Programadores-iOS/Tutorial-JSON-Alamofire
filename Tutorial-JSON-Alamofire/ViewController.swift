//
//  ViewController.swift
//  Tutorial-JSON-Alamofire
//
//  Created by Fernando Medina on 1/14/15.
//  Copyright (c) 2015 Programadores-iOS.net. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var ipAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFecha()
        getIP()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func getFecha()
    {
        Alamofire.request(.GET, "http://date.jsontest.com").responseJSON() {
            (_, _, JSON, error) in
            if error == nil {
                let info =  JSON as NSDictionary
                
                self.fecha.text = info["date"] as? String
            } else {
                
                println(error)
            }
        }

    }
    
    func getIP()
    {
        Alamofire.request(.GET, "http://ip.jsontest.com").responseJSON() {
            (_, _, JSON, error) in
            if error == nil {
                let info =  JSON as NSDictionary
                self.ipAddress.text = info["ip"] as? String
            } else {
                
                println(error)
            }
        }
        
    }


}

