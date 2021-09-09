//
//  DetailViewController.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/16/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,WKNavigationDelegate {

        var webView: WKWebView!
    
        override func loadView() {
             webView = WKWebView()
             webView.navigationDelegate = self
             view = webView

         }
         
         override func viewDidLoad() {
             super.viewDidLoad()
             let url = URL(string: "https://vegnews.com/2021/1/Beyond-Meat-Pepsi-Plant-Based-Snacks")!
             webView.load(URLRequest(url: url))
             webView.allowsBackForwardNavigationGestures = true
         }


}
