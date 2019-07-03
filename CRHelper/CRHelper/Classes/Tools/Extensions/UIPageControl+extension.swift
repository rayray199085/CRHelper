//
//  UIPageControl+extension.swift
//  MySinaWeibo
//
//  Created by Stephen Cao on 11/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
extension UIPageControl{
    
    /// custom page control indicator style with images
    ///
    /// - Parameters:
    ///   - normalImage: normal image
    ///   - selectedImage: current image
    func setPageControlImages(normalImage: UIImage, selectedImage:UIImage){
        setValue(normalImage, forKey: "_pageImage")
        setValue(selectedImage, forKey: "_currentPageImage")
    }
}
