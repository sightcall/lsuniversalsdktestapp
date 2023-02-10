//
//  ViewController.swift
//  LSUniversalTest
//
//  Created by dpetrovic on 05/12/2022.
//

import UIKit
import LSUniversalSDK

class ViewController: UIViewController {
    let universal = LSUniversal()
    weak var topVC: UIViewController?
    private let logger = Logger()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        // LSUniversalSDK public callbacks
        universal.delegate = self
        
        // mucl and api logs are going to Logger
        universal.logDelegate = logger
        
        start()
    }
    
    func start() {
        // Befor running the app open desktop agent, start session than copy URL here...
        let urlString = "https://guest.sightcall.com/call/a9ee6cc78cdf1ad544e8767a002dbcfc76959d01?pin=187426"
        
        // Now you can start the call
        universal.start(with: urlString, useWebSocketSecure: true)
    }
    
    func stop() {
        // Stop call
        universal.abort()
    }
}
