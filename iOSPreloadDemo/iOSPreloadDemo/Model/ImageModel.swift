//
//  ImageModel.swift
//  PreloadDemo
//
//  Created by leo on 2023/12/2.
//

import Foundation

struct ImageModel {
    var url: URL?
    var order: Int?
    
    init(url: String, order: Int) {
        self.url = URL(string: url)
        self.order = order
    }
}
