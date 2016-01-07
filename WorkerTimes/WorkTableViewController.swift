//
//  TableViewController.swift
//  WorkerTimes
//
//  Created by Shuhei Hasegawa on 2015/08/27.
//  Copyright (c) 2015年 Shuhei Hasegawa. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation

class WorkTableViewController: UITableViewController {
    
    // セクションの数
    let sectionNum = 1
    // 1セクションあたりのセルの行数
    var cellNum = 10
    // 取得するAPI
    //let urlString = "http://api.openweathermap.org/data/2.5/forecast?units=metric&q=Tokyo"
    let urlString = "http://54.64.215.185:3000/"
    
    // セルの中身
    var cellItems = NSMutableArray()
    // ロード中かどうか
    var isInLoad = false
    // 選択されたセルの列番号
    var selectedRow: Int?
    var index = 0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をGreenに設定する.
        self.view.backgroundColor = UIColor.greenColor()
        
        // tabBarItemのアイコンをFeaturedに、タグを2と定義する.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 2)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    // ビューのロード完了時に呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        // json取得->tableに突っ込む
        makeTableData()
        // プルダウンでリロード機能
        addRefreshControl()
        
        // スワイプ認識.
        //let pageSwipe = UISwipeGestureRecognizer(target: self, action: "swipeGesture:")
        //pageSwipe.direction = UISwipeGestureRecognizerDirection.Right
        //self.view.addGestureRecognizer(pageSwipe)
    }
    
    
    // プルダウンでリロード機能を付加
    func addRefreshControl() {
        var refresh = UIRefreshControl()
        // ロード時に表示される文字を設定
        refresh.attributedTitle = NSAttributedString(string: "Loading...")
        // プルダウン時に呼び出されるメソッドを設定
        refresh.addTarget(self, action: "pullToRefresh", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refresh
    }
    
    
    // リロード時の処理
    func pullToRefresh() {
        // デバッグ用に、本当にリロードされたか確認したいので、
        // リロードのたびに行数を変更してます。
        self.cellNum = Int(arc4random() % 10) + 1
        // tableに突っ込む用のデータを作成
        makeTableData()
        // 再度tableに情報を突っ込む
        self.tableView.reloadData()
        self.index++
        println("refresh: \(self.index)")
    }
    
    
    // json取得->tableに突っ込む
    func makeTableData() {
        println("makeTA")
        self.isInLoad = true
        var url = NSURL(string: self.urlString)!
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {data, response, error in
            // リソースの取得が終わると、ここに書いた処理が実行される
            var json = JSON(data: data)
            
            // 各セルに情報を突っ込む
            for var i = 0; i < self.cellNum; i++ {
                var dt_txt = json[i]["name"]
                var weatherMain = json[i]["in"]
                var weatherDescription = json[i]["out"]
                
                var info = "\(dt_txt), \(weatherMain), \(weatherDescription)"
                self.cellItems[i] = info
            }
            // ロードが完了したので、falseに
            self.isInLoad = false
        })
        task.resume()
        
        // 読み込みが終わるまで待機
        // (ゆる募)
        // 下の解決策以外に何か方法があればと。。。
        // jsonの取得に非同期通信を使ってるので、読み込むまで待ってからじゃないと
        // cellに値が入らない。同期通信使えって話もあるけど今後の拡張を考えてNSURLSession使ってます(^_^;)
        while isInLoad {
            usleep(10)
            index++
            //    println("load\(index)")
        }
        // ロードが終わったことを通知
        refreshControl?.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    // 戻り値を変更
    // セクションの数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return self.sectionNum
    }
    
    // 戻り値を変更
    // 1セクションあたりのセルの行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.cellNum
    }
    
    // セルの中身を設定
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        // セルの中身を設定
        cell.textLabel?.text = self.cellItems[indexPath.row] as? String
        return cell
    }
    
    // 継承時は書かれてないので、メソッドを追加
    // Segue選択時の挙動
    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 選択されたセルの行数を記録
        self.selectedRow = indexPath.row
        performSegueWithIdentifier("toCellViewController", sender: nil)
    }
    
    // CellViewControllerにセルの値を渡す
    // segueで画面遷移するときに呼び出される
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "toCellViewController" {
            // 遷移先のViewContollerにセルの情報を渡す
            let cellVC : CellViewController = segue.destinationViewController as! CellViewController
            cellVC.info = cellItems[self.selectedRow!] as? String
        }
    }
    
}