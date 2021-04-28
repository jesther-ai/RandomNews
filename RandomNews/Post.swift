//
//  Json.swift
//  RandomNews
//
//  Created by Jesther Silvestre on 4/27/21.
//

import Foundation
struct Post : Codable {
    var status:String = ""
    var totalResults:Int
    var articles:[Article]?
}

struct Article : Codable{
    var sources:[Sources]?
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
}

struct Sources : Codable{
    var id:String?
    var name:String?
}
