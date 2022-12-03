//
//  LegalView.swift
//  MintProject
//
//  Created by mac on 03/12/2022.
//

import UIKit

class LegalView: UIView {

    private var titlelabel = UILabel().manualLayoutable()
    private var imageView = UIImageView().manualLayoutable()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setupHierarchy()
        setUpAutoLayout()
    }
    
    convenience init(title: String,image: String) {
        self.init(frame: .zero)
        imageView.image = image == "" ? UIImage() : UIImage(systemName: image)
        titlelabel.text = title

    }
    
    private func setUpProperties() {
        
        self.apply {
            $0.isUserInteractionEnabled = true
        }
        
        imageView.apply {
            $0.contentMode = .scaleAspectFit
        }
        
        titlelabel.apply {
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.adjustsFontSizeToFitWidth = true
        }
        
    }
    
    private func setupHierarchy() {
        
        addSubview(titlelabel)
        addSubview(imageView)
        
    }
    
    private func setUpAutoLayout() {
        
        self.apply {
//            $0.widthAnchor.constraint(equalToConstant: SCREEN_WIDTH).activate()
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
        }
        
        
        
        titlelabel.apply {
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        }

        
        imageView.apply {
            $0.tintImage(color: .black)
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).activate()
            $0.heightAnchor.constraint(equalToConstant: 24).activate()
            $0.widthAnchor.constraint(equalToConstant: 24).activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
