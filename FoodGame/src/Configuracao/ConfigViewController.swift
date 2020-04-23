//
//  ConfigViewController.swift
//  FoodGame
//
//  Created by Igor Kenzo Miyamoto Dias on 06/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//


import UIKit
import AVFoundation

protocol VolumeChangedDelegate : class {
    func changeVol(sender : UISlider, key : String)
}

class ConfigViewController: UITableViewController {
    
    @IBOutlet weak var musicVol: UISlider!
    @IBOutlet weak var soundVol: UISlider!
    
    var volumeChangedDelegate : VolumeChangedDelegate?

    
    let mv = UserDefaults.standard.float(forKey: "musicVol")
    let sv = UserDefaults.standard.float(forKey: "soundVol")
    //var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicVol.addTarget(self, action: #selector(musicVolChange), for: .valueChanged)
        soundVol.addTarget(self, action: #selector(soundVolChange), for: .valueChanged)

        musicVol.value = mv
        soundVol.value = sv
      
        
    }

  
    
    @objc func musicVolChange()
    {
      let volume = ["musicVolume": musicVol.value]
      NotificationCenter.default.post(name: NSNotification.Name("musicVolumeChange"), object: nil, userInfo: volume)
    }
    @objc func soundVolChange()
    {
        volumeChangedDelegate?.changeVol(sender: soundVol, key: "soundVol")
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

