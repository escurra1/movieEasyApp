//
//  Utils.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation
import SwiftMessages
import Toast_Swift

enum UserName: Int {
    case minimunNameLength = 2
    case maximunNameLength = 20
}

enum PasswordName: Int {
    case minimunNameLength = 2
    case maximunNameLength = 20
}

class Utils: NSObject {
    static func presentTo(originType: UIViewController, destinationType: UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
            originType.present(destinationType, animated: true, completion: nil)
        })
    }
    
    static func routeToModal(title: String, subtitle: String, from view: UIViewController, okTitle: String) {
        let popup = ModalInformationViewController()
        popup.delegate = view as? ModalInformationDelegate
        popup.titleModal = title
        popup.descriptionModal = subtitle
        popup.titleForAcceptButton = okTitle
        popup.definesPresentationContext = true
        popup.modalPresentationStyle = .overFullScreen
        popup.modalTransitionStyle = .crossDissolve
        Utils.presentTo(originType: view, destinationType: popup)
    }
    
    static func showToast(message: String, duration: Double = 2.0, position: ToastPosition = .bottom) {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        window?.hideAllToasts()
        window?.makeToast(message, duration: duration, position: position)
    }
    
    static func showMessageTop(_ isValid: Bool, textBody: String) {
        if isValid == true {
            SwiftMessages.hideAll()
            SwiftMessages.pauseBetweenMessages = 0.0
            let view: MessageView
            view = try! SwiftMessages.viewFromNib()
            view.configureContent(title: .empty, body: textBody, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: .empty, buttonTapHandler: { _ in
                SwiftMessages.hide()})
            view.accessibilityPrefix = NSLocalizedString("error", comment: "error")
            view.configureDropShadow()
            view.button?.isHidden = true
            var config = SwiftMessages.defaultConfig
            config.presentationStyle = .top
            config.presentationContext = .window(windowLevel: .statusBar)
            config.preferredStatusBarStyle = .lightContent
            config.interactiveHide = false
            config.duration = .seconds(seconds: 1.5)
            view.configureTheme(backgroundColor: UIColor.red, foregroundColor: UIColor.white, iconImage: nil, iconText: nil)
            config.dimMode = .gray(interactive: true)
            SwiftMessages.show(config: config, view: view)
        } else {
            SwiftMessages.hide()
            SwiftMessages.hideAll()
            SwiftMessages.pauseBetweenMessages = 0.0
        }
    }
    
    static func checkInternetConnection() -> Bool{
        var flag = false
        let reachability = Reachability()
        switch reachability?.connection {
        case .wifi, .cellular:
            flag = true
        default:
            flag = false
        }
        return flag
    }
}
