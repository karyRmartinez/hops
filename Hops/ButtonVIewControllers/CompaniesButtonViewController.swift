//
//  BeautyButtonViewController.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/18/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit
import WebKit

class CompaniesButtonViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.pivotfood.org/companies/?gclid=CjwKCAiAmrOBBhA0EiwArn3mfDBgUNgsb1to7vbo6yimd88jCOS5rGFzzf3yn3iga5LwIsy7D0M2dRoCVSAQAvD_BwE")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}
