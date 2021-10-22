//
//  TextTileCell.swift
//  ReadableText
//
//  Created by Keith Staines on 22/10/2021.
//

import UIKit

class TextTileCell: UITableViewCell {
    
    static let reuseIdentifier = "TextTileCell"
    
    lazy var textTileView = TextTileView()
    
    lazy var tile: UIView = {
        let tile = UIView()
        tile.layer.borderWidth = 1
        tile.layer.cornerRadius = 16
        tile.layer.backgroundColor = UIColor.systemOrange.cgColor
        tile.layer.masksToBounds = true
        tile.addSubview(textTileView)
        textTileView.translatesAutoresizingMaskIntoConstraints = false
        textTileView.leftAnchor.constraint(equalTo: tile.leftAnchor, constant: space).isActive = true
        textTileView.rightAnchor.constraint(equalTo: tile.rightAnchor, constant: -space).isActive = true
        textTileView.topAnchor.constraint(equalTo: tile.topAnchor, constant: space).isActive = true
        textTileView.bottomAnchor.constraint(equalTo: tile.bottomAnchor, constant: -space).isActive = true
        return tile
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(tile)
        tile.translatesAutoresizingMaskIntoConstraints = false
        tile.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: space).isActive = true
        tile.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -space).isActive = true
        tile.topAnchor.constraint(equalTo: contentView.topAnchor, constant: space).isActive = true
        tile.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -space).isActive = true
    }
    
    func configureWith(_ tileModel: TileModel) {
        textTileView.configureWith(tileModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
