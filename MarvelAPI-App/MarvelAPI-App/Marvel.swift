//
//  Marvel.swift
//  MarvelAPI-App
//
//  Created by 木元健太郎 on 2022/04/04.
//

import Foundation
import Moya
import CryptoSwift


enum Marvel {
  // 1
  static  let publicKey =  "b5a79e107008e02f3e6097399969f93a"

  static  let privateKey = "a0d43931d6eefe3030c17ce656960193abb2a42a"

  // 2
  case comics
}


extension Marvel: TargetType {
  // 1
  public var baseURL: URL {
    return URL(string: "https://gateway.marvel.com/v1/public")!
  }

  // 2
  public var path: String {
    switch self {
    case .comics: return "/characters"
    }
  }

  // 3
  public var method: Moya.Method {
    switch self {
    case .comics: return .get
    }
  }

  // 4
  public var sampleData: Data {
    return Data()
  }

  // 5
  public var task: Task {
      let ts = "\(Date().timeIntervalSince1970)"
    
      let hash = (ts + Marvel.privateKey + Marvel.publicKey).md5()
      let baseParms = ["orderBy": "-name","limit": 50,"apikey": Marvel.publicKey, "ts": ts, "hash": hash] as [String : Any]

      switch self {
      case .comics:
       
        return .requestParameters(
          parameters: baseParms,
          encoding: URLEncoding.default)
      }
  }

  // 6
  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }

  // 7
  public var validationType: ValidationType {
    return .successCodes
  }
}

