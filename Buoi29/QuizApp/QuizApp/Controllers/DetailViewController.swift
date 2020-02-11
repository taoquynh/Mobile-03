//
//  DetailViewController.swift
//  QuizApp
//
//  Created by Quynh on 2/10/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.29, green:0.75, blue:0.65, alpha:1.0)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.bounces = false
        return tableView
    }()

    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Kiểm tra", for: .normal)
        button.backgroundColor = UIColor(red:0.29, green:0.75, blue:0.65, alpha:1.0)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 5
        return button
    }()
    
    var heightStatusBar: CGFloat = 0
    
    var data: Test?
    
    // bộ câu hỏi
    var questions: [Question]{
        return data?.questions ?? [Question]()
    }
    // index câu hiện tại
    var currentIndexQuestion: Int = 0
    
    // câu hỏi hiện tại
    var currentQuestion: Question{
        return questions[currentIndexQuestion]
    }
    // tổng số câu hỏi
    var totalQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightStatusBar = UIApplication.shared.statusBarFrame.size.height +
        (navigationController?.navigationBar.frame.height ?? 0.0)
        setupNavigationBar()
        setupLayout()
        configTableView()
        
        questionLabel.text = currentQuestion.question
    }
    
    func setupNavigationBar(){
        let rightButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }
    
    // khi view chuẩn bị xuất hiện sẽ setup các thuộc tính của navigationBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // set cho navigationBar trong suốt (cần đủ 3 dòng)
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
    func setupLayout(){
        view.addSubview(topView)
        view.addSubview(tableView)
        
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20 + heightStatusBar).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        topView.addSubview(questionLabel)
        questionLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20).isActive = true
        questionLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20).isActive = true
        
        view.addSubview(submitButton)
        submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -20).isActive = true
    }
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.answer = currentQuestion.answers[indexPath.row]
        return cell
    }
}
