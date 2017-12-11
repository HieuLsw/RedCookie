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
    @IBOutlet var webView:WKWebView!
    @IBOutlet var settingButton:NSButton!
    @IBOutlet var closeButton:NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let myURL = URL(string: "https://papago.naver.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    @IBAction func closeApp(sender: AnyObject?) {
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
