//
//  CountDownViewController.swift
//  RioOlympics2016
//
//  Created by Ethan Zhai on 2017/5/17.
//  Copyright © 2017年 ZCF. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {
    
    @IBOutlet weak var CountDown: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = Date()
        let calendar = Calendar.current
        var dateComp = DateComponents()
        dateComp.day = 5
        dateComp.month = 8
        dateComp.year = 2016
        let dateD = calendar.date(from: dateComp as DateComponents)
        let interval = calendar.dateComponents([.year, .month, .day], from: dateD! , to:currentDate)
        CountDown.text = String(format:"%li年%li月%li天", interval.year!, interval.month!, interval.day!)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
