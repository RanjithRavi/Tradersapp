//
//  CustomLoaderView.swift
//  Loader
//
//  Created by Ranjith Ravichandran on 07/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CustomLoaderView: NSObject {
    
    private static let tagForWindowLabel: Int = 231233
    private static let tagForWindowLabelBGView: Int = 123312
    
    static var loadIconDictionary:[UIView: NVActivityIndicatorView] = [:]
    
    static func addLoadIcon(_ view:UIView) -> Void {
        view.isUserInteractionEnabled = false
        
        if let activityIndicatorView = CustomLoaderView.loadIconDictionary[view] {
            view.bringSubview(toFront: activityIndicatorView)
            return
        } else {
            let height:CGFloat = 90.0
            let Width:CGFloat = 90.0
            let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 50, y: 50, width: Width, height: height),
                                                                type: .ballSpinFadeLoader)
            activityIndicatorView.padding = 10
            activityIndicatorView.layer.cornerRadius = 5
            //activityIndicatorView.layer.borderColor = UIColor.init(white: 0.27, alpha: 0.7).cgColor
            //activityIndicatorView.layer.borderWidth = 2
            activityIndicatorView.layer.masksToBounds = true
            activityIndicatorView.backgroundColor = UIColor.black
            view.addSubview(activityIndicatorView)
            view.bringSubview(toFront: activityIndicatorView)
            activityIndicatorView.startAnimating()
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            activityIndicatorView.alpha = 0
            
            var constraintArray:[NSLayoutConstraint] = []
            
            constraintArray.append(view.centerXAnchor.constraint(equalTo: activityIndicatorView.centerXAnchor))
            constraintArray.append(view.centerYAnchor.constraint(equalTo: activityIndicatorView.centerYAnchor))
            constraintArray.append(activityIndicatorView.heightAnchor.constraint(equalToConstant: height))
            constraintArray.append(activityIndicatorView.widthAnchor.constraint(equalToConstant: Width))
            
            NSLayoutConstraint.activate(constraintArray)
            
            CustomLoaderView.loadIconDictionary[view] = activityIndicatorView
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                
                UIView.defaultAnimation({
                    activityIndicatorView.alpha = 1.0
                }, duration: 0.25)
            }
        }
    }
    
    static func removeLoadIcon(_ view:UIView) -> Void {
        view.isUserInteractionEnabled = true
        
        if let activityIndicatorView = CustomLoaderView.loadIconDictionary[view] {
            UIView.defaultAnimation({
                activityIndicatorView.alpha = 0.0
            }, duration: 0.25, completionWithAnimation: true, completion: {
                activityIndicatorView.removeFromSuperview()
                activityIndicatorView.stopAnimating()
                CustomLoaderView.loadIconDictionary[view] = nil
            })
        }
    }
    
    static func bluetoothLoader(_ text: String) -> Void {
        let window = UIDevice.window()
        
        if let haveView: UIView = window.viewWithTag(tagForWindowLabelBGView) {
            var nilSuperView: Bool = false
            
            if haveView.superview == nil {
                window.addSubview(haveView)
                nilSuperView = true
            }
            if let haveLabel: UILabel = haveView.viewWithTag(tagForWindowLabel) as? UILabel {
                if nilSuperView {
                    updateConstraintsForBLELabel(haveLabel, bgView: haveView)
                }
                
                haveLabel.text = text
                
                UIView.defaultAnimation({
                    haveLabel.layoutIfNeeded()
                    haveView.layoutIfNeeded()
                })
            }
        } else {
            let labelBGView: UIView = UIView.initView(BGColor: .gray, tag: tagForWindowLabelBGView)
            let windowLabel: UILabel = UILabel.initLabel(BGColor: .clear, tag: tagForWindowLabel, text: text, textColor: .white, font: UIFont.boldSystemFont(ofSize: 16))
            windowLabel.numberOfLines = 0
            windowLabel.textAlignment = .center
            labelBGView.layer.cornerRadius = 16.0
            labelBGView.layer.masksToBounds = true
            labelBGView.alpha = 0.9
            
            window.addSubview(labelBGView)
            labelBGView.addSubview(windowLabel)
            
            updateConstraintsForBLELabel(windowLabel, bgView: labelBGView)
        }
    }
    
    private static func updateConstraintsForBLELabel(_ windowLabel: UILabel, bgView: UIView) -> Void {
        let window = UIDevice.window()
        let viewDict: [String: UIView] = ["windowLabel": windowLabel, "bgView": bgView]
        let metricDict: [String: CGFloat] = ["doublePadding": 16]
        var constraintsArray: [NSLayoutConstraint] = []
        
        constraintsArray.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(doublePadding)-[windowLabel]-(doublePadding)-|", options: [], metrics: metricDict, views: viewDict))
        constraintsArray.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-(doublePadding)-[windowLabel]-(doublePadding)-|", options: [], metrics: metricDict, views: viewDict))
        constraintsArray.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=doublePadding)-[bgView]-(>=doublePadding)-|", options: [], metrics: metricDict, views: viewDict))
        constraintsArray.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[bgView(>=40)]", options: [], metrics: metricDict, views: viewDict))
        if #available(iOS 11.0, *) {
            constraintsArray.append(bgView.centerXAnchor.constraintEqualToSystemSpacingAfter(window.centerXAnchor, multiplier: 1.0))
        } else {
            // Fallback on earlier versions
            constraintsArray.append(bgView.centerXAnchor.constraint(equalTo: window.centerXAnchor))
        }
        
        let bottomConstatint = bgView.bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: 150)
        
        constraintsArray.append(bottomConstatint)
        
        NSLayoutConstraint.activate(constraintsArray)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            bottomConstatint.constant = -150
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 18, options: UIViewAnimationOptions.init(rawValue: 0), animations: {
                window.layoutIfNeeded()
            }, completion: { (completed) in
            })
        }
    }
    
    static func removeBluetoothLoader() -> Void {
        if let haveView: UIView = UIDevice.window().viewWithTag(tagForWindowLabelBGView) {
            UIView.defaultAnimation({
                haveView.alpha = 0
            }, completionWithAnimation: true, completion: {
                haveView.removeFromSuperview()
                
                haveView.alpha = 1
            })
        }
    }
}
