//
//  NewsViewCell.swift
//  WYNews
//
//  Created by Pisces on 2017/12/11.
//  Copyright © 2017年 Pisces. All rights reserved.
//

import UIKit
import Kingfisher
class NewsViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var title_Label: UILabel!
    
    @IBOutlet weak var followCount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        followCount.layer.masksToBounds = true
        followCount.layer.cornerRadius = 5;
        followCount.backgroundColor = UIColor.darkGray
        followCount.textColor = UIColor.white
        
    }

    //MARK: - setupData
    var model : NewsModel? {
        didSet {
            let url = URL.init(string: model?.imgsrc ?? "")
            iconImage.kf.setImage(with: url)
            title_Label.text = model?.title
            sourceLabel.text = model?.source
            followCount.text = "\(model?.replyCount ?? 0)Follow"
        }
    }
    
}
