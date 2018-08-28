//
//  AppConstant.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 19/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation
import UIKit

struct TDS {
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    
}


struct ScreenSize {
    
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(TDS.SCREEN_WIDTH, TDS.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(TDS.SCREEN_WIDTH,    TDS.SCREEN_HEIGHT)
    
}

struct Device {
    
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_5_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH <= 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH   == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH   == 1366.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    
}

struct model {
    
    //IPHONE 4S
    static let IPHONE4S_WIDTH = 320.0
    static let IPHONE4S_HEIGHT = 480.0
    
    //IPHONE 5 & 5S & SE
    static let IPHONE5S_WIDTH = 320.0
    static let IPHONE5S_HEIGHT = 568.0
    
    //IPHONE 6 & 6S & 7
    static let IPHONE6S_WIDTH = 375.0
    static let IPHONE6S_HEIGHT = 667.0
    
    //IPHONE 6 PLUS & 7 PLUS & 8 PLUS
    static let IPHONE6PLUS_WIDTH = 375.0
    static let IPHONE6PLUS_HEIGHT = 667.0
    
    //IPHONE - X
    static let IPHONEX_WIDTH = 375.0
    static let IPHONEX_HEIGHT = 812.0
    
}

func RSIZE(H:CGFloat) -> CGFloat {
    
    var resize =  CGFloat()
    
    resize = (H/736) * TDS.SCREEN_HEIGHT
    
    return resize
    
}

func RSIZE(W:CGFloat) -> CGFloat {
    
    var resize =  CGFloat()
    
    resize = (W/414) * TDS.SCREEN_WIDTH
    
    return resize
    
}
