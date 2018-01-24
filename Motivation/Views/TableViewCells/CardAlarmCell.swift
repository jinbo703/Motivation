//
//  CardAlarmCell.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class CardAlarmCell: CardCoverCell {
    
    let timeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "8:00"
        label.textAlignment = .right
        return label
        
    }()
    
    override func setupViews() {
        super.setupViews()
        
        titleLabel.text = "Reminder"
        
        addSubview(timeLabel)
        _ = timeLabel.anchor(nil, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 50, widthConstant: 50, heightConstant: 30)
        timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
