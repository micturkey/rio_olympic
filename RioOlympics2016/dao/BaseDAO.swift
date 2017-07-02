//
//  BaseDAO.swift
//  RioOlympics2016
//
//  Created by Ethan Zhai on 2017/5/23.
//  Copyright © 2017年 ZCF. All rights reserved.
//

import Foundation

public class BaseDAO:NSObject {
    internal var db:OpaquePointer? = nil
    
    override init() {
        //初始化数据库
        DBHelper.initDB()
    }
    
    internal func openDB()->Bool{
        let dbFilePath = DBHelper. applicationDocumentsDirectoryFile(DB_FILE_NAME)!
        print("DbFilePath = \(String(cString:dbFilePath))")
        
    }
}
