//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Rachel F on 7/19/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var listOfToDo : [ToDoCD] = []
    
    func getToDos() {
         if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

         if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
              listOfToDo = dataFromCoreData
              tableView.reloadData()
              }
         }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

         let eachToDo = listOfToDo[indexPath.row]

         if let thereIsDescription = eachToDo.descriptionInCD {
              if eachToDo.importantInCD {
            cell.textLabel?.text = "❗️" + thereIsDescription
             } else {
            cell.textLabel?.text = eachToDo.descriptionInCD
             }
         }

         return cell
    }

    
    override func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let eachToDo = listOfToDo[indexPath.row]
        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }
    
    override func viewWillAppear(_ animated: Bool) {
         getToDos()
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousToDoTVC = self
      }

      if let completeVC = segue.destination as? CompletedToDoViewController {
        if let toDo = sender as? ToDoCD {
            completeVC.selectedToDo = toDo
          completeVC.previousToDoTVC = self
        }
      }
    }

}
