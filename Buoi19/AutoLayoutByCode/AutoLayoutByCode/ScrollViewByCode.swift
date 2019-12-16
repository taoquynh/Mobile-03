//
//  ScrollViewByCode.swift
//  AutoLayoutByCode
//
//  Created by Taof on 12/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ScrollViewByCode: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .green
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .red
        return contentView
    }()
    
    let textField1: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "TextField1"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    let textField2: UITextField = {
           let textField = UITextField()
           textField.translatesAutoresizingMaskIntoConstraints = false
           textField.placeholder = "TextField2"
           textField.borderStyle = .roundedRect
           return textField
       }()
    
    let textField3: UITextField = {
           let textField = UITextField()
           textField.translatesAutoresizingMaskIntoConstraints = false
           textField.placeholder = "TextField3"
           textField.borderStyle = .roundedRect
           return textField
       }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.setTitle("Go", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textField1)
        contentView.addSubview(textField2)
        contentView.addSubview(textField3)
        contentView.addSubview(button)
        setLayout()
        
        // thêm action cho button
        button.addTarget(self, action: #selector(goTo), for: .touchUpInside)
    }
    
    @objc func goTo(){
        let secondVC = SecondViewController()
        secondVC.title = "Màn 2"
        let navigation = UINavigationController(rootViewController: secondVC)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
        
    }
    
    func setLayout(){
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        
        textField1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 64).isActive = true
        textField1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 64).isActive = true
        textField1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -64).isActive = true
        textField1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 300).isActive = true
        textField2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64).isActive = true
        textField2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64).isActive = true
        textField2.heightAnchor.constraint(equalToConstant: 40).isActive = true

        textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 600).isActive = true
        textField3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64).isActive = true
        textField3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64).isActive = true
        textField3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        button.topAnchor.constraint(equalTo: textField3.bottomAnchor, constant: 600).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100).isActive = true
        
    }
}
