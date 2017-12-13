//
//  PapagoWebView.swift
//  RedCookie
//
//  Created by 이도현 on 2017. 12. 12..
//  Copyright © 2017년 dhlee. All rights reserved.
//

import Cocoa
import WebKit

class PapagoWebView: WKWebView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func performKeyEquivalent(with event: NSEvent) -> Bool {
        super.performKeyEquivalent(with: event)
        if let ch = event.characters {
            if event.modifierFlags.rawValue == 1048840 {
                if ch == "a" {
                    self.selectAll(nil)
                    return true
                }
                
                if ch == "c" {
                    self.copy()
                    return true
                }
            }
        }
        
        return false
    }
}
