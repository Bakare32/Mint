//
//  UITextFieldExt.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

private var __maxLengths = [UITextField: Int]()
extension UITextField {
    
   
    
    func setPadding(padding: Int) {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func horizontalMargin(padding: Int) {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    


}


extension UITextField {
    
    enum Direction {
        case Left
        case Right
    }
    
    // add image to textfield
    func withImage(direction: Direction, image: UIImage, topSpace: CGFloat){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 45))
        mainView.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 45))
        view.backgroundColor = TRANSPARENT
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = CGFloat(0.5)
        view.layer.borderColor = TRANSPARENT.cgColor
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: topSpace, width: 17.0, height: 17.0)
        view.addSubview(imageView)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = TRANSPARENT
        mainView.addSubview(seperatorView)
        
        if(Direction.Left == direction){ // image left
            seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
            self.rightViewMode = .always
            self.rightView = mainView
        }
        
        self.layer.borderColor = TRANSPARENT.cgColor
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 5
    }
    
}


