//
//  SignUpViewController.swift
//  Name-Project
//
//  Created by Van Le on 10/2/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, HasTableView {
    
    var viewModel = SignUpViewModel()
    
    // tableView
    internal var tableView: UITableView! = {
        let tableView = UITableView()
        tableView.register(SocialButtonTableCell.self, forCellReuseIdentifier: SocialButtonTableCell.identify)
        tableView.register(ACTextContentTableCell.self, forCellReuseIdentifier: ACTextContentTableCell.identify)
        tableView.register(ACTextFieldTableCell.self, forCellReuseIdentifier: ACTextFieldTableCell.identify)
        tableView.register(ACButtonTableCell.self, forCellReuseIdentifier: ACButtonTableCell.identify)
        tableView.register(ACAgreementTableCell.self, forCellReuseIdentifier: ACAgreementTableCell.identify)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "spaceCell")
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeUI()
        
        viewModel.generateCellItems()
        tableView.reloadData()
    }
    
    // MARK: Initialize UI
    func initializeUI() {
        
        self.title = LocalizeStrings.Account.signupString
        self.view.setThemeBackgroundColor(keyPath: ThemeKeys.View.backgroundColor.key)
        
        tableConfigureDefaultProperties()
        tableView.setThemeBackgroundColor(keyPath: ThemeKeys.View.backgroundColor.key,
                                          alpha: 0.05)
        tableView.allowsSelection = true
        
        // Set constraint layouts
        self.tableView.snp.makeConstraints { [weak self] (maker) in
            guard let strongSelf = self else { return }
            maker.edges.equalTo(strongSelf.view)
        }
    }
}

extension SignUpViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let height = viewModel.cellItems[indexPath.row] as? CGFloat {
            return height
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension SignUpViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cellItem = self.viewModel.cellItems[indexPath.row] as? SocialButtonTableCellItem {
            let cell = tableView.dequeueReusableCell(withIdentifier: SocialButtonTableCell.identify, for: indexPath) as! SocialButtonTableCell
            cell.cellItem = cellItem
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
        
        if let cellItem = self.viewModel.cellItems[indexPath.row] as? ACTextFieldTableCellItem {
            let cell = tableView.dequeueReusableCell(withIdentifier: ACTextFieldTableCell.identify, for: indexPath) as! ACTextFieldTableCell
            cell.cellItem = cellItem
            cell.selectionStyle = .none
            cell.delegate = self
            
            return cell
        }
        
        if let cellItem = self.viewModel.cellItems[indexPath.row] as? ACButtonTableCellItem {
            let cell = tableView.dequeueReusableCell(withIdentifier: ACButtonTableCell.identify, for: indexPath) as! ACButtonTableCell
            cell.cellItem = cellItem
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
        
        if let cellItem = self.viewModel.cellItems[indexPath.row] as? ACTextContentTableCellItem {
            let cell = tableView.dequeueReusableCell(withIdentifier: ACTextContentTableCell.identify, for: indexPath) as! ACTextContentTableCell
            cell.cellItem = cellItem
            cell.selectionStyle = .none
            cell.titleLabel.textAlignment = .center
            cell.titleLabel.alpha = 0.6
            return cell
        }
        
        if let cellItem = self.viewModel.cellItems[indexPath.row] as? ACAgreementTableCellItem {
            let cell = tableView.dequeueReusableCell(withIdentifier: ACAgreementTableCell.identify, for: indexPath) as! ACAgreementTableCell
            cell.cellItem = cellItem
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "spaceCell", for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
}

extension SignUpViewController: SocialButtonTableCellDelegate {
    func socialButtonTabelCell(_ cell: SocialButtonTableCell, didTapButton cellItem: SocialButtonTableCellItem?) {
        
        if cellItem?.id == RegisterField.facebookButton.hashValue {
            print("facebool")
        }
        
        if cellItem?.id == RegisterField.googleButton.hashValue {
            print("google")
        }
    }
}

extension SignUpViewController: ACTextFieldTableCellDelegate {
    
    func acTextFieldTableCell(_ cell: ACTextFieldTableCell, didTapTexField cellItem: ACTextFieldTableCellItem?) {
    }
    
    func acTextFieldTableCell(_ cell: ACTextFieldTableCell, didEditing cellItem: ACTextFieldTableCellItem?) {
        
        cell.textField.setThemeTextColor(keyPath: ThemeKeys.TextField.textColor.key)
        print(cell.textField.text ?? "")

    }
}

extension SignUpViewController: ACButtonTableCellDelegate {
    func acButtonTabelCell(_ cell: ACButtonTableCell, didTapButton cellItem: ACButtonTableCellItem?) {
        print("register")
    }
}

extension SignUpViewController: ACAgreementTableCellDelegate {
    func acAgreementTableCell(_ cell: ACAgreementTableCell, didTapButton cellItem: ACAgreementTableCellItem?, _ gestureRegconize: UITapGestureRecognizer) {
        
        guard let agreementText = cellItem?.title else { return }
        
        let linkTermConditionRange = (agreementText as NSString).range(of: LocalizeStrings.Account.termsAndConditionsString)
        let linkPrivacyPolicyRange = (agreementText as NSString).range(of: LocalizeStrings.Account.privacyPolicyString)
        
        if gestureRegconize.didTapAttributedTextInLabel(label: cell.titleLabel, inRange: linkTermConditionRange) {
            print("TermCondition")
        }
        if gestureRegconize.didTapAttributedTextInLabel(label: cell.titleLabel, inRange: linkPrivacyPolicyRange) {
            print("PrivacyPolicy")
        }
    }
}
