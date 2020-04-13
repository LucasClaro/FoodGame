//
//  TutorialViewController.swift
//  proofPageView
//
//  Created by Igor Kenzo Miyamoto Dias on 08/04/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, TutorialPageViewControllerDelegate {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var btnJogar: UIButton!
    		
    var tutorialPageViewController : TutorialPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnJogar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if let index = tutorialPageViewController?.currentIndex {
            switch index {
            case 0...2:
                btnJogar.isHidden = true
                
            case 3:
                btnJogar.isHidden = false
                
            default: break
            }
            pageController.currentPage = index
        }
    }

    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    @IBAction func btnJogarPressed(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "fezTutorial")
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let pageViewController = segue.destination as? TutorialPageViewController {
            tutorialPageViewController = pageViewController
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    

}
