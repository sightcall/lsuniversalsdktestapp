//
//  ViewController+LSUniversalSDKDelegate.swift
//  LSUniversalTest
//
//  Created by dpetrovic on 10/02/2023.
//

import UIKit

// This enum is for test puropse
private enum ConnectionStatus: Int {
    /** The LSUniversalSDK  is inactive and waiting for function.  **/
    case idle
    /** The LSUniversalSDK is connected as agent.  **/
    case agentConnected
    /** The LSUniversalSDK is registering an agent. **/
    case agentRegistering
    /** The LSUniversalSDK is unregistering as agent. **/
    case agentUnregistering
    /** *  The LSUniversalSDK is connecting. */
    case connecting
    /**  The LSUniversalSDK is connected. Depending on the authentication process, a call is being created. **/
    case active
    /**  A call was started. **/
    case calling
    /** A call is active. **/
    case callActive
    /** The LSUniversalSDK is disconnecting. **/
    case disconnecting
    /** The connection was lost. **/
    case networkLoss
    /** Dummy. **/
    case dummy
}

// Here comes LSUniversal public callbacks
extension ViewController: LSUniversalDelegate {
// Mandatory callbacks
    func connectionEvent(_ status: lsConnectionStatus_t) {
        // For user friendly print we are casting status to Swift ConnectionStatus enum
        print("LSUniversalTest status:", ConnectionStatus(rawValue: status.rawValue) ?? .dummy)
        switch status {
        case .connecting:
            break
        case .active:
            break
        case .calling:
            break
        case .callActive:
            Task { @MainActor in
                guard let c = self.universal.callViewController else { return }
                self.topVC = c
                self.present(c, animated: true)
            }
        case .disconnecting:
            break
        case .networkLoss:
            break
        case .idle:
            break
            
        /** Agent status */
        case .agentConnected:
            break
        case .agentRegistering:
            break
        case .agentUnregistering:
            break
            
        @unknown default:
            break
        }
    }
    
    func connectionError(_ error: lsConnectionError_t) {
        switch error {
        case .networkError:
            break
        case .badCredentials:
            break
        case .unknown:
            break
        @unknown default: break
        }
        
    }
    
    func callReport(_ callEnd: LSCallReport) {
        // Call ended. We can dismiss our VC here
        Task { @MainActor in self.topVC?.dismiss(animated: true) }
        switch callEnd.callEnd {
        case .local:
            break
        case .remote:
            break
        case .eulaRefused:
            break
        case .timeout:
            break
        case .unexpected:
            break
        @unknown default: break
        }
    }
    
// Optional callbacks
    func acdStatusUpdate(_ update: LSACDQueue) {

    }
    
    func acdAcceptedEvent(_ agentUID: String?) {
        
    }
    
    func callSurvey(_ infos: LSSurveyInfos) {
        
    }
    
    func callAgentPoll(_ agentPollAlert: UIAlertController) {
        
    }
    
    func notificationUsecaseAvailable() {
        
    }
    
    func notificationReceived(_ notification: LSNotification) {
        
    }
    
    func guestAcceptedCall(_ userResponse: ((Bool) -> Void)? = nil) {
        
    }
    
    func agentAcceptedCall(_ callURL: String?, userResponse: ((Bool) -> Void)? = nil) {
        
    }
    
    func agentIncomingCallDidTimeout() {
        
    }
    
    func displayConsent(with description: LSConsentDescription) {
        
    }
    
    func featureCommand(_ feature: LSDeeplinkCommand) {
        
    }
    
    func registrationFailure(with status: LSMARegistrationStatus_t) {
        
    }
    
    func showDisplayNameAlert(_ alertController: UIAlertController?) {
        
    }
}
