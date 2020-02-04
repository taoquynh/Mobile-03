//
//  ViewController.swift
//  DemoKeyboard
//
//  Created by Quynh on 2/4/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "img_bg_doimatkhau"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let oldTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.background = UIImage(named: "login_pass")
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 56))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Mật khẩu cũ"
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    private let firstTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.background = UIImage(named: "login_pass")
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 56))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Mật khẩu mới"
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    private let secondTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.background = UIImage(named: "login_pass")
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 56))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Nhập lại mật khẩu"
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupTextField()
    }
    
    func setupLayout(){
        view.backgroundColor = UIColor.white
        view.addSubview(backgroundImageView)
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        // Scrollview
        let scrollView = TPKeyboardAvoidingScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *){
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        }else{
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0).isActive = true
        }
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // ContainerView
        let containerView = UIView()
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20.0).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        // Phone, password, button
        containerView.addSubview(oldTextField)
        containerView.addSubview(firstTextField)
        containerView.addSubview(secondTextField)
        
        oldTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        oldTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        oldTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 128).isActive = true
        oldTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        firstTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        firstTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        firstTextField.topAnchor.constraint(equalTo: oldTextField.bottomAnchor, constant: 128).isActive = true
        firstTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        secondTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        secondTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        secondTextField.topAnchor.constraint(equalTo: firstTextField.bottomAnchor, constant: 128).isActive = true
        secondTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
    }
    
    func setupTextField(){
        let toolBar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.setItems([cancelButton, flexSpace, doneButton], animated: true)
        toolBar.sizeToFit()
        
        oldTextField.inputAccessoryView = toolBar
        firstTextField.inputAccessoryView = toolBar
        secondTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonAction(){
        self.view.endEditing(true)
    }
}

