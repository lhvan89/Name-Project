//
//  ACButtonTableCell.swift
//  Name-Project
//
//  Created by Van Le on 10/3/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

protocol ACButtonTableCellDelegate: class {
    func acButtonTabelCell(_ cell: ACButtonTableCell, didTapButton cellItem: ACButtonTableCellItem?)
}

struct ACButtonTableCellItem {
    var id: Int?
    var titleKey: LocalizeKey?
}

class ACButtonTableCell: UITableViewCell, BaseTableCellProtocol {
    
    lazy var button = UIButton()
    
    var cellItem: ACButtonTableCellItem? {
        didSet {
            self.setData()
        }
    }
    
    weak var delegate: ACButtonTableCellDelegate?
    
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
        
        // button
        self.button.setThemeImageWithColor(keyPath: ThemeKeys.Button.backgroundColor4.key, alpha: AlphaColor.active, forState: .normal)
        self.button.addTarget(self, action: #selector(self.handleButtonTapped(button:)), for: .touchUpInside)
        self.button.layer.cornerRadius = 45/2
        self.button.clipsToBounds = true
        self.addSubview(self.button)
        
        // Set constraint layouts
        self.button.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.top.equalTo(strongSelf).offset(8)
            maker.bottom.equalTo(strongSelf).offset(-8)
            maker.width.equalTo(170)
            maker.height.equalTo(45)
            maker.centerX.equalTo(strongSelf)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.button.setImage(nil, for: .normal)
        self.button.setTitle(nil, for: .normal)
    }
    
    // MARK: Set Data
    func setData() {
        
        if let titleKey = self.cellItem?.titleKey {
            self.button.localize_setTitle(titleKey, forState: .normal)
        }
    }
    
    @objc func handleButtonTapped(button: UIButton) {
        self.delegate?.acButtonTabelCell(self, didTapButton: self.cellItem)
    }
}
