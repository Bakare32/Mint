//
//  HomeViewController.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    // MARK: - Properties
    var coordinator: MainCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    // MARK: - Visual Setup
    
    private func configureUI() {
        setBackgroundColor()
    }
    

}
