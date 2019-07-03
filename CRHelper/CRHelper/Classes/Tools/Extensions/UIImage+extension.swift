//
//  UIImage+extension.swift
//  MySinaWeibo
//
//  Created by Stephen Cao on 27/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import SDWebImage

extension UIImage{
    
    /// modify an image size
    ///
    /// - Parameters:
    ///   - size: imageView.bounds.size
    ///   - backgroundColor: parent view color, default is white
    /// - Returns: an image with new size
    func modifyImageSize(size:CGSize?, backgroundColor: UIColor = UIColor.white) -> UIImage? {
        var size = size
        if size == nil{
            size = self.size
        }
        let rect = CGRect(origin: CGPoint(), size: size!)
        UIGraphicsBeginImageContextWithOptions(size!, true, 0)
        backgroundColor.setFill()
        UIRectFill(rect)
        draw(in: rect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    /// make a circle image
    ///
    /// - Parameters:
    ///   - size: imageView.bounds.size
    ///   - backgroundColor: parent view color
    ///   - hasFrame: with a frame width is 2
    ///   - frameColor: default color is orange
    /// - Returns: image in a circle
    func setCircleImage(size:CGSize?, backgroundColor: UIColor = UIColor.white, hasFrame: Bool, frameColor : UIColor = UIColor.orange)-> UIImage?{
        var size = size
        if size == nil || size?.width == 0 {
            size = CGSize(width: 34, height: 34)
        }
        let rect = CGRect(origin: CGPoint(), size: size!)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        backgroundColor.setFill()
        UIRectFill(rect)
        // only image which stays in the path left
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        draw(in: rect)
        
        if hasFrame{
            let ovalPath = UIBezierPath(ovalIn: rect)
            frameColor.setStroke()
            ovalPath.lineWidth = 2
            ovalPath.stroke()
        }
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
extension UIImage{
    static func downloadImage(url: URL, completion: @escaping (_ image: UIImage?)->()){
        SDWebImageManager.shared.loadImage(with: url, options: [], progress: nil) { (image, _, _, _, _, _) in
            completion(image)
        }
    }
}
