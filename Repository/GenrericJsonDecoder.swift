//
//  GenrericJsonDecoder.swift
//  DemoTest
//
//  Created by Israrul on 3/15/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation

protocol GenericJsonDecoder {
    associatedtype DataModel:Decodable
    func decode(input:Data) -> DataModel?
}

extension GenericJsonDecoder {
    func decode(input:Data) -> DataModel? {
        do {
           return  try JSONDecoder().decode(DataModel.self, from: input)
        }catch {
            return nil
        }
    }
}
