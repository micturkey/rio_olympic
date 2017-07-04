//
//  EventsViewCell.swift
//  RioOlympics2016
//
//  Created by Ethan Zhai on 2017/7/4.
//  Copyright © 2017年 ZCF. All rights reserved.
//

import UIKit

class EventsViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //单元格的宽度
        let cellWidth: CGFloat = self.frame.size.width
        
        /// 1.添加ImageView
        let imageViewWidth: CGFloat = 100
        let imageViewHeight: CGFloat = 100
        let imageViewTopView: CGFloat = 0
        
        self.imageView = UIImageView(frame: CGRect(x: (cellWidth - imageViewWidth) / 2, y: imageViewTopView, width: imageViewWidth, height: imageViewHeight))
        
        self.addSubview(self.imageView)
        
        
        self.label = UILabel(frame: CGRect(x: 54, y: 54, width: 102, height: 102))



        
        self.addSubview(self.label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
