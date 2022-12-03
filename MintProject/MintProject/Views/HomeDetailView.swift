//
//  HomeDetailView.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

var SCREEN_WIDTH = 0.0

class HomeDetailView: UIView {
    
    let firstStackView = UIStackView().manualLayoutable()
    let insuranceView = UIView().manualLayoutable()
    let insuranceLabel = UILabel().manualLayoutable()
    let insuranceContainerView = DetailView(title: "Insurance").manualLayoutable()
    let accountView = UIView().manualLayoutable()
    let accountContainerView = DetailView(title: "Open an Account").manualLayoutable()
    let secondStackView = UIStackView().manualLayoutable()
    let cacView = UIView().manualLayoutable()
    let cacContainerView = DetailView(title: "CAC Business Registration").manualLayoutable()
    let contactView = UIView().manualLayoutable()
    let contactContainerView = DetailView(title: "Contact Support").manualLayoutable()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setupHeirarchy()
        setUpAutoLayout()
    }
    
    func setUpProperties() {
        self.apply {
            $0.viewBackgroundWhite()
        }
        
        firstStackView.apply {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .fill
            $0.spacing = 10
        }
        
        insuranceView.apply {
            $0.backgroundColor = LIGHT_VIEW_COLOR
            $0.layer.cornerRadius = 10.0
            $0.heightAnchor.constraint(equalToConstant: 70).activate()
        }
        

        accountView.apply {
            $0.backgroundColor = LIGHT_VIEW_COLOR
            $0.layer.cornerRadius = 10.0
            $0.heightAnchor.constraint(equalToConstant: 70).activate()
        }
        
        secondStackView.apply {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .fill
            $0.spacing = 10
        }
        
        cacView.apply {
            $0.backgroundColor = LIGHT_VIEW_COLOR
            $0.layer.cornerRadius = 10.0
            $0.heightAnchor.constraint(equalToConstant: 70).activate()
        }
        
        contactView.apply {
            $0.backgroundColor = LIGHT_VIEW_COLOR
            $0.layer.cornerRadius = 10.0
            $0.heightAnchor.constraint(equalToConstant: 70).activate()
        }
    }
    
    func setupHeirarchy() {
        addSubview(firstStackView)
        firstStackView.addArrangedSubview(insuranceView)
        firstStackView.addArrangedSubview(accountView)
        addSubview(secondStackView)
        secondStackView.addArrangedSubview(cacView)
        secondStackView.addArrangedSubview(contactView)
        
        insuranceView.addSubview(insuranceContainerView)
        accountView.addSubview(accountContainerView)
        cacView.addSubview(cacContainerView)
       
        contactView.addSubview(contactContainerView)
    }
    
    func setUpAutoLayout() {
        
        firstStackView.apply {
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 0).activate()
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).activate()
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).activate()
            $0.heightAnchor.constraint(equalToConstant: 70).activate()
        }
        
        secondStackView.apply {
            $0.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 10).activate()
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).activate()
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).activate()
            $0.heightAnchor.constraint(equalToConstant: 70).activate()
        }
        
        insuranceContainerView.apply {
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
            $0.centerXAnchor.constraint(equalTo: insuranceView.centerXAnchor).activate()
            $0.centerYAnchor.constraint(equalTo: insuranceView.centerYAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: insuranceView.leadingAnchor, constant: 20).activate()
            $0.trailingAnchor.constraint(equalTo: insuranceView.trailingAnchor, constant: -20).activate()
        }
        accountContainerView.apply {
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
            $0.centerXAnchor.constraint(equalTo: accountView.centerXAnchor).activate()
            $0.centerYAnchor.constraint(equalTo: accountView.centerYAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: accountView.leadingAnchor, constant: 20).activate()
            $0.trailingAnchor.constraint(equalTo: accountView.trailingAnchor, constant: -20).activate()
        }
        
        cacContainerView.apply {
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
            $0.centerXAnchor.constraint(equalTo: cacView.centerXAnchor).activate()
            $0.centerYAnchor.constraint(equalTo: cacView.centerYAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: cacView.leadingAnchor, constant: 20).activate()
            $0.trailingAnchor.constraint(equalTo: cacView.trailingAnchor, constant: -20).activate()
        }

        contactContainerView.apply {
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
            $0.centerXAnchor.constraint(equalTo: contactView.centerXAnchor).activate()
            $0.centerYAnchor.constraint(equalTo: contactView.centerYAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: contactView.leadingAnchor, constant: 20).activate()
            $0.trailingAnchor.constraint(equalTo: contactView.trailingAnchor, constant: -20).activate()
        }

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
