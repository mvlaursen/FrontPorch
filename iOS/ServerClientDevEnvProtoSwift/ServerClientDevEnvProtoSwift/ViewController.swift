//
//  ViewController.swift
//  ServerClientDevEnvProtoSwift
//
//  Created by Mike Laursen on 10/5/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {        
    @IBOutlet weak var healthCheckLog: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func doHealthCheck(_ sender: UIButton) {
        healthCheckLog.text = "Hello, world!"
    }
}

