//
//  Toast.swift
//  SWToast
//
//  Created by Supernova SanDick SSD on 2019/6/19.
//  Copyright © 2019 Seven. All rights reserved.
//

import Foundation
import UIKit
import GSMessages

public struct Toast {
    public static func makeTextFromTop(context: UIViewController, text: String, duration: Toast.Duration, style: Toast.Style) {
        var messageType: GSMessageType = .success
        switch style {
        case .error:    messageType = .error
        case .info:     messageType = .info
        case .warning:  messageType = .warning
        default: break
        }
    
        context.showMessage(
            text, 
            type: messageType, 
            options: [
                .animations([.slide(.normal)]),
                .hideOnTap(true),
                .autoHide(true),
                .autoHideDelay(duration.rawValue),
                .position(.top),
                .textAlignment(.center),
                .textNumberOfLines(0)
            ]
        )

    }
    public static func makeTextFromBottom(context: UIViewController, text: String, duration: Toast.Duration, style: Toast.Style) {
        var messageType: GSMessageType = .success
        switch style {
        case .error:    messageType = .error
        case .info:     messageType = .info
        case .warning:  messageType = .warning
        default: break
        }
        
        context.showMessage(
            text, 
            type: messageType, 
            options: [
                .animations([.fade]),
                .hideOnTap(true),
                .autoHide(true),
                .autoHideDelay(duration.rawValue),
                .position(.bottom),
                .textAlignment(.center),
                .textNumberOfLines(0)
            ]
        )
    }
}

extension Toast {
    public enum Duration: TimeInterval {
        case short  = 2.0
        case long   = 3.5
        
        public var milliseconds: Int {
            return Int(self.rawValue * 1000)
        }
    }
    public enum Style {
        case success, error, warning, info
    }
}
