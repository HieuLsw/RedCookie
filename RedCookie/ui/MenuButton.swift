//
//  MenuButton.swift
//  QuickTranslator
//
//  Created by 이도현 on 2017. 12. 9..
//  Copyright © 2017년 dhlee. All rights reserved.
//

import Cocoa

class MenuButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func awakeFromNib() {
        let layer = CALayer()
        layer.backgroundColor = CGColor(red: 50.0/255, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        self.wantsLayer = true
        self.layer = layer
    }
}
