//
//  ViewController.swift
//  FirstAfternoonDemon
//
//  Created by Vawdrey, Derek on 10/6/17.
//  Copyright © 2017 Vawdrey, Derek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    @IBAction func firstMethod(_ sender: UIButton) {
        if(sender.backgroundColor == .orange){
            sender.backgroundColor = .black
        }else{
            sender.backgroundColor = .orange
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
