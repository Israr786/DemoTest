//
//  AlbumDetailViewModel.swift
//  DemoTest
//
//  Created by Israrul on 3/15/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation

class AlbumDetailViewModel {
    
    weak var albumViewCtrl:AlbumDetailsViewControllerrotocol?
    var album:Album?
    var imageData:Data?

    init(album:Album?, albumViewCtrl:AlbumDetailsViewControllerrotocol, imageData:Data?) {
        self.albumViewCtrl = albumViewCtrl
        self.album = album
        self.imageData = imageData
    }
}

