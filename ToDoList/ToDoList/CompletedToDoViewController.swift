//
//  CompletedToDoViewController.swift
//  ToDoList
//
//  Created by Rachel F on 7/19/21.
//

import UIKit

class CompletedToDoViewController: UIViewController {
    @IBOutlet weak var toDoDisplay: UILabel!
    var previousToDoTVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?

    override func viewDidLoad() {
        super.viewDidLoad()
        toDoDisplay.text = selectedToDo?.descriptionInCD

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
              context.delete(theToDo)
              navigationController?.popViewController(animated: true)
            }
          }
    }
    
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
