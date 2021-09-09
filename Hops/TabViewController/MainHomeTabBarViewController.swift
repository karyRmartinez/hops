//
//  MainHomeTabBarViewController.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/15/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {

    lazy var listViewController = UINavigationController(rootViewController: FeedViewController())
    lazy var scanListViewController = UINavigationController(rootViewController: ScannnerViewController())
    lazy var categotylist = UINavigationController(rootViewController: CategoryViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "doc.plaintext"), tag: 0)
        scanListViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName:"barcode.viewfinder" ), tag: 0)
        categotylist.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName:"doc.text.magnifyingglass" ), tag: 0)
        self.viewControllers = [listViewController,scanListViewController,categotylist]
    }
 

}
