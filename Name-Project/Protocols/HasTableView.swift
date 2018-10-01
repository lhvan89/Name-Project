//
//  HasTableView.swift
//  Name-Project
//
//  Created by Van Le on 10/1/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import Foundation

typealias TableViewContainable = UITableViewDelegate & UITableViewDataSource

protocol HasTableView {
    var tableView: UITableView! { get }
    func setUpTableView()
    func reload(section: Int, with: UITableViewRowAnimation)
}

extension HasTableView where Self: TableViewContainable {
    func reload(section: Int, with: UITableViewRowAnimation = .none) {
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .none)
    }
    
    func tableConfigureDefaultProperties() {
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identify)
        tableView.tableFooterView = UIView()
        tableView.contentInset.bottom = 16
        
        if let vc = self as? UIViewController {
            vc.view.addSubview(tableView)
        } else if self as? UIView != nil {
            (self as? UIView)?.addSubview(tableView)
        }
    }
    
    func bindToEdgesOfView() {
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
    
    func setUpTableView() {
        tableConfigureDefaultProperties()
        bindToEdgesOfView()
    }
}
