//
//  MenuItemCell.swift
//  ReadableText
//
//  Created by Keith Staines on 22/10/2021.
//

import UIKit

class MenuItemCell: UITableViewCell {
    func configureWith(_ model: MenuItemModel) {
        textLabel?.text = model.heading
    }
}
