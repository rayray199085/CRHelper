//
//  String+extension.swift
//  MySinaWeibo
//
//  Created by Stephen Cao on 2/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

// MARK: - get source and url string
extension String{
    
    /// get attribute name from string in such a format "<xxxx>target attribute</xxxx>"
    ///
    /// - Returns: target attribute
    func getSourceString()->String?{
        let from = self as NSString
        var startIndex = -1
        var endIndex = -1
        for index in 0..<from.length{
            let c = String(UnicodeScalar(from.character(at: index))!)
            if c == ">"{
                startIndex = index
                break
            }
        }
        if startIndex == -1{
            return nil
        }
        for index in startIndex..<from.length{
            let c = String(UnicodeScalar(from.character(at: index))!)
            if c == "<"{
                endIndex = index
                break
            }
        }
        if endIndex == -1{
            return nil
        }
        return from.substring(with: NSRange(location: startIndex + 1, length: endIndex - startIndex - 1))
    }
    
    /// get url string by using regular expression
    /// get source string by using regular expression
    /// - Returns: a tuple includes url string and source name
    func getURLAndSourceByRegex()->(urlString:String,sourceName:String)?{
        let pattern = "<a href=\"(.*?)\".*?>(.*?)</a>"
        guard  let regx = try? NSRegularExpression(pattern: pattern, options: []),
            let result = regx.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) else{
                return nil
        }
        let urlString = (self as NSString).substring(with: result.range(at: 1))
        let sourceName = (self as NSString).substring(with: result.range(at: 2))
        return (urlString,sourceName)
    }
}

extension String{
    /// get emoji from hex code string
    ///
    /// - Returns: string if find or nil
    func getEmojiFromHexInt32CodeString()->String?{
        let scanner = Scanner(string: self)
        var result : UInt32 = 0
        scanner.scanHexInt32(&result)
        guard let res = Unicode.Scalar(result) else {
            return nil
        }
        return String(Character(res))
    }
}

extension String{
    //    NSDictionary *dict = @{NSFontAttributeName:font};
    //    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    func getTextFontWithLabelHeight(width: CGFloat)->CGFloat{
        var maxFont: CGFloat = 1
        var currentHeight: CGFloat = 0
        while currentHeight < width{
            let dict = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: maxFont)]
            let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
            currentHeight = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: dict, context: nil).height
            maxFont += 1
        }
        return maxFont - 1
    }
}

extension String{
    
    /// Int digits to string
    ///
    /// - Parameters:
    ///   - count: optional count number
    ///   - defaultString: default string
    /// - Returns: if number >= 1000, return 1.0k
    static func transformDigitsToString(count: Int?,defaultString: String)->String{
        guard let count = count else{
            return defaultString
        }
        if count == 0{
            return defaultString
        }
        if count >= 1000{
            return String(format: "%.1lfk", Float(count)/1000)
        }
        return "\(count)"
    }
}


// MARK: - calculate label size by string
extension String{
    func getTextHeight(size: CGSize, font: UIFont)->CGFloat{
        return (self as NSString).sizeOfText(withMaxSize: size, andWith: font).height
    }
}
extension String{
    static func getLargeNumberWithCommas(num: Int?)->String{
        guard let num = num else{
            return "0"
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: num))
        return formattedNumber ?? "0"
    }
}
