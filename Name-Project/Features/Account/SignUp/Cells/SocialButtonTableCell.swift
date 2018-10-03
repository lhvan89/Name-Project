//
//  SocialButtonTableCell.swift
//  Name-Project
//
//  Created by Van Le on 10/3/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

protocol SocialButtonTableCellDelegate: class {
    func socialButtonTabelCell(_ cell: SocialButtonTableCell, didTapButton cellItem: SocialButtonTableCellItem?)
}

struct SocialButtonTableCellItem {
    var id: Int?
    var text: String?
    var icon: UIImage?
    var bgColor: String?
}

class SocialButtonTableCell: UITableViewCell {
    
    var cellItem: SocialButtonTableCellItem? {
        didSet {
            self.setData()
        }
    }
    
    weak var delegate: SocialButtonTableCellDelegate?
    
    lazy var socialButton =  UIButton()
    lazy var iconImage =  UIImageView()
    
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
        
        // socialButotn
        socialButton.layer.cornerRadius = 25
        socialButton.layer.masksToBounds = true
        socialButton.titleLabel?.setThemeFont(keyPath: ThemeKeys.Global.RegularFont.key, fontSize: 16)
        socialButton.theme_setTitleColor(ThemeColorPicker(keyPath: ThemeKeys.Button.backgroundColor3.key), forState: .normal)
        socialButton.addTarget(self, action: #selector(self.handleButtonTapped(button:)), for: .touchUpInside)
        
        self.addSubview(self.socialButton)
        self.socialButton.addSubview(self.iconImage)
        
        // Set constraint layouts
        self.socialButton.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.top.equalTo(strongSelf).offset(8)
            maker.left.equalTo(strongSelf).offset(16)
            maker.right.equalTo(strongSelf).offset(-16)
            maker.bottom.equalTo(strongSelf).offset(-8)
            maker.height.equalTo(50)
        }
        
        self.iconImage.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.centerY.equalTo(strongSelf.socialButton)
            maker.width.height.equalTo(16)
            maker.left.equalTo(strongSelf.socialButton).offset(20)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.socialButton.setTitle(nil, for: .normal)
        self.iconImage.image = nil
    }
    
    // MARK: Set Data
    func setData() {
        self.socialButton.setTitle(cellItem?.text, for: .normal)
        self.iconImage.image = cellItem?.icon
        self.socialButton.setThemeImageWithColor(keyPath: (cellItem?.bgColor)!)
    }
    
    @objc func handleButtonTapped(button: UIButton) {
        self.delegate?.socialButtonTabelCell(self, didTapButton: self.cellItem)
    }
}
