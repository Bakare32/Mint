//
//  LegalVC.swift
//  MintProject
//
//  Created by mac on 03/12/2022.
//

import UIKit

class LegalVC: UIViewController {
    
    // MARK: - Properties
    var coordinator: MainCoordinator?
    private var dashNavigationBar = UIView().manualLayoutable()
    private let btnBack = UIButton().manualLayoutable()
    private let stkContents = UIStackView().manualLayoutable()
    private let contentsScrollView = UIScrollView().manualLayoutable()
    let mintAccountView = LegalView(title: "Mintyn Account - Terms & Conditions", image: "rectangle.portrait.and.arrow.forward").manualLayoutable()
    let policyView = LegalView(title: "Mintyn Privacy Policy", image: "rectangle.portrait.and.arrow.forward").manualLayoutable()
    let goalView = LegalView(title: "Saving Goal - Terms & Conditions", image: "rectangle.portrait.and.arrow.forward").manualLayoutable()

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
        
        dashNavigationBar = DashNavigationBar(title: "Legal", leftBtns: [], rightBtns: [])
        dashNavigationBar.manualLayoutable()
        
        if let blurView = dashNavigationBar.subviews.first(where: { $0 is UIVisualEffectView }) as? UIVisualEffectView {
            UIView.animate(withDuration: 0.2) {
                blurView.alpha = 1
            }
        }
        
        btnBack.apply {
            $0.closeButtonImage()
            $0.addTarget(self, action: #selector(btnDismissTapped), for: .touchUpInside)
        }
        
        contentsScrollView.apply {
            $0.contentInset = UIEdgeInsets(top: TOP_SAFEAREA_HEIGHT + 30, left: 0, bottom: BOTTOM_SAFEAREA_HEIGHT + 30, right: 0)
            $0.showsVerticalScrollIndicator = false
            $0.bouncesZoom = false
        }
        
        stkContents.apply {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 20
        }
        
        mintAccountView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
        }
        
        policyView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
        }
        
        goalView.apply {
            $0.backgroundColor = .clear
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
        }
    }
    
    private func setupHierarchy() {
        
        view.addSubview(dashNavigationBar)
        
        
        
        view.addSubview(contentsScrollView)
        
        contentsScrollView.addSubview(stkContents)
        
        stkContents.addArrangedSubview(mintAccountView)
        stkContents.addArrangedSubview(policyView)
        stkContents.addArrangedSubview(goalView)
        
        view.bringSubviewToFront(dashNavigationBar)
    }
    
    private func setUpAutoLayout() {
        
        dashNavigationBar.apply {
            $0.topAnchor.constraint(equalTo: view.topAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
            $0.heightAnchor.constraint(equalToConstant: TOP_SAFEAREA_HEIGHT + 50).activate()
        }
        
        contentsScrollView.apply {
            $0.topAnchor.constraint(equalTo: dashNavigationBar.bottomAnchor, constant: 10).activate()
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
    
    
    // MARK: - Handlers
    
    @objc func btnDismissTapped() {
        debugPrint("yess")
    }

}


extension UIButton {
    
    func addBtnImage(image: UIImage?, dimensions: CGFloat) {
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView?.widthAnchor.constraint(equalToConstant: dimensions).isActive = true
        imageView?.heightAnchor.constraint(equalToConstant: dimensions).isActive = true
    }
    
    func closeButtonImage() {
        addBtnImage(image: UIImage(systemName: "arrowshape.backward.fill"), dimensions: 24)
    }
    
}
