//
//  EndPoints.swift
//  DemoTest
//
//  Created by Israrul on 3/15/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation

enum  EndPoints: String {
    case baseUrl = "https://rss.itunes.apple.com/"
}

enum EndPointsPath: String {
    case search = "api/v1/us/apple-music/coming-soon/all/100/explicit.json"
}
