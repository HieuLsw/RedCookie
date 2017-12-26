//
//  TranslateViewController.swift
//  QuickTranslator
//
//  Created by 이도현 on 2017. 12. 7..
//  Copyright © 2017년 dhlee. All rights reserved.
//

import Cocoa
import WebKit

class TranslateViewController: NSViewController {
    @IBOutlet var webView:WebView!
    @IBOutlet var settingButton:NSButton!
    
    let popupMenu = NSMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let myURL = URL(string: "https://papago.naver.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.mainFrame.load(myRequest)
        
        let menuItems = [
            NSMenuItem(title: "About RedCookie", action: #selector(TranslateViewController.showAboutWindow), keyEquivalent: ""),
            NSMenuItem.separator(),
            // NSMenuItem(title: "Settings", action: #selector(TranslateViewController.showSettingWindow), keyEquivalent: ""),
            // NSMenuItem.separator(),
            NSMenuItem(title: "Quit", action: #selector(TranslateViewController.closeApp(sender:)), keyEquivalent: "")
        ]
        
        for item in menuItems {
            self.popupMenu.addItem(item)
        }
    }
    
    @IBAction func populateMenus(sender: AnyObject?) {
        let sButtonOrigin = self.settingButton.frame.origin
        let pos = CGPoint(x: sButtonOrigin.x, y: sButtonOrigin.y - 10)
        
        self.popupMenu.popUp(
            positioning: self.popupMenu.item(at: 0),
            at:pos,
            in:self.view
        )
    }
    
    @objc func showSettingWindow() {
        
    }
    
    @objc func showAboutWindow() {
        let storyBoard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), 
                                      bundle: nil)
        let aboutController = storyBoard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "aboutWindowController")) as! NSWindowController
        
        aboutController.showWindow(self)
    }
    
    @objc func closeApp(sender: AnyObject?) {
        exit(0);
    }
}

extension TranslateViewController {
    static func freshController() -> TranslateViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "TranslateViewController")
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? TranslateViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
