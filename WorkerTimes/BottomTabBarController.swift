//
//  BottomTabBarController.swift
//  WorkerTimes
//
//  Created by Shuhei Hasegawa on 2015/08/31.
//  Copyright (c) 2015年 Shuhei Hasegawa. All rights reserved.
//

import UIKit

//UITabBarControllerを継承
class BottomTabBarController: UITabBarController {
    var firstView: PunchViewController?
    var secondView: WorkTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
/*
        firstView = PunchViewController()
        secondView = WorkTableViewController()
        
        //表示するtabItemを指定（今回はデフォルトのItemを使用）
        firstView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 1)
        secondView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 2)
        
        // タブで表示するViewControllerを配列に格納します。
        let myTabs = NSArray(objects: firstView!, secondView!)
        
        // 配列をTabにセットします。
        self.setViewControllers(myTabs as [AnyObject], animated: false)
*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}