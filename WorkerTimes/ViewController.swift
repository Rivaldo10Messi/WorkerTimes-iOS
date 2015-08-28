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
    
    // ビューのロード完了時に呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        // json取得->tableに突っ込む
        println("makeTA")
        //makeTableData()
        
        //requestAlamofire()
    }
    
    /*
    // json取得->tableに突っ込む
    func makeTableData() {
        self.isInLoad = true
        var url = NSURL(string: self.urlString)!
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {data, response, error in
            // リソースの取得が終わると、ここに書いた処理が実行される
            var json = JSON(data: data)
            
            println(json["list"])
            // 各セルに情報を突っ込む
            //適当なJSONファイルが持っている値
            for var i = 0; i < self.cellNum; i++ {
                var hId = json["list"][i]["humanId"]
                var aoutName = json["list"][i]["aouther"]
                var tId = json["list"][i]["titleId"]
                var titleName = json["list"][i]["title"]
                var info = "\(hId), \(aoutName), \(tId), \(titleName)"
                self.cellItems[i] = info
                println(hId)
            }
            // ロードが完了したので、falseに
            self.isInLoad = false
        })
        task.resume()
        
        while isInLoad {
            usleep(10)
        }
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sectionNum
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return titleName.count
        return self.cellNum
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("list", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = self.cellItems[indexPath.row] as? String
        return cell
    }
    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detail", sender: nil)
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
    */
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

