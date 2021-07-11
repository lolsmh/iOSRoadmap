//
//  RxTableView.swift
//  RxTableViewApp
//
//  Created by Даниил Апальков on 10.07.2021.
//

import UIKit
import SnapKit

class RxTableView: UIView, UIFiller {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RxTableViewCell.self, forCellReuseIdentifier: RxTableViewCell.id)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.backgroundImage = UIImage()
        return bar
    }()
    
    func fill() {
        addSubview(tableView)
        addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(snp.topMargin)
        }
        
        tableView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
}
