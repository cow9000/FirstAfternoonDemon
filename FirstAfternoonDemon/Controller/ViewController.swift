//
//  ViewController.swift
//  FirstAfternoonDemon
//
//  Created by Vawdrey, Derek on 10/6/17.
//  Copyright © 2017 Vawdrey, Derek. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    
    @IBOutlet var pageChangeControl: UISwipeGestureRecognizer!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var ColorLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBAction func firstMethod(_ sender: UIButton) {
        let color : UIColor = createRandomColor()
        if(ColorLabel.textColor == .black){
            firstButton.backgroundColor = color
            ColorLabel.textColor = .orange
        }else{
            firstButton.backgroundColor = color
            ColorLabel.textColor = .black
        }
        view.backgroundColor = color
    }
    
    private func createRandomColor() -> UIColor{
        let newColor : UIColor
        let redValue : CGFloat = CGFloat(Double (arc4random_uniform(256))/255.00)
        let greenValue : CGFloat = CGFloat(Double (arc4random_uniform(256))/255.00)
        let blueValue : CGFloat = CGFloat(Double (arc4random_uniform(256))/255.00)
        
        newColor = UIColor(red:redValue, green:greenValue, blue:blueValue, alpha:CGFloat(alphaSlider.value))
        
        return newColor
    }
    
    @IBAction func changeAlphaOfBackground(_ sender: UISlider) {
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(alphaSlider.value))
        
        
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

