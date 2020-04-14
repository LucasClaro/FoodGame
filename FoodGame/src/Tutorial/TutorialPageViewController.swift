//
//  TutorialPageViewController.swift
//  proofPageView
//
//  Created by Igor Kenzo Miyamoto Dias on 08/04/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

protocol TutorialPageViewControllerDelegate : class {
    func didUpdatePageIndex(currentIndex: Int)
}

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let titleTu = ["O que é","Como funciona","Não sei","F"]
    let pageHeadings = ["Designed by FreepikPrimeira tela","Designed by Freepik2 tela","Designed by Freepikweeeee","Designed by Freepikaaaaaaaaa"]
    let pageSubHeadings = ["1111111111111111111111111","Bacon","eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed","bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"]
    
    let pageImages = ["img.jpg","img.jpg","img.jpg","img.jpg"]
    
    weak var tutorialDelegate : TutorialPageViewControllerDelegate?
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        if let initialViewController = contentViewController(at: 0) {
            setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialContentViewController).index

        index -= 1
        
        return contentViewController(at:  index)
      }
      
      func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
          var index = (viewController as! TutorialContentViewController).index
          
          index += 1
          
          return contentViewController(at:  index)
      }
    
    
    func contentViewController(at index : Int) -> TutorialContentViewController? {
        if(index < 0 || index >= pageHeadings.count){
            return nil
        }
        
        if let pageContentViewController = UIStoryboard.init(name: "Tutorial", bundle: nil).instantiateViewController(withIdentifier: "TutorialContentViewController") as? TutorialContentViewController {
            pageContentViewController.titleText = titleTu[index]
            
            pageContentViewController.imageFileTop = pageImages[index]
            pageContentViewController.headingTop = pageHeadings[index]
            pageContentViewController.subHeadingTop = pageSubHeadings[index]
            
            pageContentViewController.imageFileMid = pageImages[index]
            pageContentViewController.headingMid = pageHeadings[index]
            pageContentViewController.subHeadingMid = pageSubHeadings[index]
            
            pageContentViewController.imageFileBot = pageImages[index]
            pageContentViewController.headingBot = pageHeadings[index]
            pageContentViewController.subHeadingBot = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? TutorialContentViewController {
                currentIndex = contentViewController.index
                
                tutorialDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
    
    func fowardPage()
    {
        currentIndex += 1
        if let nextViewControllers = contentViewController(at: currentIndex){
            setViewControllers([nextViewControllers], direction: .forward, animated: true, completion: nil)
        }
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
