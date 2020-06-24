//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by yurik on 6/24/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {

    var emoji = Emoji(emoji: "", name: "", description: "", isChekked: false) //для заполнения таблицы главного экрана передаваемыми значениями из textFields
    
    @IBOutlet weak var emojiTextfield: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         updateUI()
         saveButtonState()
     }
    
    @IBAction func changedAction(_ sender: UITextField) {
        saveButtonState()
    }
    
    
    
    private func saveButtonState(){
        let emojiText = emojiTextfield.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextfield.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
        
    }
    
    //обновление интерфейса
    private func updateUI() {
        emojiTextfield.text = emoji.emoji
        nameTextField.text = emoji.name
        descriptionTextfield.text = emoji.description
    }
    
    
 
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else {return}
        
        let emoji = emojiTextfield.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextfield.text ?? ""
        
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isChekked: self.emoji.isChekked)
    }
  

   

    
}
