//
//  ViewController.swift
//  BibleApp_Final
//
//  Created by liuxing on 6/11/19.
//  Copyright © 2019 Jeremy_Liu. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Bible.getBooks())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

