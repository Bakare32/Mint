//
//  NSLayoutExt.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

extension NSLayoutConstraint {
    
    @discardableResult
    func activate() -> Self {
        isActive = true
        return self
    }
    
    @discardableResult
    func withMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self.firstItem as Any,
            attribute: self.firstAttribute,
            relatedBy: self.relation,
            toItem: self.secondItem,
            attribute: self.secondAttribute,
            multiplier: multiplier,
            constant: self.constant
        )
    }
    
    @discardableResult
    func withPriority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}

