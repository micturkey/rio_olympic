//
//  ScheduleViewController.swift
//  RioOlympics2016
//
//  Created by Ethan Zhai on 2017/5/23.
//  Copyright © 2017年 ZCF. All rights reserved.
//

import UIKit


class ScheduleViewController: UITableViewController {
    
    //表视图使用的数据
    var data: [String : [Schedule]]!
    //比赛日期列表
    var arrayGameDateList: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  self.data == nil || self.data.count == 0 {
            self.data = self.readData()
            let keys  = self.data.keys
            //对key进行排序
            self.arrayGameDateList = keys.sorted(by: <)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //查询所有数据方法
    public func readData() -> [String : [Schedule]] {
        
        let scheduleDAO = ScheduleDAO.sharedInstance
        let schedules  = scheduleDAO.findAll()
        var resDict = [String : [Schedule]]()
        
        let eventsDAO = EventsDAO.sharedInstance
        
        //延迟加载Events数据
        for schedule in schedules {
            
            let event = eventsDAO.findById(schedule.Event!)
            schedule.Event = event
            
            let allkey = resDict.keys
            
            //把数组（[Schedule]）结构转化为字典（[String : [Schedule]]）结构
            if allkey.contains(schedule.GameDate!) {
                var value = resDict[schedule.GameDate!]
                value?.append(schedule)
                resDict[schedule.GameDate!] = value
            } else {
                var value = [Schedule]()
                value.append(schedule)
                resDict[schedule.GameDate!] = value
            }
        }
        return resDict
    }
    
    
    // MARK: --表视图数据源
    override func numberOfSections(in tableView: UITableView) -> Int {
        let keys = self.data.keys
        return keys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //比赛日期
        let strGameDate = self.arrayGameDateList[section]
        //比赛日期下的比赛日程表
        let schedules = self.data[strGameDate]!
        return schedules.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //比赛日期
        let strGameDate = self.arrayGameDateList[section]
        return strGameDate
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        
        let detailViewController = ScheduleDetailViewController()
      
        //比赛日期
        let strGameDate = self.arrayGameDateList[indexPath.section]
        //比赛日期下的比赛日程表
        let schedules = self.data[strGameDate]!
        let schedule = schedules[indexPath.row]
        detailViewController.schedule = schedule
        self.navigationController?.pushViewController(detailViewController, animated: true)

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        //比赛日期
        let strGameDate = self.arrayGameDateList[indexPath.section]
        //比赛日期下的比赛日程表
        let schedules = self.data[strGameDate]!
        let schedule = schedules[indexPath.row]
        var info = schedule.GameInfo!
        switch info {
            case "Men's":info = "🚹"
            case "Women's":info = "🚺"
            case "Men's & Women's": info = "🚹🚺"
            case "Men's & Women's & Mixed":info = "🚹🚺🚻"
            case "Individual & Team":info = "👤👥"
            default: break;
        }
            
        let subtitle = String(format: "%@ | %@", info, schedule.Event!.EventName!)
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.text = schedule.GameTime
        cell.detailTextLabel?.text = subtitle
        
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [String]()
        // 2016-08-09 -> 08-09
        for item in self.arrayGameDateList {
            let title = (item as NSString).substring(from: 5)
            listTitles.append(title)
        }
        return listTitles
    }


    
    
}
