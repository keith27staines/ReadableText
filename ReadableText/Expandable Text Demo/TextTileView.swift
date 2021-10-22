//
//  TextTileView.swift
//  ReadableText
//
//  Created by Keith Staines on 22/10/2021.
//

import UIKit

class TextTileView: UIView {
    lazy var heading: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.systemPink.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    lazy var bodyText: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.systemBlue.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            heading,
            bodyText
        ])
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    func configureWith(_ tileModel: TileModel) {
        self.heading.text = tileModel.heading
        self.bodyText.text = tileModel.expandableText.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: leftAnchor, constant: space).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -space).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor, constant: space).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -space).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
