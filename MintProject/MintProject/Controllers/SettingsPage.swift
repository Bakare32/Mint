//
//  SettingsPage.swift
//  MintProject
//
//  Created by mac on 03/12/2022.
//

import UIKit

class SettingsPage: UIViewController {
    
    // MARK: - Properties
    var coordinator: MainCoordinator?


    private let lblTitle = UILabel().manualLayoutable()
    private let stkContents = UIStackView().manualLayoutable()
    private let contentsScrollView = UIScrollView().manualLayoutable()
    
    private let profileView = ClickableView(title: "Profile", image: "person", btnStatus: "").manualLayoutable()
    private let informationView = ClickableView(title: "Personal Information", image: "person", btnStatus: "").manualLayoutable()
    private let employmentView = ClickableView(title: "Employment Information", image: "person", btnStatus: "").manualLayoutable()
    private let identificationView =  ClickableView(title: "Identification Information", image: "person", btnStatus: "").manualLayoutable()
    private let nextOfView = ClickableView(title: "Next of kin", image: "person", btnStatus: "").manualLayoutable()
    private let accountView =  ClickableView(title: "Account Management", image: "person", btnStatus: "").manualLayoutable()
    private let referralsView =  ClickableView(title: "Referrals", image: "person", btnStatus: "").manualLayoutable()
    private let legalView =  ClickableView(title: "Legal", image: "person", btnStatus: "").manualLayoutable()
    private let helpsView =  ClickableView(title: "Help and Support", image: "person", btnStatus: "").manualLayoutable()
    private let systemView =  ClickableView(title: "System", image: "person", btnStatus: "").manualLayoutable()
    private let bussinessView =  ClickableView(title: "Create Business Account", image: "person", btnStatus: "").manualLayoutable()
    private let logoutView = ClickableView(title: "Logout", image: "person", btnStatus: "").manualLayoutable()
    
    let freeView = UIView().manualLayoutable()

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
    
    private func setUpProperties() {
        
        lblTitle.apply {
            $0.text = "Settings"
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textColor = PRIMARY_TEXT_COLOR
        }
        
        contentsScrollView.apply {
            $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: BOTTOM_SAFEAREA_HEIGHT + 30, right: 0)
            $0.showsVerticalScrollIndicator = false
            $0.bouncesZoom = false
            $0.delegate = self
        }
        
        stkContents.apply {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 20
        }
        
        profileView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 1
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        informationView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 2
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        employmentView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 3
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        identificationView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 4
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        nextOfView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 5
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        accountView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 6
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        referralsView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 7
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        legalView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 8
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        helpsView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 9
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        systemView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 10
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        bussinessView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 11
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        logoutView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
            $0.tag = 12
            let profileTap = UITapGestureRecognizer(target: self, action: #selector(menuSelected(_:)))
            profileTap.accessibilityHint = "\($0.tag)"
            $0.addGestureRecognizer(profileTap)
        }
        
        freeView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 50).activate()
        }
        
    }
    
    private func setupHierarchy() {
        
        view.addSubview(lblTitle)
        
        view.addSubview(contentsScrollView)
        
        contentsScrollView.addSubview(stkContents)
        
        stkContents.addArrangedSubview(profileView)
        stkContents.addArrangedSubview(informationView)
        stkContents.addArrangedSubview(employmentView)
        stkContents.addArrangedSubview(identificationView)
        stkContents.addArrangedSubview(nextOfView)
        stkContents.addArrangedSubview(accountView)
        stkContents.addArrangedSubview(referralsView)
        stkContents.addArrangedSubview(legalView)
        stkContents.addArrangedSubview(helpsView)
        stkContents.addArrangedSubview(systemView)
        stkContents.addArrangedSubview(bussinessView)
        stkContents.addArrangedSubview(logoutView)
        stkContents.addArrangedSubview(freeView)
    }
    
    private func setUpAutoLayout() {
        
        lblTitle.apply {
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).activate()
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
//            $0.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -30).activate()
        }
        
        contentsScrollView.apply {
            $0.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 0).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        }
        
        stkContents.apply {
            $0.topAnchor.constraint(equalTo: contentsScrollView.topAnchor).activate()
            $0.bottomAnchor.constraint(equalTo: contentsScrollView.bottomAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: contentsScrollView.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: contentsScrollView.trailingAnchor).activate()
            $0.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor).activate()
        }
        
    }
    
   
    
    @objc func menuSelected(_ sender: UITapGestureRecognizer) {
        switch sender.accessibilityHint {
        case "1":
            debugPrint("profile")
        case "2":
            debugPrint("personal")
        case "3":
            debugPrint("employmen")
        case "4":
            debugPrint("ident")
        case "5":
            debugPrint("next")
        case "6":
            debugPrint("acount")
        case "7":
            debugPrint("refralls")
        case "8":
            debugPrint("legal")
            coordinator?.openLegalVC()
        case "9":
            debugPrint("help")
            
        case "10":
            debugPrint("system")
            
        case "11":
            debugPrint("bussines")
            
        case "12":
            debugPrint("logout")
        default:
            return
        }
    }

}


extension SettingsPage: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}
