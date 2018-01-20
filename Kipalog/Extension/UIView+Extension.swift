//
//  UIView+Extension.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else {
                return nil
            }

            return UIColor(cgColor: borderColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var masksToBounds: Bool{
        get{
            return layer.masksToBounds
        }
        set{
            layer.masksToBounds = newValue
        }
    }


    @IBInspectable var shadowOffset: CGSize{
        get{
            return layer.shadowOffset
        }
        set{
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable var shadowColor: UIColor{
        get{
            return UIColor(cgColor: layer.shadowColor!)
        }
        set{
            layer.shadowColor = newValue.cgColor
        }
    }

    @IBInspectable var shadowRadius: CGFloat{
        get{
            return layer.shadowRadius
        }
        set{
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable var shadowOpacity: Float{
        get{
            return layer.shadowOpacity
        }
        set{
            layer.shadowOpacity = newValue
        }
    }

}

extension UIView {
    func pop(in duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.alpha = 0
        let damping: CGFloat  = 0.5
        let velocity: CGFloat  = 0.5
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity,
            options: .curveEaseInOut,
            animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.alpha = 1
            },
            completion: completion
        )
    }
}
