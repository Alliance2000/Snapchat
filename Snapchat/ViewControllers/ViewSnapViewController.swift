//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Marcus Jessnitz on 19.01.18.
//  Copyright © 2018 Marcus Jessnitz. All rights reserved.
//

import UIKit

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var snap = Snap()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = snap.descrip
    }



}
