//
//  UIImageViewExt.swift
//  MintProject
//
//  Created by mac on 03/12/2022.
//

import UIKit

extension UIImageView {
    
    func rounded() {
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
    
    //Change image view color
    func tintImage(color: UIColor) {
        image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }
}
