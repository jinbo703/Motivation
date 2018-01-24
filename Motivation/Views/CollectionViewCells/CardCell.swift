//
//  CardCell.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

class CardCell: BaseCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = StyleGuideManager.mainDarkBeigeBackgroundColor
        return view
    }()
    
    let cardImageView: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
    }()
    
    let bandImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let cardNumbersLabel: UILabel = {
        let label = UILabel()
        label.text = "25"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = StyleGuideManager.cardNumberAzureBackgroundColor
        label.font = UIFont.systemFont(ofSize: 12)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    
    let cardNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Facts i want to remember"
        label.textAlignment = .center
        
        label.numberOfLines = 2
        return label
    }()
    
    override func setupViews() {
        
        backgroundColor = .clear
        
        setupCardNameLabel()
        setupContainerViews()
    }
    
}

extension CardCell {
    
    fileprivate func setupCardNameLabel() {
        
        addSubview(cardNameLabel)
        
        _ = cardNameLabel.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 10, rightConstant: 15, widthConstant: 0, heightConstant: 45)
        
    }
    
    fileprivate func setupContainerViews() {
        
        addSubview(containerView)
        _ = containerView.anchor(topAnchor, left: cardNameLabel.leftAnchor, bottom: cardNameLabel.topAnchor, right: cardNameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        addSubview(cardImageView)
        _ = cardImageView.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        addSubview(bandImageView)
        _ = bandImageView.anchor(nil, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        bandImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        addSubview(cardNumbersLabel)
        _ = cardNumbersLabel.anchor(nil, left: nil, bottom: containerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 15, rightConstant: 0, widthConstant: 30, heightConstant: 18)
        cardNumbersLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        
    }
    
}
