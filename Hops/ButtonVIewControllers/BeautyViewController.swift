//
//  BeautyViewController.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/18/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit
import WebKit

class BeautyViewController: UIViewController,WKNavigationDelegate {
        var webView: WKWebView!
    
        override func loadView() {
             webView = WKWebView()
             webView.navigationDelegate = self
             view = webView

         }
         
         override func viewDidLoad() {
             super.viewDidLoad()
             let url = URL(string: "https://www.peta.org/living/personal-care-fashion/these-companies-dont-test-on-animals/")!
             webView.load(URLRequest(url: url))
             webView.allowsBackForwardNavigationGestures = true
         }

}
