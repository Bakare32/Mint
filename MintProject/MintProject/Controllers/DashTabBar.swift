//
//  DashTabBar.swift
//  MintProject
//
//  Created by mac on 03/12/2022.
//

import UIKit

class DashTabBar: UIView {

    var selectedIndex: Int = 0
    
    var btnAction: (() -> Void)?
    
    private let separatorView = UIView().manualLayoutable()
    private let btnsStackView = UIStackView().manualLayoutable()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setupHeirarchy()
        setUpAutoLayout()
        setupButtons()
    }
    
    convenience init(selectedIndex: Int? = 0) {
        self.init(frame: .zero)
        self.selectedIndex = selectedIndex!
    }
    
    private func setUpProperties() {
        
        self.apply {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = $0.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            $0.addSubview(blurEffectView)
            $0.sendSubviewToBack(blurEffectView)
        }
        
        btnsStackView.apply {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .fill
            $0.spacing = 0
        }
    }
    
    private func setupHeirarchy() {
        addSubview(separatorView)
        addSubview(btnsStackView)
    }
    
    private func setUpAutoLayout() {
        separatorView.apply {
            $0.backgroundColor = LIGHT_VIEW_COLOR
            
            $0.bottomAnchor.constraint(equalTo: topAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: trailingAnchor).activate()
            $0.heightAnchor.constraint(equalToConstant: 1).activate()
        }
        btnsStackView.apply {
            $0.topAnchor.constraint(equalTo: separatorView.bottomAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: trailingAnchor).activate()
        }
    }
    
    func setupButtons() {
        
        for each in btnsStackView.arrangedSubviews {
            each.removeFromSuperview()
        }
        
        let items = ["Home","Transaction","More","Support", "Settings"] // "Pockets"
        
        for i in (0..<items.count) {
            
            let tapBtn = UITapGestureRecognizer(target: self, action: #selector(btnTapped))
            tapBtn.accessibilityHint = "\(i)"
            
            let btnView = UIView().manualLayoutable()
            let animView = UIView().manualLayoutable()
            let imgBtn = UIImageView().manualLayoutable()
            let lblBtn = UILabel().manualLayoutable()
            
            btnView.addSubview(imgBtn)
            btnView.addSubview(animView)
            btnView.addSubview(lblBtn)
            
            btnView.apply {
                $0.tag = i
                $0.backgroundColor = TRANSPARENT
                $0.isUserInteractionEnabled = true
                $0.addGestureRecognizer(tapBtn)
                
                $0.heightAnchor.constraint(equalToConstant: 56).activate()
            }
            
            animView.apply {
                $0.backgroundColor = TRANSPARENT
                $0.widthAnchor.constraint(equalToConstant: 24).activate()
                $0.heightAnchor.constraint(equalToConstant: 24).activate()
                $0.centerXAnchor.constraint(equalTo: btnView.centerXAnchor).activate()
                $0.topAnchor.constraint(equalTo: btnView.topAnchor, constant: 8).activate()
            }
            
            imgBtn.apply {
                $0.widthAnchor.constraint(equalToConstant: 24).activate()
                $0.heightAnchor.constraint(equalToConstant: 24).activate()
                $0.centerXAnchor.constraint(equalTo: btnView.centerXAnchor).activate()
                $0.topAnchor.constraint(equalTo: btnView.topAnchor, constant: 8).activate()
            }
            
            lblBtn.apply {
                $0.text = items[i]
                $0.font = UIFont.systemFont(ofSize: 10)
                $0.textAlignment = .center
                $0.numberOfLines = 1
                
                $0.centerXAnchor.constraint(equalTo: btnView.centerXAnchor).activate()
                $0.topAnchor.constraint(equalTo: imgBtn.bottomAnchor, constant: 5).activate()
                $0.leadingAnchor.constraint(equalTo: btnView.leadingAnchor, constant: 10).activate()
                $0.trailingAnchor.constraint(equalTo: btnView.trailingAnchor, constant: -10).activate()
                
            }
            
            btnsStackView.addArrangedSubview(btnView)
            
//            let animation = AnimationView(name: getIsDark() ? items[i].lowercased() + "_dark" : items[i].lowercased())
            let imageName = "\(items[i].lowercased())" + (i == selectedIndex ? "_active" : "_inactive")
//
//            let image = UIImage(named: imageName)!
            
            if i == selectedIndex {
                menuSelected(iv: imgBtn, label: lblBtn, image: UIImage(systemName: "homekit")!, animView: animView)
            } else {
                menuDeselected(iv: imgBtn, label: lblBtn, image: UIImage(systemName: "homekit")!, animView: animView)
            }
        }
        
    }
    
    func menuSelected(iv: UIImageView, label: UILabel, image: UIImage, animView: UIView) {
        iv.image = image
        iv.tintImage(color: PRIMARY_TEXT_COLOR)
        label.textColor = PRIMARY_TEXT_COLOR
        animView.backgroundColor = .red
        iv.isHidden = true
        animView.isHidden = false
//        anim.frame = CGRect(x: -5, y: -5, width: 32, height: 32)
//        animView.addSubview(anim)
//        anim.contentMode = .scaleAspectFill
//        anim.play(completion: { (finished) in
//            animView.isHidden = true
//            iv.isHidden = false
//        })
    }
    
    func menuDeselected(iv: UIImageView, label: UILabel, image: UIImage, animView: UIView) {
        iv.image = image
        iv.tintImage(color: SECONDARY_TEXT_COLOR)
        label.textColor = SECONDARY_TEXT_COLOR
//        anim.removeFromSuperview()
        animView.isHidden = true
    }
    
    func selectAction(index: Int) {
        selectedIndex = index
        setupButtons()
        btnAction?()
    }
    
    @objc func btnTapped(_ sender: UITapGestureRecognizer) {
        let index = Int(sender.accessibilityHint ?? "0") ?? 0
        selectAction(index: index)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        

}
