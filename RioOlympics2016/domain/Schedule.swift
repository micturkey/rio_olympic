//
//  Schedule.swift
//  RioOlympics2016
//
//  Created by Ethan Zhai on 2017/7/4.
//  Copyright © 2017年 ZCF. All rights reserved.
//

import Foundation
// 比赛日程表 实体类
public class Schedule {
    //编号
    public var ScheduleID: Int?
    //比赛日期
    public var GameDate: String?
    //比赛时间
    public var GameTime: String?
    //比赛描述
    public var GameInfo: String?
    //比赛项目
    public var Event: Events?
    
}
