//
//  ViewController.swift
//  Animation
//
//  Created by Никита Кузнецов on 19.11.2020.
//  Copyright © 2020 dreamTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    
    var flag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.backgroundColor = .brown
        button.layer.cornerRadius = 5
    }
    
    
    @IBAction func buttonTap(_ sender: Any) {
        print("H")
        if flag == false {
            flag = true
            MyAnimation.shake(uiView: button)
        } else {
            flag = false
            self.view.subviews.forEach({$0.layer.removeAllAnimations()})
        }
            
        
    }
    

}

class MyAnimation {
    
    
    static func shake(uiView: UIView) {
        
        let animationY = CABasicAnimation(keyPath: "position")
        animationY.fromValue = NSValue(cgPoint: CGPoint(x: uiView.center.x, y: uiView.center.y - 5))
        animationY.toValue = NSValue(cgPoint: CGPoint(x: uiView.center.x, y: uiView.center.y + 5))
        
        let animationX = CABasicAnimation(keyPath: "position")
        animationY.fromValue = NSValue(cgPoint: CGPoint(x: uiView.center.x - 5, y: uiView.center.y))
        animationY.toValue = NSValue(cgPoint: CGPoint(x: uiView.center.x + 5, y: uiView.center.y))
        
        let animationRotate = CABasicAnimation(keyPath: "transform.rotation.z")
        animationRotate.fromValue = NSNumber(value: Double.pi / 10)
        animationRotate.toValue = NSNumber(value: Double.pi / -10)
        
        let group = CAAnimationGroup()
        group.duration = 0.3
        group.repeatCount = .infinity
        group.autoreverses = true
        group.animations = [animationX, animationY, animationRotate]
        
        
        uiView.layer.add(group, forKey: nil)
        
    }
    
}
