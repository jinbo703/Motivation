//
//  CardPhotoCell.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class CardPhotoCell: UITableViewCell {
    
    let photoImageView: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
        
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        
        detailTextLabel?.textColor = .gray
        
        addSubview(photoImageView)
        
        _ = photoImageView.anchor(nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 55, heightConstant: 55)
        photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 90, y: textLabel!.frame.origin.y + 2, width: textLabel!.frame.width, height: (textLabel?.frame.height)!)
        
        detailTextLabel?.frame = CGRect(x: 90, y: detailTextLabel!.frame.origin.y - 2, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
