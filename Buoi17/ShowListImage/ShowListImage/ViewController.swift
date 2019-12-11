//
//  ViewController.swift
//  ShowListImage
//
//  Created by Taof on 12/6/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scrollView.backgroundColor = .white
//        scrollView.isPagingEnabled = true // hiểu là phân trang
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    var images: [UIImage] = []
    var texts: [String] = []
    
    var datas = [Names]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
//        setupImage(images, texts)
        
        datas = [
            Names(image: "orange", label: "Quả cam"),
            Names(image: "mango", label: "strawberry"),
            Names(image: "mango", label: "strawberry"),
            Names(image: "orange", label: "Quả cam"),
            Names(image: "orange", label: "Quả cam"),
            Names(image: "orange", label: "Quả cam"),
            
        ]
        
        setupImage2(datas)
    }
    
    func data1(){
    images = [
        UIImage(named: "apple"),
        UIImage(named: "banana"),
        UIImage(named: "coconut"),
        UIImage(named: "durian"),
        UIImage(named: "grape"),
        UIImage(named: "lemon"),
        UIImage(named: "mango"),
        UIImage(named: "orange"),
        UIImage(named: "strawberry"),
        
        ] as! [UIImage]
    
    
    texts = [
        "Quả táo",
        "Quả chuối",
        "Quả dừa",
        "Quả sầu riêng",
        "Quả nho",
        "Quả chanh",
        "Quả xoài",
        "Quả cam",
        "Quả dâu"
    ]
    }
    func setupImage(_ arrs: [UIImage], _ brrs: [String]){
        // tính kích thước màn hình
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        //duyệt mảng để addSubview các ảnh con vào trong scrollView
        for i in 0..<arrs.count{
            let imageView = UIImageView(frame: CGRect(x: 0,
                                                      y: height * CGFloat(i),
                                                      width: width,
                                                      height: height))
            let title = UILabel(frame: CGRect(x: 0,
                                              y: height * CGFloat(i) - 200,
                                              width: width,
                                              height: 30))
            imageView.contentMode = .scaleAspectFit
            imageView.image = arrs[i]
            
            title.text = brrs[i]
            title.textColor = .black
            title.font = UIFont.boldSystemFont(ofSize: 64)
            title.textAlignment = .center
            title.center.x = imageView.center.x
            
            scrollView.addSubview(imageView)
            scrollView.addSubview(title)
        }
        
        // tính kích thước contentSize của ScrollView
        scrollView.contentSize = CGSize(width: width,
                                        height: scrollView.frame.height * CGFloat(arrs.count))
    }
    
    func setupImage2(_ data: [Names]) {
            let width = UIScreen.main.bounds.size.width
            let height = UIScreen.main.bounds.size.height
            for i in 0..<data.count {
                let subView = ViewImage(frame: CGRect(x: 0, y: height/2 * CGFloat(i),
                                                          width: width, height: height/2))
                
                print(subView.frame)
                subView.imageView.image = UIImage(named: data[i].image)
                subView.nameLabel.text = data[i].label
    //            subView.nameLabel.textColor = .white
                
                scrollView.addSubview(subView)
            }
            scrollView.contentSize = CGSize(width: width, height: scrollView.frame.height/2 * CGFloat(data.count))
        }

}

