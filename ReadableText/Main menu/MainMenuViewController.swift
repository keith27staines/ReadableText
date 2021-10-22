//
//  MainMenuViewController.swift
//  ReadableText
//
//  Created by Keith Staines on 22/10/2021.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    var data = [
        MenuItemModel(heading: "Expandable Labels", body: "Labels that animate to show all their content when tapped")
    ]
    
    typealias Datasource = UITableViewDiffableDataSource<Int,MenuItemModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int,MenuItemModel>
    
    lazy var datasource = Datasource(tableView: table) { tableView, indexPath, itemIdentifier in
        let cell = self.table.dequeueReusableCell(withIdentifier: TextTileCell.reuseIdentifier)
        guard let cell = cell as? MenuItemCell else { return cell }
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refresh()
    }
    
    func refresh() {
        let animate = snapshot == nil
        let snapshot = makeSnapshot()
        datasource.apply(snapshot, animatingDifferences: animate)
        self.snapshot = snapshot
    }
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.register(TextTileCell.self, forCellReuseIdentifier: TextTileCell.reuseIdentifier)
        return table
    }()
    
    func configureViews() {
        navigationItem.title = "Expandable text"
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
    }
}
