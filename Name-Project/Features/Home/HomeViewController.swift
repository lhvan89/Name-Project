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
        self.myView.setThemeBackgroundColor(keyPath: ThemeKeys.View.backgroundColor3.key)
        self.view.addSubview(self.myView)
        
        // set constraint layout
        
        // myView
        self.myView.snp.makeConstraints { [weak self] (maker) in
            
            guard let strongSelf = self else { return }
            
            maker.center.equalTo(strongSelf.view)
            maker.width.height.equalTo(200)
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
