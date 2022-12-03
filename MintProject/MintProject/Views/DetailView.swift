//
//  DetailView.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

class DetailView: UIView {
    
    let lbltitle = UILabel().manualLayoutable()
    let imageView = UIImageView().manualLayoutable()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setupHeirarchy()
        setUpAutoLayout()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        lbltitle.text = title
//        detaillabel.text = detailsTitle
    }
    
    func setUpProperties() {
        
//        self.apply {
//            $0.backgroundColor = .red
//        }
        imageView.apply {
            $0.image = UIImage(systemName: "heart.fill")
        }
        
        lbltitle.apply {
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.numberOfLines = 2
            $0.font = UIFont.systemFont(ofSize: 12)
        }
    }
    
    func setupHeirarchy() {
        addSubview(imageView)
        addSubview(lbltitle)
    }
    
    func setUpAutoLayout() {
        imageView.apply {
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).activate()
            $0.heightAnchor.constraint(equalToConstant: 24).activate()
            $0.widthAnchor.constraint(equalToConstant: 24).activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).activate()
        }
        
        lbltitle.apply {
            $0.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).activate()
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5).activate()
        }
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
