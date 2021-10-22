//
//  TextModel.swift
//  ReadableText
//
//  Created by Keith Staines on 22/10/2021.
//

import UIKit

struct TileModel: Hashable {
    static let testData: [TileModel] = [
        TileModel(id: 0),
        TileModel(id: 1),
        TileModel(id: 2)
    ]
    let id: Int
    var heading: String = "Heading"
    var expandableText = ExpandableText()
}

struct ExpandableText: Hashable {
    static let fullText = """
This is some text that is longer than the longest text that could conceivably fit
in a tile in a table in an iOS app used by Workfinder. It is surely so long that
it never ends.
Although that is not quite the truth because it does end - right here!
"""
    var text: String = Self.fullText
    var maximumLines: Int = 1
}


