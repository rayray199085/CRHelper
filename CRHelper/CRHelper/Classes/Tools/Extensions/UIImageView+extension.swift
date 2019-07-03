//
//  UIImageView+extension.swift
//  MySinaWeibo
//
//  Created by Stephen Cao on 28/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import SDWebImage
extension UIImageView{

    /// isolate sdwebimage
    ///
    /// - Parameters:
    ///   - urlString: image url string
    ///   - placeholderImage: placeholder
    ///   - isAvatar: ture if this image is used for avatar
    func setImage(urlString: String?,backgroundColor: UIColor,placeholderImage: UIImage?, isAvatar:Bool = false, frameColor: UIColor = UIColor.lightGray){
        guard let imageUrlString = urlString,
            let url = URL(string: imageUrlString) else {
                image = placeholderImage
                return
        }
        sd_setImage(with: url, placeholderImage: placeholderImage, options: [], progress: { (receivedSize, expectedSize, targetURL) in//NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL);
            
        }) { [weak self] (image, error, cacheType, imageURL) in//UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL
            if isAvatar{
                self?.image = image?.setCircleImage(size: self?.bounds.size, backgroundColor: backgroundColor, hasFrame: true, frameColor: frameColor)
            }else{
                self?.image = image?.modifyImageSize(size: self?.bounds.size)
            }
        }
    }
}
