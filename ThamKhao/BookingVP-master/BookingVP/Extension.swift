//
//  Extension.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/22/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import Alamofire

//class Extension: NSObject {
//
//}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    static let textMain = UIColor.black
    static let textDescription = UIColor.init(hexString: "8c8c8c")
    static let textWhite = UIColor.white
    static let textGreen = UIColor.green
    
    static let separatorColor = UIColor.init(hexString: "e0e0e0")
}

extension UIViewController {
    func getHeightSafeAreaTop() -> CGFloat {
        return view.safeAreaInsets.top
    }
    
    func getHeightSafeAreaBottom() -> CGFloat {
        return view.safeAreaInsets.bottom
    }
    
    func isCheckInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
}

extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
    
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()

        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}

extension UITextField {
    func setIcon(_ image: UIImage, padding: Int) {
        let iconWidth = 12;
        let iconHeight = 12;
        
        //Define the imageView
        let imageView = UIImageView()
        imageView.image = image
        let todoX = Int(self.frame.size.width) - padding
        let todoY = self.frame.size.height/2 - 6
        imageView.contentMode = .scaleAspectFit
        
        imageView.frame = CGRect(x: Int(todoX), y: Int(todoY), width: iconWidth, height: iconHeight)
        self.rightViewMode = .always
        self.addSubview(imageView)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.rightView = paddingView
    }
}
