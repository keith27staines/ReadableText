//
//  ViewController.swift
//  ReadableText
//
//  Created by Keith Staines on 22/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [TileModel]() {
        didSet {
            refresh()
        }
    }
    
    typealias Datasource = UITableViewDiffableDataSource<Int,TileModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int,TileModel>
    
    lazy var datasource = Datasource(tableView: table) { tableView, indexPath, itemIdentifier in
        let cell = self.table.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier)
        guard let cell = cell as? Cell else { return cell }
        cell.configureWith(itemIdentifier)
        return cell
    }
    
    var snapshot: Snapshot?
    
    func makeSnapshot() -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([1])
        snapshot.appendItems(data, toSection: 1)
        return snapshot
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        data = TileModel.testData
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refresh()
    }
    
    func refresh() {
        let animate = snapshot == nil
        let snapshot = makeSnapshot()
        datasource.apply(snapshot, animatingDifferences: animate) {
            // animation complete
        }
        self.snapshot = snapshot
    }
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
        return table
    }()
    
    func configureViews() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
    }


}

class Cell: UITableViewCell {
    static let reuseIdentifier = "Cell"
    let space = CGFloat(16)
    
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
    
    lazy var tile: UIView = {
        let tile = UIView()
        tile.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: tile.leftAnchor, constant: space).isActive = true
        stack.rightAnchor.constraint(equalTo: tile.rightAnchor, constant: -space).isActive = true
        stack.topAnchor.constraint(equalTo: tile.topAnchor, constant: space).isActive = true
        stack.bottomAnchor.constraint(equalTo: tile.bottomAnchor, constant: -space).isActive = true
        tile.layer.borderWidth = 1
        tile.layer.cornerRadius = 16
        tile.layer.backgroundColor = UIColor.systemOrange.cgColor
        tile.layer.masksToBounds = true
        return tile
    }()
    
    func configureWith(_ data: TileModel) {
        self.heading.text = data.heading
        self.bodyText.text = data.expandableText.text
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(tile)
        tile.translatesAutoresizingMaskIntoConstraints = false
        tile.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: space).isActive = true
        tile.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -space).isActive = true
        tile.topAnchor.constraint(equalTo: contentView.topAnchor, constant: space).isActive = true
        tile.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -space).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

