//
//  EmojiTableViewController.swift
//  EmojiReader
//
//  Created by yurik on 6/22/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
        var objects = [Emoji(emoji: "🐖", name: "Pig", description: "dsgsdgsg", isChekked: false),
                   Emoji(emoji: "🐑", name: "Sheep", description: "dsgsdgnfgjfjftjrtsg", isChekked: false),
                   Emoji(emoji: "🐕", name: "Dog", description: "dsgsdgsreyetruyrturtg", isChekked: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "Emoji reader"
        self.navigationItem.leftBarButtonItem = self.editButtonItem //кнопка Edit/Done
        
        //строка не нужна так как идентификатор назначен в интерфейсбилдере
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "jacheyka")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
         guard segue.identifier == "saveSegue" else {return}
        
        let sourceVC = segue.source as! NewEmojiTableViewController //прокастились до того экрана с которого получим данные
        let emoji = sourceVC.emoji // добрались до данных
        
        let newIndexPath = IndexPath(row: objects.count, section: 0) //добавление последний строки массива в константу newIndexPath
        objects.append(emoji) //добавление в массив нового emoji
        
        //обновление таблицы
        tableView.insertRows(at: [newIndexPath], with: .fade) // добавление в таблицу нового значения константы newIndexPath
        
        
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }
    
    
    //отображение заданной информации в ячейке
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)
        
        return cell
    }
    
    //добавление кнопки Delete( можно Insert)
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //логика кнопки Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // добавление кнопки перемещения
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //логика перемещения
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObject = objects.remove(at: sourceIndexPath.row)
        objects.insert(moveObject, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    //добавления свайпов
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favorite = favoriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done, favorite])
    }
  
    //логика кнопки с левой стороны при свайпе(кнопка - галочка)
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "checkmark.circle")
        return action
    }
   
    //логика кнопки с левой стороны при свайпе(кнопка - сердце)
    func favoriteAction(at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favorite") { (action, view, completion) in
            object.isChekked = !object.isChekked
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isChekked ? .systemPurple : .systemGray5
        action.image = UIImage(systemName: "heart")
        return action
    }
   
    
}
