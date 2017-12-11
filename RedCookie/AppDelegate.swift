//
//  AppDelegate.swift
//  QuickTranslator
//
//  Created by 이도현 on 2017. 12. 7..
//  Copyright © 2017년 dhlee. All rights reserved.
//

import Cocoa
import Carbon
import Magnet

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    static let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("language"))
            button.action = #selector(togglePopover(_:))
        }
        
        AppDelegate.popover.contentViewController = TranslateViewController.freshController()
        
        // added hot key to open up.
        guard let keyCombo2 = KeyCombo(keyCode: 43, cocoaModifiers: [.command]) else { return }
        let hotKey2 = HotKey(identifier: "Command<",
                             keyCombo: keyCombo2,
                             target: self,
                             action: #selector(AppDelegate.hotOpen))
        hotKey2.register()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func hotOpen(_ sender:Any?){
        if AppDelegate.popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }

    @objc func togglePopover(_ sender: Any?) {
        if AppDelegate.popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func closePopover(sender: Any?){
        AppDelegate.popover.performClose(sender)
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            AppDelegate.popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }
}

