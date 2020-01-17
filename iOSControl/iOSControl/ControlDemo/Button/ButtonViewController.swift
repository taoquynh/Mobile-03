//
//  ButtonViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 3/25/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    
    @IBOutlet weak var thirdView: UIView!
    
    let searchButton: UIButton = {
    
        let button = UIButton(type: .custom)
        // set = false de layout bang code
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.setTitle("Searching", for: .highlighted)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
    
        return button
    }()
    
    let nextButton: UIButton = {
        
        let button = UIButton(type: .custom)
        // set = false de layout bang code
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
//        button.setTitle("Searching", for: .highlighted)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
		
//		// set image
//		if let nextImage = UIImage(named: "next") {
//			button.setImage(nextImage, for: .normal )
//		}
		
		button.setImage(UIImage(named: "next"), for: .normal )
		
		button.semanticContentAttribute = UIApplication.shared
			.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
		
		button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }()
    
    let previousButton: UIButton = {
        
        let button = UIButton(type: .custom)
        // set = false de layout bang code
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
//        button.setTitle("Searching", for: .highlighted)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
		
		button.setImage(UIImage(named: "previous"), for: .normal)
		
		button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
    }()
	
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "Button"
        navigationItem.title = "Button"
        
        setupButton()
    }
    
    func setupButton() {
        
        // searchButton
        thirdView.addSubview(searchButton)
        searchButton.topAnchor.constraint(equalTo: thirdView.topAnchor, constant: 16).isActive = true
        searchButton.leftAnchor.constraint(equalTo: thirdView.leftAnchor, constant: 16).isActive = true
        searchButton.rightAnchor.constraint(equalTo: thirdView.rightAnchor, constant: -16).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        searchButton.addTarget(self, action: #selector(searchPress), for: .touchUpInside)
        
        
        // nextButton
        thirdView.addSubview(nextButton)
        thirdView.addSubview(previousButton)
        
        // previousButton
        previousButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 8).isActive = true
        previousButton.leftAnchor.constraint(equalTo: thirdView.leftAnchor, constant: 16).isActive = true
//        previousButton.rightAnchor.constraint(equalTo: thirdView.rightAnchor, constant: -16).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        previousButton.widthAnchor.constraint(equalTo: nextButton.widthAnchor).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 8).isActive = true
        nextButton.leftAnchor.constraint(equalTo: previousButton.rightAnchor, constant: 8).isActive = true
        nextButton.rightAnchor.constraint(equalTo: thirdView.rightAnchor, constant: -16).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true

        previousButton.addTarget(self, action: #selector(searchPress), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(searchPress), for: .touchUpInside)
    }
    
//    @IBAction func
    @objc func searchPress() {
        print("searchPress")
    }
    
    @IBAction func signInDidPress(_ sender: UIButton) {
        
        print("Sign In")
    }
    

}
