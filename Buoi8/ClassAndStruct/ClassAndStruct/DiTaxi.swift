//
//  DiTaxi.swift
//  ClassAndStruct
//
//  Created by Taof on 10/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

class CuocTaxi {
    var km: Float = 0.0
    var tongTien: Float = 0
    
    init(km: Float) {
        if km < 0 {
            self.km = 0.0
            self.tongTien = 0.0
        } else {
            self.km = km
            self.tongTien = cuocTaxi()
        }
    }
    
    func cuocTaxi() -> Float {
        if km <= 1  {
            return km * 5000
        } else if km <= 31{
            return 5000 + (km - 1) * 4000
        } else {
            return 5000 + 30 * 4000 + (km - 31) * 3000
        }
    }
}

func thongKeCuocTaxi(){
    let cuoc1 = CuocTaxi(km: 0)
    let cuoc2 = CuocTaxi(km: 5)
    let cuoc3 = CuocTaxi(km: 13)
    let cuoc4 = CuocTaxi(km: 40)
    
    let cuocs: [CuocTaxi] = [cuoc1, cuoc2, cuoc3, cuoc4]
    
    for (index, item) in cuocs.enumerated(){
        print("Chuyến đi \(index + 1), quãng đường \(item.km) km, tổng tiền \(item.tongTien)")
    }
}
