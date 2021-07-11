//
//  RxTableViewAssembler.swift
//  RxTableViewApp
//
//  Created by Даниил Апальков on 10.07.2021.
//

import UIKit

class RxTableViewAssembler: UIAssembler {
    static func createModule() -> UIViewController {
        let viewController = RxTableViewController()
        let view = RxTableView()
        let viewModel = RxTableViewModel()
        viewController.rxView = view
        viewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
