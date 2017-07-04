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
        var text1 = String(format:"%li年", interval.year!)
        var text2 = String(format:"%li月", interval.month!)
        var text3 = String(format:"%li天", interval.day!)
        if interval.year! == 0{
            text1 = ""
        }
        if interval.month! == 0{
            text2 = ""
        }
        if interval.day! == 0{
            text3 = ""
        }
        print(text2)
        CountDown.text = String(format:"%@%@%@", text1, text2, text3)


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
