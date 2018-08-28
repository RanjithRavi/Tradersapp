//
//  CustomLoaderView.swift
//  Loader
//
//  Created by Ranjith Ravichandran on 07/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

extension UIView {
    
    /*func anchorConstraint(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding : UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }*/
    
    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5) {
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: CGFloat(-translation), y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: CGFloat(translation), y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
    
    class func initView(BGColor: UIColor = UIColor.white, tag: Int? = nil) -> UIView {
        let returnView = UIView.init()
        returnView.translatesAutoresizingMaskIntoConstraints = false
        returnView.backgroundColor = BGColor
        
        if let viewTag = tag {
            returnView.tag = viewTag
        }
        return returnView
    }
    
    class func defaultAnimation(_ success: @escaping () -> Void, duration: TimeInterval = 0.3, completionWithAnimation: (Bool)? = nil, completion: (() -> Void)? = nil) -> Void {
        UIView.animate(withDuration: duration, animations: {
            success()
        }) { (isFinished) in
            guard completion != nil, let innerCompletion = completion else {
                return
            }
            guard completionWithAnimation != nil else {
                completion!()
                return
            }
            
            if completionWithAnimation == true {
                UIView.defaultAnimation(innerCompletion)
            } else {
                innerCompletion()
            }
        }
    }
}
