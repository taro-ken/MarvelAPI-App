//
//  ex-UIImage.swift
//  MarvelAPI-App
//
//  Created by 木元健太郎 on 2022/04/10.
//

import UIKit
import AlamofireImage

extension UIImageView {

    func setImageByAlamofire(with url: URL) {

        af_setImage(withURL: url) { [weak self] response in
            switch response.result {
            case .success(let image):
                self?.image = image

            case .failure(_):
                break
            }

        }
    }
}
