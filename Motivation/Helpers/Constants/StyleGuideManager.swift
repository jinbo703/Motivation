//
//  StyleGuideManager.swift
//  Motivr
//
//  Created by John Nik on 12/27/17.
//  Copyright © 2017 jonik703. All rights reserved.
//

import UIKit

public class StyleGuideManager {
    private init(){}
    
    static let sharedInstance : StyleGuideManager = {
        let instance = StyleGuideManager()
        return instance
    }()
    
    //intro
    static let mainLightBeigeBackgroundColor = UIColor(r: 235, g: 231, b: 227)
    static let mainDarkBeigeBackgroundColor = UIColor(r: 213, g: 208, b: 203)
    static let mainMediumBeigeBackgroundColor = UIColor(r: 225, g: 219, b: 213)
    
    static let cardNumberAzureBackgroundColor = UIColor(r: 157, g: 151, b: 146)
    
    static let buttonBlueBackgroundColor = UIColor(r: 106, g: 128, b: 178)
    //Fonts
    func loginFontLarge() -> UIFont {
        return UIFont(name: "Helvetica Light", size: 30)!
        
    }
}

