//
//  NSObjectExt.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import Foundation

protocol HasApply { }

extension HasApply {

    @discardableResult
    func apply(closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }

}

extension NSObject: HasApply { }

extension NSObjectProtocol {
    
    static var name: String {
        return String(describing: self)
    }
    
}
