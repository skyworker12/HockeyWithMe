//
//  UiViewExtansion.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 14/03/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func animShow(){
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func animHide(){
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()
                        
        },  completion: {(_ completed: Bool) -> Void in
            self.removeFromSuperview()
        })
    }
    
    func shake(){
        let propertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.3, animations: {
            self.layer.borderColor = UIColor.red.cgColor
            self.layer.borderWidth = 1
            self.transform = CGAffineTransform(translationX: 10, y: 0)
        })
        
        propertyAnimator.addAnimations({
            self.transform = CGAffineTransform(translationX: 0, y: 0)
        }, delayFactor: 0.2)
        
        propertyAnimator.addCompletion { (_) in
            self.layer.borderWidth = 0
        }
        
        propertyAnimator.startAnimation()
    }
    
}
