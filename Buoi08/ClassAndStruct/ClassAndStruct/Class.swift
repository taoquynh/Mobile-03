//
//  Class.swift
//  ClassAndStruct
//
//  Created by Taof on 10/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

func classExample(){

    // Khởi tạo class với thuộc tính có giá trị mặc định
    class Bird {
        var name: String = ""
    }

    var bird1 = Bird()

    class Car {
        var name: String
        let wheel: Int
        
        init(name: String, wheel: Int) {
            self.name = name
            self.wheel = wheel
        }
        
        func run(){
            print("Xe chạy")
        }
        
    }




    // class là kiểu tham chiếu

    var car1 = Car(name: "BMW", wheel: 4)
    print(car1.name)
    var car2 = car1
    car2.name = "Audi"
    print(car1.name, car2.name)

    struct Color {
        var name: String
    }

    // struct là kiểu tham trị
    var color1 = Color(name: "Red")
    var color2 = color1
    color2.name = "Xanh"
    print(color1.name, color2.name)
}
