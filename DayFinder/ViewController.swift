//
//  ViewController.swift
//  DayFinder
//
//  Created by Karlis Cars on 26/10/2019.
//  Copyright © 2019 Karlis Cars. All rights reserved.
//

import UIKit
var str = "izmainja"
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        statusBarStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    func statusBarStyle(){
        let app = UINavigationBarAppearance()
        app.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
    }

}

