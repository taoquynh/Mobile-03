//
//  NewItemViewController.swift
//  DemoToDoList
//
//  Created by Hoang Tung on 1/5/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit
import Photos

class NewItemViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let inputNameTextField: CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone:"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let inputPhoneTextField: CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    let selectPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Photo", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.contentHorizontalAlignment = .left
        button.layer.borderWidth = 0
        return button
    }()
    
    let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Item", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0
        return button
    }()
    
    var imagePicker: UIImagePickerController!
    
    // b1: khai báo closure
    var passData: ((User) -> Void)?
    var nameImage: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigation()
        addUIComponent()
        setupLayout()
        addBackFunctionToAddItemButton()
        
        selectPhotoButton.addTarget(self, action: #selector(onSelectPhoto), for: .touchUpInside)
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    func setupNavigation() {
        navigationItem.title = "Create Item"
    }
    
    func addUIComponent() {
        view.addSubview(nameLabel)
        view.addSubview(inputNameTextField)
        view.addSubview(phoneLabel)
        view.addSubview(inputPhoneTextField)
        view.addSubview(selectPhotoButton)
        view.addSubview(previewImageView)
        view.addSubview(addButton)
    }
    
    func setupLayout() {
        let navigationHeight = self.navigationController?.navigationBar.frame.height
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 96 + navigationHeight!).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        inputNameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor, constant: 0).isActive = true
        inputNameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16).isActive = true
        inputNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        inputNameTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 32).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        phoneLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        inputPhoneTextField.centerYAnchor.constraint(equalTo: phoneLabel.centerYAnchor, constant: 0).isActive = true
        inputPhoneTextField.leadingAnchor.constraint(equalTo: phoneLabel.trailingAnchor, constant: 16).isActive = true
        inputPhoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        inputPhoneTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        selectPhotoButton.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 32).isActive = true
        selectPhotoButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0).isActive = true
        selectPhotoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        selectPhotoButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        previewImageView.topAnchor.constraint(equalTo: selectPhotoButton.bottomAnchor, constant: 32).isActive = true
        previewImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        previewImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        previewImageView.heightAnchor.constraint(equalTo: previewImageView.widthAnchor, multiplier: 1).isActive = true
        
        addButton.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 64).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func addBackFunctionToAddItemButton() {
        addButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func back() {
        // bước 2: gọi (đăng ký) closure
        passData?(User(name: inputNameTextField.text!, phone: inputPhoneTextField.text!, image: previewImageView.image!))
        navigationController?.popViewController(animated: true)
    }
   
    @objc func onSelectPhoto(){
        let alert = UIAlertController(title: "App", message: "Chọn ảnh từ", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Máy ảnh", style: .default, handler: { (_) in
            print("Chọn ảnh từ máy ảnh")
            self.fromCamera()
        })
        let libray = UIAlertAction(title: "Thư viện", style: .default, handler: { (_) in
            print("Chọn ảnh từ thư viện")
            self.fromLibrary()
        })
        
        alert.addAction(camera)
        alert.addAction(libray)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func confirm(message: String, viewController: UIViewController?, success: @escaping () -> Void){
        let alert = UIAlertController(title: "My App", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func setting(){
        let message = "App cần truy cập máy ảnh và thư viện của bạn. Ảnh của bạn sẽ không được chia sẻ khi chưa được phép của bạn."
        confirm(message: message, viewController: self) {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.openURL(settingsUrl)
                } else {
                    UIApplication.shared.openURL(settingsUrl)
                }
            }
        }
    }
    
    private func fromLibrary(){
        func choosePhoto(){
            DispatchQueue.main.async {
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                self.imagePicker.modalPresentationStyle = .popover
                    self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        // khai báo biến để lấy quyền truy cập
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == PHAuthorizationStatus.authorized) {
            // quyền truy cập đã được cấp
            choosePhoto()
        }else if (status == PHAuthorizationStatus.denied) {
            // quyền truy cập bị từ chối
            setting()
        }else if (status == PHAuthorizationStatus.notDetermined) {
            // quyền truy cập chưa được xác nhận
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                    choosePhoto()
                }else {
                    print("Không được cho phép truy cập vào thư viện ảnh")
                    self.setting()
                }
            })
        }else if (status == PHAuthorizationStatus.restricted) {
            // Truy cập bị hạn chế, thông thường sẽ không xảy ra
            print("Restricted access")
            setting()
        }
    }
    
    private func fromCamera(){
        func takePhoto(){
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.imagePicker.cameraCaptureMode = .photo
                self.imagePicker.cameraDevice = .front
                self.imagePicker.modalPresentationStyle = .fullScreen
                DispatchQueue.main.async {
                    self.present(self.imagePicker, animated: true,completion: nil)
                }
            }else{
                print("abc")
                DispatchQueue.main.async {
                     let alert = UIAlertController(title: "Thông báo", message: "Không tìm thấy máy ảnh", preferredStyle: .alert)
                     let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                     alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        //Camera
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                takePhoto()
            } else {
                print("camera denied")
                self.setting()
            }
        }
    }
}

extension NewItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("error: \(info)")
            return
        }
        
        self.previewImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}
