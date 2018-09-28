//
//  HomeViewController.swift
//  Name-Project
//
//  Created by Van Le on 9/27/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        self.view.setThemeBackgroundColor(keyPath: ThemeKeys.View.backgroundColor2.key, alpha: AlphaColor.disable)
        // Do any additional setup after loading the view.
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
