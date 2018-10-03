//
//  ACTextFieldTableCell.swift
//  Name-Project
//
//  Created by Van Le on 10/3/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

protocol ACTextFieldTableCellDelegate: class {
    func acTextFieldTableCell(_ cell: ACTextFieldTableCell, didEditing cellItem: ACTextFieldTableCellItem?)
    func acTextFieldTableCell(_ cell: ACTextFieldTableCell, didTapTexField cellItem: ACTextFieldTableCellItem?)
}

struct ACTextFieldTableCellItem {
    var id: Int?
    var text: String?
    var placeholder: String?
    var infoMessage: String?
    var errorMessage: String?
    var isSecurity: Bool?
    var isLocation: Bool?
    var isEmail: Bool?
    
    init(id: Int?, text: String?, placeholder: String?) {
        self.id = id
        self.text = text
        self.placeholder = placeholder
    }
    
    init(id: Int?, text: String?, placeholder: String?, infoMessage: String? = nil, errorMessage: String? = nil, isSecurity: Bool? = nil, isLocation: Bool? = nil, isEmail: Bool? = nil) {
        self.id = id
        self.text = text
        self.placeholder = placeholder
        self.infoMessage = infoMessage
        self.errorMessage = errorMessage
        self.isLocation = isLocation
        self.isSecurity = isSecurity
        self.isEmail = isEmail
    }
}

class ACTextFieldTableCell: UITableViewCell, BaseTableCellProtocol {
    
    lazy var textField = UITextField()
    lazy var infoLabel = UILabel()
    lazy var errorLabel = UILabel()
    lazy var responseView = UIView()
    lazy var arrowImage = UIImageView()
    
    var cellItem: ACTextFieldTableCellItem? {
        didSet {
            self.setData()
        }
    }
    
    weak var delegate: ACTextFieldTableCellDelegate?
    
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
        
        // textField
        textField.setThemeBackgroundColor(keyPath: ThemeKeys.TextField.backgroundColor.key)
        textField.setThemeTextColor(keyPath: ThemeKeys.TextField.textColor.key)
        textField.addTarget(self, action: #selector(handleTextFieldChanged(_:)), for: .editingChanged)
        textField.setLeftPaddingPoints(14)
        textField.setRightPaddingPoints(32)
        textField.layer.cornerRadius = 5
        textField.autocapitalizationType = .none
        textField.delegate = self
        
        self.addSubview(self.textField)
        
        // infoLabel
        infoLabel.setThemeFont(keyPath: ThemeKeys.Global.RegularFont.key, fontSize: 13)
        infoLabel.setThemeTextColor(keyPath: ThemeKeys.Label.textColor2.key, alpha: 0.5)
        infoLabel.numberOfLines = 0
        self.addSubview(self.infoLabel)
        
        // errorLabel
        errorLabel.setThemeFont(keyPath: ThemeKeys.Global.RegularFont.key, fontSize: 13)
        errorLabel.setThemeTextColor(keyPath: ThemeKeys.Label.textColor5.key)
        errorLabel.numberOfLines = 0
        self.addSubview(self.errorLabel)
        
        // responseView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleResponseTapped(_ :)))
        self.responseView.addGestureRecognizer(tapGesture)
        self.addSubview(self.responseView)
        
        // arrowImage
        arrowImage.image = #imageLiteral(resourceName: "ic_down_arrow_30")
        arrowImage.isUserInteractionEnabled = true
        arrowImage.contentMode = .scaleAspectFit
        arrowImage.alpha = 0.5
        self.responseView.addSubview(self.arrowImage)
        
        // Set constraint layouts
        self.textField.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.top.equalTo(strongSelf).offset(8)
            maker.left.equalTo(strongSelf).offset(16)
            maker.right.equalTo(strongSelf).offset(-16)
            maker.height.equalTo(45)
        }
        
        self.responseView.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.edges.equalTo(strongSelf.textField)
        }
        
        self.infoLabel.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.top.equalTo(strongSelf.textField.snp.bottom).offset(4)
            maker.bottom.equalTo(strongSelf).offset(-8)
            maker.left.equalTo(strongSelf).offset(33)
            maker.right.equalTo(strongSelf).offset(-33)
        }
        
        self.errorLabel.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.top.equalTo(strongSelf.textField.snp.bottom).offset(4)
            maker.bottom.equalTo(strongSelf).offset(-8)
            maker.left.equalTo(strongSelf).offset(33)
            maker.right.equalTo(strongSelf).offset(-33)
        }
        
        self.arrowImage.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.right.equalTo(strongSelf.responseView).offset(-10)
            maker.centerY.equalTo(strongSelf.responseView)
            maker.width.height.equalTo(18)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textField.text = nil
        self.textField.placeholder = nil
        self.infoLabel.text = nil
        self.errorLabel.text = nil
        self.errorLabel.isHidden = true
        self.infoLabel.isHidden = true
    }
    
    // MARK: Set Data
    func setData() {
        
        self.textField.text = self.cellItem?.text
        
        if self.cellItem?.infoMessage != nil {
            self.infoLabel.isHidden = false
            self.infoLabel.text = self.cellItem?.infoMessage
        }
        
        if self.cellItem?.errorMessage != nil {
            self.errorLabel.isHidden = false
            self.errorLabel.text = self.cellItem?.errorMessage
        }
        
        self.textField.isSecureTextEntry = self.cellItem?.isSecurity ?? false
        
        if self.cellItem?.isEmail != nil {
            self.textField.keyboardType = .emailAddress
        } else {
            self.textField.keyboardType = .default
        }
        
        if let placeholder = self.cellItem?.placeholder {
            self.textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.5)])
        }
        
        if self.cellItem?.errorMessage != nil && self.cellItem?.isSecurity == nil {
            self.textField.setThemeTextColor(keyPath: ThemeKeys.TextField.textColor2.key)
        } else {
            self.textField.setThemeTextColor(keyPath: ThemeKeys.TextField.textColor.key)
        }
        
        if self.cellItem?.isLocation ?? false {
            self.responseView.isHidden = false
            self.textField.isUserInteractionEnabled = false
            
        } else {
            self.responseView.isHidden = true
            self.textField.isUserInteractionEnabled = true
            
        }
    }
    
    // MARK: Action
    @objc func handleResponseTapped(_ gestureRegconize: UITapGestureRecognizer) {
        self.delegate?.acTextFieldTableCell(self, didTapTexField: cellItem)
    }
    
    @objc func handleTextFieldChanged(_ textField: UITextField) {
        var cellItem = self.cellItem
        cellItem?.text = textField.text
        self.delegate?.acTextFieldTableCell(self, didEditing: cellItem)
    }
}

extension ACTextFieldTableCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == " " {
            return false
        }
        
        return true
    }
}
