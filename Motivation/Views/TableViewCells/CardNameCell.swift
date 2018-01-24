//
//  CardNameCell.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class CardNameCell: BaseTableViewCell {
    
    let cardNameTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Type Name Here"
        return textField
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(cardNameTextField)
        
        _ = cardNameTextField.anchor(nil, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        cardNameTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
