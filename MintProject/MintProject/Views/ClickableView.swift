//
//  ClickableView.swift
//  MintProject
//
//  Created by mac on 03/12/2022.
//

import UIKit


class ClickableView: UIView {
    
    private var imageView = UIImageView().manualLayoutable()
    private var titlelabel = UILabel().manualLayoutable()
    private var showButton = UIButton().manualLayoutable()
    
    var showConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setupHierarchy()
        setUpAutoLayout()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        showButton.setDropShadow(radius: showButton.bounds.height/2, opacity: 0.2, height: 0)
    }
    
    convenience init(title: String,image: String, btnStatus: String) {
        self.init(frame: .zero)
        imageView.image = image == "" ? UIImage() : UIImage(systemName: image)
        titlelabel.text = title
        showButton.setImage(UIImage(named: btnStatus), for: .normal)

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
        
        showButton.apply {
            $0.setTitleColor(WHITE_COLOR, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        }
        
    }
    
    private func setupHierarchy() {
        
        addSubview(titlelabel)
        addSubview(imageView)
        addSubview(showButton)
        
    }
    
    private func setUpAutoLayout() {
        
        self.apply {
//            $0.widthAnchor.constraint(equalToConstant: SCREEN_WIDTH).activate()
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
        }
        
        imageView.apply {
            $0.tintImage(color: .black)
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).activate()
            $0.heightAnchor.constraint(equalToConstant: 24).activate()
            $0.widthAnchor.constraint(equalToConstant: 24).activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        }
        
        titlelabel.apply {
            $0.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15).activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        }
        
        showButton.apply {
            showConstraint = $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
            showConstraint.activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        }
        
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
