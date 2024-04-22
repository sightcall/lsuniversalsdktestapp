//
//  ViewController.swift
//  LSUniversalTest
//
//  Created by dpetrovic on 05/12/2022.
//

import UIKit
import LSUniversalSDK

class ViewController: UIViewController {
    var termsOfConsentAlertController: UIAlertController?

    let universal = LSUniversal()

    weak var topViewController: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        universal.delegate = self

        start()
    }
    
    func start() {
        // Before running the app open desktop agent, start session than copy URL here...
        let urlString = "https://guest.sightcall.com/call/a9ee6cc78cdf1ad544e8767a002dbcfc76959d01?pin=187426"
        
        // Now you can start the call
        universal.start(with: urlString, useWebSocketSecure: true)
    }
    
    func stop() {
        // Stop call
        universal.abort()
    }
}
