//
//  UIViewExt.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//


import UIKit

extension UIView {
    
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
