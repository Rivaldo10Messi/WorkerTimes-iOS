//
//  CellViewController.swift
//  WorkerTimes
//
//  Created by Shuhei Hasegawa on 2015/08/27.
//  Copyright (c) 2015年 Shuhei Hasegawa. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {

    // 画面遷移時に渡される天気情報
    var info : String?
    
    // Label
    @IBOutlet weak var myLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 天気情報を突っ込む
        myLabel?.textColor = UIColor.whiteColor()
        myLabel?.text = info!
        
        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.blueColor()
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