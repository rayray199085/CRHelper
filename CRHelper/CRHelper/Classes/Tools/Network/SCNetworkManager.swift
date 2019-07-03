//
//  SCNetworkManager.swift
//  SCWeiboAssistant
//
//  Created by Stephen Cao on 20/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import Alamofire

class SCNetworkManager{
    static let shared = SCNetworkManager()
    private let headers = ["Content-Type": "application/json",
                           "Accept": "application/json",
                           "apikey": "471d2518-963e-4851-8998-94e7d8e469a0"]
    private init() {
        
    }
    
    /// request method
    ///
    /// - Parameters:
    ///   - urlString: url in string
    ///   - method: get/ post
    ///   - params: parameters in dictionary
    ///   - completion: json(array/ dictionary), isSuccess, error
    func request(urlString:String, method:HTTPMethod, params:[String:Any]?, completion :@escaping (_ response: Any?,_ isSuccess: Bool, _ statusCode: Int,_ error: Error?)->() ){
        Alamofire.request(urlString, method: method, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (dataResponse) in
            completion(
                dataResponse.result.value,
                dataResponse.result.isSuccess,
                dataResponse.response?.statusCode ?? -1,
                dataResponse.result.error)
        }
        
    }
    func requestForResponseString(urlString:String, method:HTTPMethod, params:[String:Any]?, completion :@escaping (_ response: Any?,_ isSuccess: Bool, _ statusCode: Int,_ error: Error?)->() ){
    Alamofire.request(urlString, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).responseString { (dataResponse) in
        completion(
            dataResponse.result.value,
            dataResponse.result.isSuccess,
            dataResponse.response?.statusCode ?? -1,
            dataResponse.result.error)
        }
    }
    
    
    /// Upload a file to server
    ///
    /// - Parameters:
    ///   - urlString: url in string
    ///   - name: name in server, like: "pic"
    ///   - params: a dictionary for parameters
    ///   - data: file in data
    ///   - completion: response in json / nil
    func upload(urlString: String, name: String, params: [String: Any]?,data: Data, completion:@escaping (_ response: Any?,_ isSuccess: Bool, _ statusCode: Int,_ error: Error?)->()){
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(
                data,
                withName: name,
                fileName: "xxxxxx",
                mimeType: "application/octet-stream")
            for (key,value) in params ?? [:]{
                multipartFormData.append(
                    (value as! String).data(using: String.Encoding.utf8)!,
                    withName: key)
            }
        }, to: urlString) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    completion(
                        response.result.value,
                        response.result.isSuccess,
                        response.response?.statusCode ?? -1,
                        response.result.error)
                }
            case .failure(let encodingError):
                completion(nil, false, -1, encodingError)
            }
        }
    }
}
