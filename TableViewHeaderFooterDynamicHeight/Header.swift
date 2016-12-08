//
//  Header.swift
//  TableViewHeaderFooterDynamicHeight
//
//  Created by 张尉 on 2016/12/8.
//  Copyright © 2016年 wayne. All rights reserved.
//

import UIKit

class Header: UITableViewHeaderFooterView {

    var titleLabel: UILabel = UILabel.init()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        titleLabel.textColor = UIColor.darkGray
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.text = "titleLabel"
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[titleLabel]|", options: .directionLeadingToTrailing, metrics: nil, views: ["titleLabel": titleLabel]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel]|", options: .directionLeadingToTrailing, metrics: nil, views: ["titleLabel": titleLabel]))
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutIfNeeded()
        titleLabel.preferredMaxLayoutWidth = titleLabel.frame.width
        super.layoutSubviews()
    }
}
