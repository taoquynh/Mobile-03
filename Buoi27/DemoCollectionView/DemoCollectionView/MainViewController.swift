//
//  MainViewController.swift
//  DemoCollectionView
//
//  Created by Taof on 1/16/20.
//  Copyright © 2020 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // khởi tạo collectionView
    let collectionView: UICollectionView = {
        // khởi tạo flowLayout
        // Flow layout là một dạng line-based layout
        // layout object sẽ sắp xếp các items trên một hàng, và tính toán làm sao để có thể chứa càng nhiều items trên hàng đó càng tốt. Tới khi không còn thể nhét thêm bất cứ item nào nữa thì nó sẽ tạo ra một hàng mới và bắt đầu lặp lại công việc này cho đến khi hết tất cả items
        let layout = UICollectionViewFlowLayout()
        
        // khởi tạo collectionView truyền vào layout vừa khởi tạo ở trên
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // đăng ký cell với collectionView
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .groupTableViewBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        
        return collectionView
    }()
    
    var foods: [Foody] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.groupTableViewBackground
        // gán delegate cho collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        setupData()
        setupLayout()
    }
    
    // hàm layout cho collectionView
    func setupLayout(){
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34).isActive = true
        
        // thay đổi hướng scroll của collectionView
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    // hàm tạo dữ liệu
    func setupData(){
        
        let food1 = Foody(imageName: "cafedeadend.jpg", name: "Cafe Deadend", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
        let food2 = Foody(imageName: "homei.jpg", name: "Homei", description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,")
        let food3 = Foody(imageName: "teakha.jpg", name: "Teakha", description: "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,")
        let food4 = Foody(imageName: "cafeloisl.jpg", name: "Cafe Loisl", description: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        let food5 = Foody(imageName: "petiteoyster.jpg", name: "Petite Oyster", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")
        let food6 = Foody(imageName: "forkeerestaurant.jpg", name: "For Kee Restaurant", description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.")
        let food7 = Foody(imageName: "posatelier.jpg", name: "Po's Atelier", description: "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
        let food8 = Foody(imageName: "bourkestreetbakery.jpg", name: "Bourke Street Bakery", description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.")
        let food9 = Foody(imageName: "haighschocolate.jpg", name: "Haigh's Chocolate", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.")
        let food10 = Foody(imageName: "palominoespresso.jpg", name: "Palomino Espresso", description: "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.")
        
        foods = [food1, food2, food3, food4, food5, food6, food7, food8, food9, food10]
    }
}

// viết extension cho class MainViewController:
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // hàm trả về số item trong một section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    // hàm trả về nội dung của mỗi item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
        
        // gán dữ liệu từng phần tử của mảng vào trong item (gán một cục)
        cell.food = foods[indexPath.row]
        return cell
    }
    
    // hàm trả về kích thước của item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // tính kích thước size một cạnh của item
        let size = ((collectionView.frame.size.width - 1) / 2)
        return CGSize(width: size, height: size)
    }
    
    // hàm trả về khoảng cách giữa hai hàng
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // hàm trả về khoảng cách giữa 2 item (tương tự 2 cột)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // hàm chọn item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = foods[indexPath.row]
        let zoomVC = ZoomImageView()
        zoomVC.image = UIImage(named: item.imageName)
        present(zoomVC, animated: true, completion: nil)
    }
    
}
