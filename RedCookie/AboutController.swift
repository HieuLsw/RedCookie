//
//  AboutController.swift
//  RedCookie
//
//  Created by 이도현 on 2017. 12. 26..
//  Copyright © 2017년 dhlee. All rights reserved.
//

import Cocoa

class AboutController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func viewOnGitHub(sender: AnyObject?){
        NSWorkspace.shared.open(URL(string: "https://github.com/scalalang2/RedCookie")!)
    }
}
