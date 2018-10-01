//
//  HomeViewController.swift
//  Name-Project
//
//  Created by Van Le on 9/27/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var myView = UIView()
    var textField1 = UITextField()
    var textField2 = UITextField()
    var textField3 = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializeUI()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Initialize UI
    func initializeUI() {
        
        self.title = LocalizeStrings.Home.Nav.titleString
        
        self.view.setThemeBackgroundColor(keyPath: ThemeKeys.View.backgroundColor.key)

        // myView
        self.myView.setThemeBackgroundColor(keyPath: ThemeKeys.View.backgroundColor2.key)
        self.view.addSubview(self.myView)

        // Set constraint layouts

        // myView
        self.myView.snp.makeConstraints { [weak self] (maker) in

            guard let strongSelf = self else { return }

            maker.center.equalTo(strongSelf.view)
            maker.width.height.equalTo(200)
        }
        
        // textField
        self.textField1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.textField2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.textField3.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.textField1.setLeftPaddingPoints(8)
        self.textField2.setLeftPaddingPoints(8)
        self.textField3.setLeftPaddingPoints(8)
        
        self.view.addSubview(self.textField1)
        self.view.addSubview(self.textField2)
        self.view.addSubview(self.textField3)
        
        
        self.textField1.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.top.equalTo(strongSelf.myView.snp.bottom).offset(32)
            maker.left.equalTo(strongSelf.view).offset(16)
            maker.right.equalTo(strongSelf.view).offset(-16)
            maker.height.equalTo(45)
        }
        
        self.textField2.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.top.equalTo(strongSelf.textField1.snp.bottom).offset(16)
            maker.left.equalTo(strongSelf.view).offset(16)
            maker.right.equalTo(strongSelf.view).offset(-16)
            maker.height.equalTo(45)
        }
        
        self.textField3.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.top.equalTo(strongSelf.textField2.snp.bottom).offset(16)
            maker.left.equalTo(strongSelf.view).offset(16)
            maker.right.equalTo(strongSelf.view).offset(-16)
            maker.height.equalTo(45)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
