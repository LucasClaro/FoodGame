import UIKit
import AVFoundation
class InitialMenuViewController: UIViewController {
  
  // MARK: Variables
  
  // ViewController objects
  @IBOutlet weak var buttonConfiguration: UIButton!
  @IBOutlet weak var buttonPlay: UIButton!
  
  var player = AVAudioPlayer()
    
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(musicChange(_:)), name: NSNotification.Name("musicVolumeChange"), object: nil)
    
    buttonPlay.layer.cornerRadius = 10
    buttonConfiguration.layer.cornerRadius = 10
    let mv = UserDefaults.standard.float(forKey: "musicVol")
    //let sv = UserDefaults.standard.float(forKey: "soundVol")

     player = AVAudioPlayer()
     do {
         let path = Bundle.main.path(forResource: "If_I_Had_a_Chicken", ofType: "mp3")
         try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
         player.prepareToPlay()
         player.volume = mv
         player.play()
     }
     catch {
         print(error)
     }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let configViewController = segue.destination as? ConfigViewController {
            configViewController.volumeChangedDelegate = self
        }
    }
  
  @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
    
  }
  
  @IBAction func play(_ sender: UIButton) {
    if UserDefaults.standard.bool(forKey: "fezTutorial") {
      performSegue(withIdentifier: "Game", sender: nil)
    } else {
      performSegue(withIdentifier: "PersonagemVC", sender: nil)
    }
  }
  
  @objc func musicChange(_ notification: Notification){
    let volume:Float = (notification.userInfo?["musicVolume"] ?? 0) as! Float
    
    player.volume = volume
    UserDefaults.standard.set(volume, forKey: "musicVol")
    
  }
  
  @IBAction func ResetarFezTutorial(_ sender: Any) {
      UserDefaults.standard.set(false, forKey: "fezTutorial")
  }
  
}

extension InitialMenuViewController : VolumeChangedDelegate {
 
    func changeVol(sender: UISlider,key : String) {
        player.volume = sender.value
        UserDefaults.standard.set(sender.value, forKey: key)
    }
    
    
}
