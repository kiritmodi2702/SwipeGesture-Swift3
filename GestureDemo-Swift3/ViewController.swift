//
//  ViewController.swift
//  GestureDemo-Swift3
//  Copyright © 2017 iOSDevCenters. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , UIGestureRecognizerDelegate , UITextFieldDelegate{
    
    
    @IBOutlet weak var viewSwipe: UIView!

    var swipeGesture  = UISwipeGestureRecognizer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let directions: [UISwipeGestureRecognizerDirection] = [.up, .down, .right, .left]
        for direction in directions {
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipwView(_:)))
            viewSwipe.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = direction
            viewSwipe.isUserInteractionEnabled = true
            viewSwipe.isMultipleTouchEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipwView(_ sender : UISwipeGestureRecognizer){
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .right {
                self.viewSwipe.frame = CGRect(x: self.view.frame.size.width - self.viewSwipe.frame.size.width, y: self.viewSwipe.frame.origin.y , width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            }else if sender.direction == .left{
                self.viewSwipe.frame = CGRect(x: 0, y: self.viewSwipe.frame.origin.y , width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
                
            }else if sender.direction == .up{
                self.viewSwipe.frame = CGRect(x: self.view.frame.size.width - self.viewSwipe.frame.size.width, y: 0 , width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            }else if sender.direction == .down{
                self.viewSwipe.frame = CGRect(x: self.view.frame.size.width - self.viewSwipe.frame.size.width, y: self.view.frame.size.height - self.viewSwipe.frame.height , width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            }
            self.viewSwipe.layoutIfNeeded()
            self.viewSwipe.setNeedsDisplay()
        }
    }


}

