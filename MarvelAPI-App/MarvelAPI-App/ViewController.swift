//
//  ViewController.swift
//  MarvelAPI-App
//
//  Created by 木元健太郎 on 2022/04/01.
//

import UIKit
import Moya


class ViewController: UIViewController {

    let provider = MoyaProvider<Marvel>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        provider.request(.comics) { [weak self] result in
          guard let self = self else { return }
            
          switch result {
          case .success(let response):
            do {
            //    print(try response.mapJSON())
                let data = response.data
                guard let responseData = try?JSONDecoder().decode(marvelModel.self, from: data) else {
                    return
                }
                print(responseData)
            } catch {
              print("error")
            }
          case .failure:
              print("error")
          }
        }

    }


}

