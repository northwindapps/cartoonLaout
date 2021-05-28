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
        
        let burger = UIImage(named: "IMG_0967")
        let imgviewA = UIImageView(frame: CGRect(x: 0, y: 0, width: burger!.size.width, height:burger!.size.height))
        imgviewA.image = burger
        imgviewA.contentMode = .scaleToFill
        //https://stackoverflow.com/questions/11867152/how-to-create-an-image-from-uilabel
        let caption = UIMarginLabel(frame: CGRect(x: 0, y: burger!.size.height, width: burger!.size.width, height: burger!.size.height * 0.1))
        caption.numberOfLines = 0
        caption.leftInset = 15
        caption.rightInset = 15
        caption.topInset = 5
        caption.bottomInset = 5
        caption.text = "humberger observation experiment, day1 fresh. Still edible."
        caption.font = caption.font.withSize(120)
        
        UIGraphicsBeginImageContextWithOptions(caption.bounds.size, false, 0.0)
        caption.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imgviewB = UIImageView(frame: CGRect(x: 0, y: burger!.size.height, width: burger!.size.width, height:burger!.size.height * 0.1))
        imgviewB.image = capImg
        
        let merged = getMixedImg(image1: burger!, image2: capImg!)
        
        UIImageWriteToSavedPhotosAlbum(merged, nil, nil, nil)
        
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

    func getMixedImg(image1: UIImage, image2: UIImage) -> UIImage {

        let size = CGSize(width: image1.size.width, height: image1.size.height + image2.size.height)

        UIGraphicsBeginImageContext(size)

        image1.draw(in: CGRect(x: 0,y: 0,width: size.width, height: image1.size.height))
        image2.draw(in: CGRect(x: 0,y: image1.size.height,width: size.width, height: image2.size.height))
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return finalImage!
    }

}

@IBDesignable class UIMarginLabel: UILabel {
    
    @IBInspectable var topInset:       CGFloat = 0
    @IBInspectable var rightInset:     CGFloat = 0
    @IBInspectable var bottomInset:    CGFloat = 0
    @IBInspectable var leftInset:      CGFloat = 0
    
    
    
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: self.topInset, left: self.leftInset, bottom: self.bottomInset, right: self.rightInset)
        self.setNeedsLayout()
        return super.drawText(in: rect.inset(by: insets))
    }
}
