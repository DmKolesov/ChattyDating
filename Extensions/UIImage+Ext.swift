//
//  UIImage+Ext.swift
//  ChattyDating
//
//  Created by admin on 31.01.2024.
//

import UIKit

extension UIImage {
    static func scaleImage(image: UIImage, toSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? UIImage()
    }
}
