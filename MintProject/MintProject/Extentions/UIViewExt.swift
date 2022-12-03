//
//  UIViewExt.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//


import UIKit

func getIsDark() -> Bool {
    if #available(iOS 12.0, *) {
        let topController = UIApplication.topViewController()
        return topController?.traitCollection.userInterfaceStyle == .dark
    } else {
        return false
    }
}

extension UIView {
    
    func setColorShadow(radius: CGFloat, shadowRadius: CGFloat? = nil, opacity: Float, color: CGColor? = SHADOW.cgColor) {
        layer.shadowColor = color
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.cornerRadius = radius
        layer.shadowRadius = shadowRadius ?? radius
        layer.masksToBounds = false
    }
    
    func setDropShadow(radius: CGFloat, opacity: Float, color: CGColor? = DARK_SHADOW.cgColor, height: Int? = 15) {
        layer.shadowRadius = radius
        layer.cornerRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: height!)
        layer.shadowOpacity = opacity
        layer.shadowColor = color
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    
    func viewBackgroundWhite() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemBackground
        } else {
            self.backgroundColor = WHITE_COLOR
        }
    }
    
    func viewBackgroundOutlined() {
        if getIsDark() {
            self.backgroundColor = LIGHT_VIEW_COLOR
        } else {
            self.backgroundColor = WHITE_COLOR
        }
    }
    
    @discardableResult
    func manualLayoutable() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult
    func isManualLayoutEnabled(_ isOn: Bool) -> Self {
        return self.apply {
            $0.translatesAutoresizingMaskIntoConstraints = !isOn
        }
    }
}
