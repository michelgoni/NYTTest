//
//  ImageCacheable.swift
//  NYT
//
//  Created by Goñi Irigoyen, Michel on 13/2/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation
import UIKit

protocol ImageCachable {}

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView: ImageCachable {}

extension ImageCachable where Self: UIImageView {
    
    typealias completion = (Bool) -> ()
    func loadImageWithURL(_ URLString: String) {
        
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            DispatchQueue.main.async {
                self.image = cachedImage
            }
            return
        }
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                if httpResponse.statusCode == Constants.Responses.okResponseFromServer {
                    
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            DispatchQueue.main.async {
                                self.image = downloadedImage
                            }
                        }
                    }
                }
            }).resume()
        } 
    }
}
