//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Rachel F on 7/19/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var listOfToDo : [ToDoClass] = []
    
    func createToDo() -> [ToDoClass] {
        let ashPrincessToDo = ToDoClass()
        ashPrincessToDo.description = "Ash Princess"
        ashPrincessToDo.important = true
        
        let scytheToDo = ToDoClass()
        scytheToDo.description = "Scythe"
        
        return [ashPrincessToDo, scytheToDo]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfToDo = createToDo()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let eachToDo = listOfToDo[indexPath.row]
        if eachToDo.important {
            cell.textLabel?.text = "❗️" + eachToDo.description
        } else {
            cell.textLabel?.text = eachToDo.description
        }
        return cell
    }
    
    override func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let eachToDo = listOfToDo[indexPath.row]
        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousToDoTVC = self
      }

      if let completeVC = segue.destination as? CompletedToDoViewController {
        if let toDo = sender as? ToDoClass {
            completeVC.selectedToDo = toDo
          completeVC.previousToDoTVC = self
        }
      }
    }

}
