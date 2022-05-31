//
//  UIImageView+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/17.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setKFImage(from urlString: String) {
        let cache = ImageCache.default
        cache.retrieveImage(forKey: urlString) { result in
            switch result {
            case .success(let response):
                if response.image != nil {
                    self.image = response.image?.resizeToScreenWidth()
                } else {
                    self.kf.setImage(with: URL(string: urlString))
                }
            case .failure(let err):
                print(err.errorCode)
            }
        }
    }
}

extension UIImage {

     func resizeToScreenWidth() -> UIImage? {
         let width = UIScreen.main.bounds.width
         let height = self.size.height * (width / self.size.width)
         let size = CGSize(width: width, height: height)
         
         let render = UIGraphicsImageRenderer(size: size)
         let renderImage = render.image { context in
             self.draw(in: CGRect(origin: .zero, size: size))
         }
         return renderImage
     }
}
