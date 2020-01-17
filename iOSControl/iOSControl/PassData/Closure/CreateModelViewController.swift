//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Taof on 4/20/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class CreateModelViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var feelTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var passObject: ((Post) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Create Model"
        setup()
    }
    
    func setup(){
        feelTextView.layer.cornerRadius = 6.0
        saveButton.layer.cornerRadius = 6.0
    }
    
    @IBAction func savePressAction(_ sender: UIButton) {
        
        passObject?(Post(title: titleTextField.text!, feel: feelTextView.text!))
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("CreateViewController deinit")
    }
    
}
