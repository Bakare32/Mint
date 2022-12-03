//
//  DashNavigatorBar.swift
//  MintProject
//
//  Created by mac on 03/12/2022.
//
import UIKit

var TOP_SAFEAREA_HEIGHT = 0.0

class DashNavigationBar: UIView {
    
    private var leftBtns: [UIButton] = []
    private var rightBtns: [UIButton] = []
    
    var blurEffectView = UIVisualEffectView()
    var titlelabel = UILabel().manualLayoutable()
    private var leftBtnsStk = UIStackView().manualLayoutable()
    private var rightBtnsStk = UIStackView().manualLayoutable()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setUpAutoLayout()
    }
    
    convenience init(title: String, leftBtns: [UIButton]?, rightBtns: [UIButton]?) {
        self.init(frame: .zero)
        
        for each in leftBtns ?? [] {
            self.leftBtns.append(each)
        }
        
        for each in rightBtns ?? [] {
            self.rightBtns.append(each)
        }
        
        titlelabel.text = title
        
        setupNavButtons()
    }
    
    private func setUpProperties() {
        
        addSubview(leftBtnsStk)
        addSubview(rightBtnsStk)
        addSubview(titlelabel)
        
        self.apply {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = $0.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurEffectView.alpha = 0
            $0.addSubview(blurEffectView)
            $0.sendSubviewToBack(blurEffectView)
        }
        
        leftBtnsStk.apply {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 24
        }
        
        rightBtnsStk.apply {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 24
        }
        
        titlelabel.apply {
            $0.numberOfLines = 2
            $0.font = UIFont.systemFont(ofSize: 38)
            $0.textAlignment = .center
            $0.textColor = .red
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = 0.5
        }
        
    }
    
    private func setUpAutoLayout() {
        
        leftBtnsStk.apply {
            $0.topAnchor.constraint(equalTo: topAnchor, constant: TOP_SAFEAREA_HEIGHT + 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        }
        
        rightBtnsStk.apply {
            $0.topAnchor.constraint(equalTo: topAnchor, constant: TOP_SAFEAREA_HEIGHT + 100).isActive = true
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        }
        
        titlelabel.apply {
//            $0.leadingAnchor.constraint(greaterThanOrEqualTo: leftBtnsStk.trailingAnchor, constant: 20).activate()
//            $0.trailingAnchor.constraint(greaterThanOrEqualTo: rightBtnsStk.leadingAnchor, constant: -20).activate()
            
            $0.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
            $0.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -30).activate()
        }
        
    }
    
    private func setupNavButtons() {
        
        for each in leftBtns {
            leftBtnsStk.addArrangedSubview(each)
        }
        
        for each in rightBtns {
            rightBtnsStk.addArrangedSubview(each)
        }
        
        for each in leftBtnsStk.arrangedSubviews {
            each.apply {
                $0.contentMode = .center
                $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
                $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            }
        }
        
        for each in rightBtnsStk.arrangedSubviews {
            each.apply {
                $0.contentMode = .center
                $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
                $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
