//
//  CardCoverColorCell.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class CardCoverColorCell: BaseTableViewCell {
    
    let colorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
        
    }()
    
    let colorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Red"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        accessoryType = .disclosureIndicator
        
        addSubview(colorView)
        _ = colorView.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        colorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(colorNameLabel)
        _ = colorNameLabel.anchor(nil, left: colorView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 30)
        colorNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}
