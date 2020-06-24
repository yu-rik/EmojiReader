//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by yurik on 6/24/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {

    @IBOutlet weak var emojiTextfield: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextField!
    @IBOutlet weak var saveButton: UINavigationItem!
    
    @IBAction func changedAction(_ sender: UITextField) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
}
