//
//  NewsModel.swift
//  WYNews
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit

class NewsModel: NSObject {

    //4.0 要加上@objc
    @objc var title : String   = ""
    @objc var imgsrc : String  = ""
    @objc var replyCount : Int = 0
    @objc var source : String  = ""
    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
}
