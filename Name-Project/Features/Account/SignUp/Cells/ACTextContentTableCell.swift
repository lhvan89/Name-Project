//
//  ACTextContentTableCell.swift
//  Name-Project
//
//  Created by Van Le on 10/3/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

struct ACTextContentTableCellItem {
    var text: String?
}

class ACTextContentTableCell: UITableViewCell {
    
    var cellItem: ACTextContentTableCellItem? {
        didSet {
            self.setData()
        }
    }
    
    // titleLabel
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setThemeTextColor(keyPath: ThemeKeys.Label.textColor1.key)
        label.setThemeFont(keyPath: ThemeKeys.Global.RegularFont.key, fontSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initializeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Initialize UI
    func initializeUI() {
        
        self.backgroundColor = .clear
        
        self.addSubview(self.titleLabel)
        
        // Set constraint layouts
        self.titleLabel.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.left.equalTo(strongSelf).offset(16)
            maker.right.equalTo(strongSelf).offset(-16)
            maker.top.equalTo(strongSelf).offset(8)
            maker.bottom.equalTo(strongSelf).offset(-8)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = nil
    }
    
    // MARK: Set Data
    func setData() {
        self.titleLabel.text = cellItem?.text
    }
}
