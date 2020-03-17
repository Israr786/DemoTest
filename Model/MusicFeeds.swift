//
//  MusicFeeds.swift
//  DemoTest
//
//  Created by Israrul on 3/15/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation

struct MusicFeeds:Decodable {
    var feed:Feed
}

struct  Feed:Decodable {
    var results:[Album]
}

struct Album:Decodable {
    var name:String
    var artistName:String
    var artworkUrl100:String
    var copyright:String
    var releaseDate:String
    var genres:[Genre]
    var url:String
}

struct Genre:Decodable {
    var genreId:String
    var name:String
    var url:String
}
