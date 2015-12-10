//
//  FirstViewController.swift
//  View Switcher
//
//  Created by Mashiro on 15/12/11.
//  Copyright © 2015年 Mashiro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstButtonClicked(sender: UIButton) {
        let alert = UIAlertController (title: "黄色页面的按钮被点击了", message: "你点击了黄色页面的按钮", preferredStyle: .Alert)
        let action = UIAlertAction (title: "是的", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

}
