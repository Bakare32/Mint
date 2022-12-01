//
//  MainCordinator.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

class MainCoordinator: Coordinator {
   
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func popController(animated: Bool? = true) {
        navigationController.popViewController(animated: animated!)
    }
    
    func start() {
        let vc = LoginViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}


