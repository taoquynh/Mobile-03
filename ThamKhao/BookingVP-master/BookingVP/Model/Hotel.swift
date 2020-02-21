//
//  Hotel.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/30/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import ObjectMapper

class Hotel: Mappable {
    
    var hotelId: Int = 0
    var hotelName: String = ""
    var cityId: Int = 0
    var address: String = ""
    var lat: Double = 0.0
    var lon: Double = 0.0
    var images: String = ""
    var restaurant: String = ""
    var events: String = ""
    var entertainment: String = ""
    var phone: String = ""
    var email: String = ""
    var hotelDetail: String = ""
    
    required init?(_ map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        hotelId <- map["hotel_id"]
        hotelName <- map["hotel_name"]
        cityId <- map["city_id"]
        address <- map["address"]
        lat <- map["lat"]
        lon <- map["longi"]
        images <- map["images"]
        restaurant <- map["restaurant"]
        events <- map["events"]
        entertainment <- map["entertainment"]
        phone <- map["phone"]
        email <- map["email"]
        hotelDetail <- map["hotel_detail"]
    }
}
