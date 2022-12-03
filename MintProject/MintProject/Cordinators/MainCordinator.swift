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
    
    func openDashboard(page: Int) {
        if let vc = navigationController.viewControllers.filter({ $0 is DashboardVC }).first {
            if let myVC = vc as? DashboardVC {
                myVC.dashTabController.selectAction(index: page)
            }
            navigationController.popToViewController(vc, animated: true)
        } else {
            let vc = DashboardVC()
            vc.coordinator = self
            vc.dashTabController.selectAction(index: page)
            navigationController.pushViewController(vc, animated: false)
        }
    }
    
    func openHomeVC() {
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openLegalVC() {
        let vc = LegalVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}


