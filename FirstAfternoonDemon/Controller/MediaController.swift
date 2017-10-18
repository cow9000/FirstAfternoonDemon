//
//  MediaController.swift
//  FirstAfternoonDemon
//
//  Created by Vawdrey, Derek on 10/18/17.
//  Copyright © 2017 Vawdrey, Derek. All rights reserved.
//

import UIKit
import AVFoundation

class MediaController: UIViewController {

    
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var changeImageButton: UIButton!
    @IBOutlet weak var changeVolume: UISlider!
    
    private lazy var color : ColorTools = ColorTools()
    private var imageCounter : Int = 1
    
    private var defaultImage : String = "image1"
    
    private var audioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageContainer.image = UIImage(named:defaultImage)
        loadAudioFile()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageButtonClick(_ sender: Any) {
        changeImage()
        view.backgroundColor = color.createRandomColor()
        
    }
    
    @IBAction func volumeChanged(_ sender: Any) {
        
        audioPlayer?.setVolume(changeVolume.value, fadeDuration: 0.01)
        
    }
    
    @IBAction func playMusicClick(_ sender: Any) {
        changeMusicState()
    }
    
    private func loadAudioFile() -> Void{
        if let soundURL = NSDataAsset(name: "music")
        {
            do{
                try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try! AVAudioSession.sharedInstance().setActive(true)
                try audioPlayer = AVAudioPlayer(data: soundURL.data, fileTypeHint: AVFileType.mp3.rawValue)
                
                changeVolume.maximumValue = Float ((audioPlayer?.duration)!)
                Timer.scheduledTimer(timeInterval:0.2, target: self, selector:(#selector(self.changeMusicState)),userInfo: nil, repeats: true)
                
                soundButton.setTitle("Play Sound", for: .normal)
                
            }catch{
                print("Audio File Load Error")
            }
        }
    }
    
    private func changeImage() -> Void{
        if(imageCounter > 2){
            imageCounter = 0
        }
        
        if(imageCounter == 0){
            imageContainer.image = UIImage(named:"image1")
            
        }else if(imageCounter == 1){
            imageContainer.image = UIImage(named:"image2")
        }else{
            imageContainer.image = UIImage(named:"image3");
        }
        
        imageCounter += 1
        
    }
    
    @objc public func changeMusicState(){
        changeVolume.value = audioPlayer?.currentTime
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
