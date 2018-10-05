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
        let url = URL(string: "http://localhost:8080")
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            let logLine = String(format: "Status code: %ld\n", statusCode)
            DispatchQueue.main.async {
                self.healthCheckLog.text.append(logLine)
            }
        }
        dataTask.resume()
    }
}

