//
//  ViewController.swift
//  SegmentControl
//
//  Created by Quynh on 2/21/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

enum State {
    case no_process
    case processing
    case processed
}

class ViewController: UIViewController {
    
    deinit {
        print("Đã huỷ HomeViewController")
    }
    
    let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Chưa xử lý", "Đang xử lý", "Đã xử lý"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        // Make second segment selected
        segment.selectedSegmentIndex = 0
        //thay đổi màu segment được chọn
        segment.selectedSegmentTintColor = UIColor.brown
        segment.backgroundColor = UIColor.blue
        return segment
    }()
    
    let segmentControl2: SegmentControl = {
        let segment = SegmentControl(items: ["Chưa xử lý", "Đang xử lý", "Đã xử lý"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        // Make second segment selected
        segment.selectedSegmentIndex = 0
        //thay đổi màu segment được chọn
        segment.selectedSegmentTintColor = UIColor.brown
        segment.backgroundColor = UIColor.blue
        return segment
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return tableView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var isState: State = .no_process
    var searchBar: UISearchBar!
    var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        setupLayout()
        setUpTableView()
        
        segmentControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
        
    }
    
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!){
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex {
        case 0:
            isState = .no_process
        case 1:
            isState = .processing
        case 2:
            isState = .processed
        default:
            return
        }
        
        tableView.reloadData()
    }
    
    func setupLayout(){
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(segmentControl)
        containerView.addSubview(segmentControl2)
        containerView.addSubview(tableView)
        
        segmentControl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100).isActive = true
        segmentControl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        segmentControl.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        segmentControl2.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 16).isActive = true
        segmentControl2.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        segmentControl2.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        segmentControl2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        tableView.topAnchor.constraint(equalTo: segmentControl2.bottomAnchor, constant: 32).isActive = true
        tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isState {
        case .no_process:
            return 10
        case .processing:
            return 50
        case .processed:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

class SegmentControl: UISegmentedControl {
    override open func layoutSubviews() {
      super.layoutSubviews()
      layer.cornerRadius = self.bounds.size.height / 2.0
        layer.borderColor = UIColor.red.cgColor
      layer.borderWidth = 1.0
//      layer.masksToBounds = true
//      clipsToBounds = true

   }
}
