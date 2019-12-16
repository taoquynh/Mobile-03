//
//  ViewController.swift
//  AutoLayoutByCode
//
//  Created by Taof on 12/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // khởi tạo một uiview
    let containerView: UIView = {
        let myView = UIView()
        // để autolayout bằng code thì phải set translatesAutoresizingMaskIntoConstraints = false để nó tắt chế độ frame (không tính theo toạ độ nữa)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .green
        return myView
    }()
    
    let contentView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .red
        myView.layer.shadowOffset = CGSize(width: 20, height: 20)
        myView.layer.shadowRadius = 5
        myView.layer.shadowOffset = .zero
        myView.layer.shadowOpacity = 1
        return myView
    }()
    
    let yellowView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = #colorLiteral(red: 0.9930746068, green: 1, blue: 0.5274226357, alpha: 1)
        return myView
    }()
    
    let purpleView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = UIColor.purple
        return myView
    }()
    
    let brownView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .brown
        return myView
    }()
    
    let blueView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .blue
        return myView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(containerView)
        containerView.addSubview(contentView)
        contentView.addSubview(yellowView)
        yellowView.addSubview(purpleView)
        contentView.addSubview(brownView)
        brownView.addSubview(blueView)
        setupLayout()
    }
    
    func setupLayout(){
        // MARK: containerView
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // MARK: contentView
        contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 64).isActive = true
        contentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 64).isActive = true
        contentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -64).isActive = true
        contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -64).isActive = true
        
        // MARK: yellowView
        yellowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 64).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64).isActive = true
        // set height theo tỉ lệ
        yellowView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        
        // set height fix cứng
//        yellowView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // MARK: purpleView
        purpleView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor, constant: 0).isActive = true
        purpleView.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor, constant: 0).isActive = true
        purpleView.widthAnchor.constraint(equalTo: yellowView.widthAnchor, multiplier: 2/3).isActive = true
        purpleView.heightAnchor.constraint(equalTo: yellowView.heightAnchor, multiplier: 2/3).isActive = true
        
        
        // MARK: stackView
        brownView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 64).isActive = true
        brownView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64).isActive = true
        brownView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64).isActive = true
        brownView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -64).isActive = true
        
        let constraintBlueView = [
            blueView.topAnchor.constraint(equalTo: brownView.topAnchor, constant: 64),
            blueView.leadingAnchor.constraint(equalTo: brownView.leadingAnchor, constant: 64),
            blueView.trailingAnchor.constraint(equalTo: brownView.trailingAnchor, constant: -64),
            blueView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(constraintBlueView)
        
    }


}

