//
//  ViewController.swift
//  WorkerTimes
//
//  Created by Shuhei Hasegawa on 2015/08/27.
//  Copyright (c) 2015年 Shuhei Hasegawa. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        requestAlamofire()
    }
    
    // AlamofireでGET REQUESTを送信し、JSONデータを加工する
    func requestAlamofire() {
        Alamofire.request(.GET, "http://weather.livedoor.com/forecast/webservice/json/v1", parameters: ["city": 200010])
            .responseJSON { (request, response, json, error) in
                if (response?.statusCode == 200) {
                    println("success")
                    var swiftJson = JSON(json!)
                    self.outputLocation(swiftJson)
                    
                } else {
                    // error
                    println(error)
                }
        }
        
    }
    
    // Locationデータを出力します
    func outputLocation(json : JSON) {
        if let location: Dictionary = json["location"].dictionary {
            println("dictionary data")
            println(location)
        } else {
            println("dictionary data")
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

