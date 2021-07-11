//
//  Collection + Distance.swift
//  RxTableViewApp
//
//  Created by Даниил Апальков on 11.07.2021.
//

import Foundation

extension StringProtocol {
    func distance(of element: Element) -> Int? { firstIndex(of: element)?.distance(in: self) }
    func distance<S: StringProtocol>(of string: S) -> Int? { range(of: string)?.lowerBound.distance(in: self) }
}

extension String.Index {
    func distance<S: StringProtocol>(in string: S) -> Int { string.distance(to: self) }
}

extension Collection {
    func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
}
