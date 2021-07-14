//
//  ViewController.swift
//  MiniProject1
//
//  Created by Rachel F on 7/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Fact1: UILabel!
    @IBOutlet weak var Fact2: UILabel!
    @IBOutlet weak var Fact3: UILabel!
    @IBOutlet weak var Fact4: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Fact1.text = " "
        Fact2.text = " "
        Fact3.text = " "
        Fact4.text = " "
        imageView.image = UIImage(named:"6DD90842-0E11-4792-9D0A-39A8562C5E48_1_105_c")
        // Do any additional setup after loading the view.
    }

    @IBAction func aboutMePressed(_ sender: UIButton) {
        if Fact1.text == "I love to swim and scuba dive" {
            Fact1.text = " "
            Fact2.text = " "
            Fact3.text = " "
            Fact4.text = " "
            imageView.image = UIImage(named:"6DD90842-0E11-4792-9D0A-39A8562C5E48_1_105_c")
        } else {
            Fact1.text = "I love to swim and scuba dive"
            Fact2.text = "I am about to start my 9th school"
            Fact3.text = "I love to do research in my spare time"
            Fact4.text = "I think I want to be an astrophysicist"
            imageView.image = UIImage(named:"")
        }
    }
    
}

