//
//  LoginViewController.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

class LoginViewController: UIViewController {

    
    // MARK: - Properties
    var coordinator: MainCoordinator?
    let lblTitle = UILabel().manualLayoutable()
    let detailView = HomeDetailView().manualLayoutable()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Visual Setup
    
    private func configureUI() {
        setBackgroundColor()
        setUpProperties()
        setupHierarchy()
        setUpAutoLayout()
    }
    
    func setUpProperties() {
        lblTitle.apply {
            $0.text = "Welcome back, Waris"
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.font = UIFont.systemFont(ofSize: 18)
        }
        
        detailView.apply {
            $0.backgroundColor = LIGHT_VIEW_COLOR
        }
    }
    
    func setupHierarchy() {
        view.addSubview(lblTitle)
        view.addSubview(detailView)
    }
    
    func setUpAutoLayout() {
        lblTitle.apply {
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).activate()
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
        }
        
        detailView.apply {
            $0.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 20).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).activate()
            $0.heightAnchor.constraint(equalToConstant: 200).activate()
        }
        
    }

    

}
