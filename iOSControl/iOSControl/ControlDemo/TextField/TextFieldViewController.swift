//
//  TextFieldViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh  on 10/14/18.
//  Copyright © 2018 Tào Quỳnh . All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
    }
    
    func setupTextField() {
        textField.delegate = self
    }
    
}

extension TextFieldViewController: UITextFieldDelegate {
    // sự kiện khi gõ vào textfield
    // return true để gõ textfield
    // return false thì không gõ được textfield
    // giá trị truyền vào string trả về chữ cuối cùng mình gõ
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            print(updatedText)
            
            // chỉ nhập 10 kí tự
            if updatedText.count > 10 {
                return false
            }
        }
        return true
    }
}







