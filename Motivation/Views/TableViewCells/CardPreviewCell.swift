//
//  CardPreviewCell.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class CardPreviewCell: BaseTableViewCell {
    
    let containerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    let bandImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let cardBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = StyleGuideManager.mainDarkBeigeBackgroundColor
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = StyleGuideManager.mainMediumBeigeBackgroundColor
        
        addSubview(containerView)
        _ = containerView.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 300)
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(cardBackgroundView)
        _ = cardBackgroundView.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        cardBackgroundView.addSubview(bandImageView)
        _ = bandImageView.anchor(nil, left: cardBackgroundView.leftAnchor, bottom: nil, right: cardBackgroundView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        bandImageView.centerYAnchor.constraint(equalTo: cardBackgroundView.centerYAnchor).isActive = true
        
        let degrees: CGFloat = 1
        cardBackgroundView.transform = CGAffineTransform(rotationAngle: degrees * CGFloat.pi / 180)
        
        
    }
    
}
