//
//  UIAssebler.swift
//  RxTableViewApp
//
//  Created by Даниил Апальков on 10.07.2021.
//

import UIKit

protocol UIAssembler {
    static func createModule() -> UIViewController
}
