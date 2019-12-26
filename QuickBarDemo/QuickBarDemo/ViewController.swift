//
//  ViewController.swift
//  QuickBarDemo
//
//  Created by Deepak Raman on 12/25/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import QuickBar

class ViewController: UIViewController {

    @IBAction func showQuickBar(_ sender: Any) {
        let quickBar = QuickBar(quickMessage: "Hello World!!")
        quickBar.present()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

