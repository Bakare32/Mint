//
//  UIViewControllerExt.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit
import CoreLocation

extension UIViewController {
    
    func swipeToPop() {
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(popSwipe(_:)))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func popSwipe(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .right {
            navigationController?.popViewController(animated: true)
        }
    }
    
   
    
    func setBackgroundColor() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = WHITE_COLOR
        }
    }
    
    @objc func btnBackPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Create Blank View
    
    func createEmptySpace(height: CGFloat? = 1, width: CGFloat? = 1, backgroundColor: UIColor? = .clear) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor!
        view.widthAnchor.constraint(equalToConstant: width ?? 1).isActive = true
        view.heightAnchor.constraint(equalToConstant: height ?? 1).isActive = true
        return view
    }
    
    func setAttributes(font: UIFont) -> [NSAttributedString.Key : NSObject] {
        return [NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: font]
    }
    
 
    
 
    
}


