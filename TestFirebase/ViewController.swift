//
//  ViewController.swift
//  TestFirebase
//
//  Created by Ruel Lafuente on 18/08/2019.
//  Copyright © 2019 LafuenteR. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var postData = [String]()
    var testhey = ["Hey","Hi","Hello"]
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
//        ref.child("Posts").ob
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testhey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel!.text = testhey[indexPath.row]
        return cell!
    }


}

