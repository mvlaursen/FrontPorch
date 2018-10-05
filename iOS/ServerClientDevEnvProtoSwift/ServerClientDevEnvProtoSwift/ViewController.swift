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
        let url = URL(string: "http://localhost:8080/health")
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            var logLine: String?
            
            if error == nil {
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
                logLine = String(format: "Status Code: %ld %@\n", statusCode, HTTPURLResponse.localizedString(forStatusCode: statusCode))
            } else {
                logLine = String(format: "Error: %@\n", error?.localizedDescription ?? "No error description.")
            }
            
            DispatchQueue.main.async {
                assert(logLine != nil)
                if logLine != nil {
                    self.healthCheckLog.text.append(logLine!)
                }
            }
        }
        dataTask.resume()
    }
}

