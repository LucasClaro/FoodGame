//
//  ConfigViewController.swift
//  FoodGame
//
//  Created by Igor Kenzo Miyamoto Dias on 06/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//


import UIKit
import AVFoundation

class ConfigViewController: UIViewController {
    
    @IBOutlet weak var musicVol: UISlider!
    @IBOutlet weak var soundVol: UISlider!
    @IBOutlet weak var lblMV: UILabel!
    @IBOutlet weak var lblSV: UILabel!
    var mv = 0.0,sv = 0.0
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicVol.addTarget(self, action: #selector(musicVolChange), for: .valueChanged)
        soundVol.addTarget(self, action: #selector(soundVolChange), for: .valueChanged)
        player = AVAudioPlayer()
        do {
            let path = Bundle.main.path(forResource: "soviet-anthem", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
            player.play()
        }
        catch {
            print(error)
        }
        
    }
    
    @objc func musicVolChange()
    {
        player.volume = musicVol.value
        lblMV.text = "\(musicVol.value)"
    }
    @objc func soundVolChange()
    {
        lblSV.text = "\(soundVol.value)"
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

