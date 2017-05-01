//
//  DateTableViewCell.swift
//  ThisWeekInCSOM
//
//  Created by Angela Zhang on 7/28/2013.
//  Copyright © 2017 Angela Zhang. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    let title = UILabel()
    let date = UILabel()
    override func layoutSubviews() {
        title.frame = CGRect(x: 15, y: 0, width: 3 * (self.frame.width) / 4, height: self.frame.height)
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(self.title)
        date.frame = CGRect(x: 3 * (self.frame.width) / 4 + 15, y: 0, width: self.frame.width / 4 - 30 , height: self.frame.height)
        date.textAlignment = .right
        date.font = UIFont.systemFont(ofSize: 18)
        date.textColor = UIColor.gray
        self.addSubview(self.date)
        
    }
}
