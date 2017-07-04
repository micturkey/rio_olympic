//
//  ScheduleDetailViewController.swift
//  RioOlympics2016
//
//  Created by Ethan Zhai on 2017/7/4.
//  Copyright © 2017年 ZCF. All rights reserved.
//
import UIKit

class ScheduleDetailViewController: UIViewController {
    
    var schedule: Schedule!
    var imgEventIcon: UIImageView!
    var lblInfo: UILabel!
    var lblEventName: UILabel!
    var lblDate: UILabel!
    var lblTime: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = UIColor.white
        
        /// 1.添加ImageView
        self.imgEventIcon = UIImageView(frame: CGRect(x: 10, y: 80, width: 102, height: 102))
        self.imgEventIcon.image = UIImage(named : self.schedule.Event!.EventIcon!)
        self.view.addSubview(self.imgEventIcon)
      

        self.lblEventName = UILabel(frame: CGRect(x: 140, y: 120, width: 160, height: 60))
        self.lblEventName.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.lblEventName.numberOfLines = 0
        self.lblEventName.text = self.schedule.Event!.EventName
        self.lblEventName.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(self.lblEventName)
        
        self.lblInfo = UILabel(frame: CGRect(x: 10, y: self.imgEventIcon.frame.origin.y + 90, width: 350, height: 90))
        self.lblInfo.text = "Type: \(self.schedule.GameInfo!)"
        self.view.addSubview(self.lblInfo)
        
        self.lblDate = UILabel(frame: CGRect(x: 10, y: self.imgEventIcon.frame.origin.y + 120, width: 200, height: 90))
        self.lblDate.text = "Date: \(self.schedule.GameDate!)"
        self.view.addSubview(self.lblDate)
        
        self.lblTime = UILabel(frame: CGRect(x: 10, y: self.imgEventIcon.frame.origin.y + 150, width: 200, height: 90))
        self.lblTime.text = "Date: \(self.schedule.GameTime!)"
        self.view.addSubview(self.lblTime)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

