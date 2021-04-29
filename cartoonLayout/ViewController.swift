//
//  ViewController.swift
//  cartoonLayout
//
//  Created by yujin on 2021/04/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topIV: UIImageView!
    @IBOutlet weak var leftIV: UIImageView!
    @IBOutlet weak var rightIV: UIImageView!
    @IBOutlet weak var leftTopPosition: NSLayoutConstraint!
    @IBOutlet weak var rightTopPosition: NSLayoutConstraint!
    @IBOutlet weak var leftLeft: NSLayoutConstraint!
    @IBOutlet weak var rightRight: NSLayoutConstraint!
    override func viewDidLoad() {
  
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        topIV.image = UIImage(named: "IMG_0967")
        topIV.contentMode = .scaleToFill
        
        let source = UIImage(named: "maskA")
        let w = view.frame.size.width*0.95
        let h = (w / 196) * 143
        let mask = UIImageView(frame: CGRect(x: 0, y: 0, width: w, height: h))
        mask.image = source
        mask.contentMode = .scaleToFill
        topIV.mask = mask
        
        let source2 = UIImage(named: "maskB")
        let w2 = view.frame.size.width*0.46
        let h2 = (w2 / 172) * 233
        let mask2 = UIImageView(frame: CGRect(x: 0, y: 0, width: w2, height: h2))
        mask2.image = source2
        mask2.contentMode = .scaleToFill
        leftIV.mask = mask2
        
        let source3 = UIImage(named: "maskC")
        let w3 = view.frame.size.width*0.46
        let h3 = (w3 / 172) * 202
        let mask3 = UIImageView(frame: CGRect(x: 0, y: 0, width: w3, height: h3))
        mask3.image = source3
        mask3.contentMode = .scaleToFill
        rightIV.mask = mask3
        
        let deviceType = UIDevice.current.model
        print(deviceType)
        
        if deviceType.contains("iPad"){
        //TODO To prevent collasping the layout, we need to vary the value of the right and left margins in every sizes.
        let new = NSLayoutConstraint(item: leftIV, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topIV, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -135)
        self.view.removeConstraint(leftTopPosition)
        self.view.addConstraint(new)
        self.view.layoutIfNeeded()
        
        let new2 = NSLayoutConstraint(item: rightIV, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topIV, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -69)
        self.view.removeConstraint(rightTopPosition)
        self.view.addConstraint(new2)
        self.view.layoutIfNeeded()
        
        let new3 = NSLayoutConstraint(item: leftIV, attribute:.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem:self.view.safeAreaLayoutGuide, attribute:.leading, multiplier: 1, constant: 20)
        self.view.removeConstraint(leftLeft)
        self.view.addConstraint(new3)
        self.view.layoutIfNeeded()
        
        let new4 = NSLayoutConstraint(item: rightIV, attribute:.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem:self.view.safeAreaLayoutGuide, attribute:.trailing, multiplier: 1, constant: -20)
        self.view.removeConstraint(rightRight)
        self.view.addConstraint(new4)
        self.view.layoutIfNeeded()
        }
    }


}

