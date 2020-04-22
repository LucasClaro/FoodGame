//
//  TutorialContentViewController.swift
//  proofPageView
//
//  Created by Igor Kenzo Miyamoto Dias on 07/04/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

class TutorialContentViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var titleTu: UILabel!
    
    @IBOutlet weak var headingLabelTop : UILabel!
    @IBOutlet weak var subHeadingLabelTop : UILabel!
    @IBOutlet weak var contentImageViewTop : UIImageView!
  
    @IBOutlet weak var headingLabelMid: UILabel!
    @IBOutlet weak var subHeadingLabelMid: UILabel!
    @IBOutlet weak var contentImageViewMid: UIImageView!
    
    @IBOutlet weak var headingLabelBot: UILabel!
    @IBOutlet weak var subHeadingLabelBot: UILabel!
    @IBOutlet weak var contentImageViewBot: UIImageView!
    
    //MARK: Valores Passados
    var index = 0
    var titleText = ""
    var headingTop = ""
    var headingMid = ""
    var headingBot = ""
    var subHeadingTop = ""
    var subHeadingMid = ""
    var subHeadingBot = ""
    var imageFileTop = ""
    var imageFileMid = ""
    var imageFileBot = ""

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //atribuir valores
        titleTu.text = titleText
        
        headingLabelTop.text = headingTop
        subHeadingLabelTop.text = subHeadingTop
        contentImageViewTop.image = UIImage(named: imageFileTop)
        
        headingLabelMid.text = headingMid
        subHeadingLabelMid.text = subHeadingMid
        contentImageViewMid.image = UIImage(named: imageFileMid)
        
        headingLabelBot.text = headingBot
        subHeadingLabelBot.text = subHeadingBot
        contentImageViewBot.image = UIImage(named: imageFileBot)
    }

}
