//
//  ConfigViewController.swift
//  FoodGame
//
//  Created by Igor Kenzo Miyamoto Dias on 06/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//


import UIKit
import AVFoundation

class ConfigPauseViewController: UITableViewController {
    
  @IBOutlet weak var musicVol2: UISlider!
  @IBOutlet weak var soundVol2: UISlider!
    
    var volumeChangedDelegate : VolumeChangedDelegate?

    
    let mv = UserDefaults.standard.float(forKey: "musicVol")
    let sv = UserDefaults.standard.float(forKey: "soundVol")
    //var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicVol2.addTarget(self, action: #selector(musicVolChange), for: .valueChanged)
        soundVol2.addTarget(self, action: #selector(soundVolChange), for: .valueChanged)

        musicVol2.value = mv
        soundVol2.value = sv
      
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
  
    
    @objc func musicVolChange()
    {
      let volume = ["musicVolume": musicVol2.value]
      NotificationCenter.default.post(name: NSNotification.Name("musicVolumeChange"), object: nil, userInfo: volume)
    }
    @objc func soundVolChange()
    {
        volumeChangedDelegate?.changeVol(sender: soundVol2, key: "soundVol")
    }
    
  
    @IBAction func voltarTelaAnteriorz()
    {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
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



