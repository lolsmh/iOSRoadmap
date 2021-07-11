//
//  ViewController.swift
//  RxTableViewApp
//
//  Created by Даниил Апальков on 10.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

class RxTableViewController: UIViewController {
    //MARK: - Views
    var rxView: RxTableView!
    var viewModel: RxTableViewModelProtocol!
    
    //MARK: - Properties
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        rxView.fill()
        view = rxView
        bindViewModel()
        bindSearchBar()
        bindTableView()
    }
    
    private func configureNavigationController() {
        title = "Rx Test"
    }
    
    func bindViewModel() {
        viewModel.output.items
            .distinctUntilChanged()
            .bind(to: rxView.tableView.rx.items) {  tableView, index, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: RxTableViewCell.id)
                guard let rxCell = cell as? RxTableViewCell else { return UITableViewCell() }
                rxCell.configure(from: item)
                rxCell.fill()
                return rxCell
            }.disposed(by: bag)
    }
    
    func bindSearchBar() {
        rxView.searchBar.rx.text.orEmpty
            .debounce(.milliseconds(150), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .bind { searchResult in
                self.viewModel.input.filterItems.accept(searchResult)
            }.disposed(by: bag)
    }
    
    func bindTableView() {
        rxView.tableView.rx.willDisplayCell.bind { (cell: UITableViewCell, indexPath: IndexPath) in
            cell.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            UIView.animate(withDuration: 0.3,
                           delay: 0.005 * Double(indexPath.row),
                           usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut) {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }.disposed(by: bag)
    }
}

