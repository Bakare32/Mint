//
//  LoginViewController.swift
//  MintProject
//
//  Created by mac on 02/12/2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: - Properties
    var coordinator: MainCoordinator?
    let lblTitle = UILabel().manualLayoutable()
    let detailView = HomeDetailView().manualLayoutable()
    let loginView = UIView().manualLayoutable()
    let phoneNumberStackView = UIStackView().manualLayoutable()
    let phoneLabel = UILabel().manualLayoutable()
    private let phoneNoView = UIView().manualLayoutable()
    let lblCountryCode = UILabel().manualLayoutable()
    let txtPhoneNumber = UITextField().manualLayoutable()
    let passwordStackView = UIStackView().manualLayoutable()
    let passwordLabel = UILabel().manualLayoutable()
    private let passwordView = UIView().manualLayoutable()
    let txtPassword = UITextField().manualLayoutable()
    let imageIcon = UIImageView().manualLayoutable()
    let contentView = UIView().manualLayoutable()
    let rememberView = UIView().manualLayoutable()
    let box = UIView().manualLayoutable()
    let rememberLabel = UILabel().manualLayoutable()
    let forgotPassword = UIButton().manualLayoutable()
    let login = UIButton().manualLayoutable()
    
    
    var isclick = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addDoneButtonOnKeyboard()
    }

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
            $0.viewBackgroundWhite()
        }
        
        loginView.apply {
            $0.backgroundColor = LIGHT_VIEW_COLOR
            $0.setColorShadow(radius: 12, opacity: 0.5)
        }
        
        phoneNumberStackView.apply {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .fill
            $0.spacing = 4
        }
        
        phoneLabel.apply {
            $0.text = "Phone Number"
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.font = UIFont.systemFont(ofSize: 16)
        }
        
        phoneNoView.apply {
            $0.layer.cornerRadius = 13

            $0.backgroundColor = LIGHT_VIEW_COLOR
        }
        
        lblCountryCode.apply {
            var code = "+234"
            $0.text = code
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.textAlignment = .right
        }

        txtPhoneNumber.apply {
            $0.font = UIFont.systemFont(ofSize: 12)
//            $0.tintColor = PRIMARY_COLOR
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.keyboardType = .numberPad
            $0.placeholder = "8021234567"
        }
        
        passwordStackView.apply {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .fill
            $0.spacing = 4
        }
        
        passwordLabel.apply {
            $0.text = "Password"
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.font = UIFont.systemFont(ofSize: 16)
        }
        
        passwordView.apply {
            $0.layer.cornerRadius = 13

            $0.backgroundColor = LIGHT_VIEW_COLOR
        }
        
        txtPassword.apply {
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.backgroundColor = LIGHT_VIEW_COLOR
            $0.layer.cornerRadius = 13.0
            $0.setPadding(padding: 12)
            $0.delegate = self
            
        }

        
        imageIcon.apply {
            let tapGestureRecongizer = UITapGestureRecognizer(target: self, action:#selector(imageTapped(tapGestureRecognizer:)))
            $0.image = UIImage(systemName: "eye")
            $0.isUserInteractionEnabled = true
            
            $0.addGestureRecognizer(tapGestureRecongizer)
        }
        
        rememberView.apply {
            $0.backgroundColor = .clear
        }
        
        box.apply {
            $0.backgroundColor = .clear
            $0.layer.borderWidth = 2.0
            $0.layer.borderColor = WHITE_COLOR.cgColor
        }
        
        rememberLabel.apply {
            $0.text = "Remember me"
            $0.textColor = LABEL_COLOR
            $0.font = UIFont.systemFont(ofSize: 14)
        }
        
        forgotPassword.apply {
            $0.setTitle("Forgot password?", for: .normal)
            $0.setTitleColor(GOLD, for: .normal)
            $0.titleLabel?.font =  UIFont.systemFont(ofSize: 14)
        }
        
        login.apply {
            $0.setTitle("Log in", for: .normal)
            $0.setTitleColor(PRIMARY_TEXT_COLOR, for: .normal)
            $0.titleLabel?.font =  UIFont.systemFont(ofSize: 16)
            $0.backgroundColor = GOLD
            $0.layer.cornerRadius = 13
            $0.addTarget(self, action:#selector(loginTapped) , for: .touchUpInside)
        }
    }
    
    @objc func loginTapped() {
        debugPrint("yess")
//        coordinator?.openHomeVC()
        self.coordinator?.openDashboard(page: 0)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        debugPrint("yess")
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if isclick {
            isclick = false
            tappedImage.image = UIImage(systemName: "eye.slash")
            txtPassword.isSecureTextEntry = false
        } else {
            isclick = true
            tappedImage.image = UIImage(systemName: "eye")
            txtPassword.isSecureTextEntry = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupHierarchy() {
        view.addSubview(lblTitle)
        view.addSubview(detailView)
        view.addSubview(loginView)
        loginView.addSubview(phoneNumberStackView)
        phoneNumberStackView.addArrangedSubview(phoneLabel)
        phoneNumberStackView.addArrangedSubview(phoneNoView)
        phoneNoView.addSubview(lblCountryCode)
        phoneNoView.addSubview(txtPhoneNumber)
        loginView.addSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordView)
        passwordView.addSubview(txtPassword)
        passwordView.addSubview(imageIcon)
//        contentView.addSubview(imageIcon)
        
        loginView.addSubview(rememberView)
        
        rememberView.addSubview(box)
        rememberView.addSubview(rememberLabel)
        rememberView.addSubview(forgotPassword)
        
        loginView.addSubview(login)
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
            $0.heightAnchor.constraint(equalToConstant: 150).activate()
        }
        
        loginView.apply {
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).activate()
            $0.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: 80).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).activate()
        }
        
        phoneNumberStackView.apply {
            $0.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20).activate()
            $0.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20).activate()
            $0.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 80).activate()
        }
        
        phoneNoView.apply {
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
        }
        
        lblCountryCode.apply {
            $0.centerYAnchor.constraint(equalTo: phoneNoView.centerYAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: phoneNoView.leadingAnchor, constant: 12).activate()
            $0.widthAnchor.constraint(equalToConstant: 50).activate()
        }

        txtPhoneNumber.apply {
            $0.centerYAnchor.constraint(equalTo: phoneNoView.centerYAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: lblCountryCode.trailingAnchor, constant: 5).activate()
            $0.trailingAnchor.constraint(equalTo: phoneNoView.trailingAnchor, constant: -12).activate()
        }
        
        passwordStackView.apply {
            $0.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20).activate()
            $0.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20).activate()
            $0.topAnchor.constraint(equalTo: phoneNumberStackView.bottomAnchor, constant: 30).activate()
        }
        
        passwordView.apply {
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
        }
        
        txtPassword.apply {
            $0.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 0).activate()
            $0.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 0).activate()
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
        }
        
        imageIcon.apply {
            $0.heightAnchor.constraint(equalToConstant: 24).activate()
            $0.widthAnchor.constraint(equalToConstant: 24).activate()
            $0.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -10).activate()
            $0.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor).activate()
        }
        
        contentView.apply {
            $0.heightAnchor.constraint(equalToConstant: 24).activate()
            $0.widthAnchor.constraint(equalToConstant: 24).activate()
        }
        
        rememberView.apply {
            $0.heightAnchor.constraint(equalToConstant: 32).activate()
            $0.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20).activate()
            $0.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20).activate()
            $0.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 30).activate()
        }
        
        box.apply {
            $0.heightAnchor.constraint(equalToConstant: 24).activate()
            $0.widthAnchor.constraint(equalToConstant: 24).activate()
            $0.leadingAnchor.constraint(equalTo: rememberView.leadingAnchor, constant: 0).activate()
            $0.centerYAnchor.constraint(equalTo: rememberView.centerYAnchor, constant: 0).activate()
        }
        
        rememberLabel.apply {
            $0.leadingAnchor.constraint(equalTo: box.trailingAnchor, constant: 10).activate()
            $0.centerYAnchor.constraint(equalTo: rememberView.centerYAnchor, constant: 0).activate()
        }
        
        forgotPassword.apply {
            $0.trailingAnchor.constraint(equalTo: rememberView.trailingAnchor, constant: 0).activate()
            $0.heightAnchor.constraint(equalToConstant: 20).activate()
            $0.centerYAnchor.constraint(equalTo: rememberView.centerYAnchor, constant: 0).activate()
        }
        
        login.apply {
            $0.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20).activate()
            $0.heightAnchor.constraint(equalToConstant: 40).activate()
            $0.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20).activate()
            
            $0.topAnchor.constraint(equalTo: rememberView.bottomAnchor, constant: 30).activate()
        }
        
    }

    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 20))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.txtPhoneNumber.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.txtPhoneNumber.resignFirstResponder()
    }
    

}
