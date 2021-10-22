//
//  MenuItemModel.swift
//  ReadableText
//
//  Created by Keith Staines on 22/10/2021.
//

import Foundation



struct MenuItemModel: Hashable {
    let id = UUID()
    var heading: String
    var body: String
}
