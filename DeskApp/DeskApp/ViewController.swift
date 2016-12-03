//
//  ViewController.swift
//  DeskApp
//
//  Created by herry on 03/12/2016.
//  Copyright © 2016 herry. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController,WebFrameLoadDelegate {
    
    @IBOutlet var web: WebView!
    @IBOutlet var active: NSProgressIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL.init(string: "https://github.com/cathleya/DeskApp")
        let req = NSURLRequest.init(url: url as! URL)
        
        
        web.mainFrame.load(req as URLRequest!)
        web.frameLoadDelegate = self
        
        
        active.startAnimation(self);

        // Do any additional setup after loading the view.
    }
    
    func webView(_ sender: WebView!, didStartProvisionalLoadFor frame: WebFrame!){
        
        if frame == sender.mainFrame {
            
            //let url = frame.provisionalDataSource.request.url?.absoluteString
            //[textField setStringValue:url];
            
        }
    }
    
    func webView(_ sender: WebView!, didFinishLoadFor frame: WebFrame!){
        active.stopAnimation(self)
        active.removeFromSuperview()
        print("finished...")
    }
    
    func webView(_ sender: WebView!, didFailProvisionalLoadWithError error: Error!, for frame: WebFrame!){
        NSLog("error ocuured:\(error)")
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

