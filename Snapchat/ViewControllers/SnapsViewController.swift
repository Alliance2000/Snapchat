//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Marcus Jessnitz on 14.01.18.
//  Copyright © 2018 Marcus Jessnitz. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func logoutTapped(_ sender: Any) {
        print("##### user logged out")
        dismiss(animated: true, completion: nil)
    }

    
}
