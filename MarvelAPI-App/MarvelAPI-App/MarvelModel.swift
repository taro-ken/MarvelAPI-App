//
//  MarvelModel.swift
//  MarvelAPI-App
//
//  Created by 木元健太郎 on 2022/04/04.
//

import Foundation
import SwiftUI

struct marvelModel:Codable{
    var data:_Data?
}

struct _Data :Codable{
    var results:[Results]
}

struct Results :Codable{
    var id:Int?
    var name:String?
    var adescription:String?
    var resourceURI:String?
    var urls:[Urls]
    var thumbnail:Thumbnail?

}

struct Urls :Codable{
    var type:String?
    private let url:String
    
    var _url: URL? { URL.init(string: url) }
    
    
    enum CodingKeys: String, CodingKey {
            case type
            case url = "url"
        }
}

struct Thumbnail:Codable{
    var path:String?
}


