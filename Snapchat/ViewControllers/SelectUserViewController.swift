//
//  SelectUserViewController.swift
//  Snapchat
//
//  Created by Marcus Jessnitz on 15.01.18.
//  Copyright © 2018 Marcus Jessnitz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    var imageURL = ""
    var descrip = ""
    var uuid = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: {(snapshot) in
            
            let user = User()
            user.email = snapshot.childSnapshot(forPath: "email").value as! String
            user.uid = snapshot.key
            
            self.users.append(user)
            self.tableView.reloadData()
        })
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
       
        let snap = ["from":Auth.auth().currentUser!.email, "description":descrip, "imageURL":imageURL, "uuid":uuid]
        Database.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
        
        navigationController!.popToRootViewController(animated: true)
    }
    
}
