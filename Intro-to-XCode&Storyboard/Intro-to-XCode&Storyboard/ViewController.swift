//
//  ViewController.swift
//  Intro-to-XCode&Storyboard
//
//  Created by Rachel F on 7/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is a print statement - testing testing!")
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
        if let newTitle = textField.text {
            appTitle.text = newTitle
        }
        
    }

}

