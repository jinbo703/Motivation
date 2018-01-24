//
//  CardCoverAlarmCell.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class CardCoverCell: BaseTableViewCell {
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Change Cover"
        return label
        
    }()
    
    override func setupViews() {
        super.setupViews()
        
        accessoryType = .disclosureIndicator
        
        addSubview(titleLabel)
        _ = titleLabel.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 40)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
