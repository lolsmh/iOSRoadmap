//
//  RxTbleViewPresenter.swift
//  RxTableViewApp
//
//  Created by Даниил Апальков on 10.07.2021.
//

import RxCocoa
import RxSwift

struct RxViewModelOutput {
    var items: BehaviorRelay<[RxTableModel]>
}

struct RxViewModelInput {
    var filterItems: PublishRelay<String>
}

protocol RxTableViewModelProtocol {
    var input: RxViewModelInput { get }
    var output: RxViewModelOutput { get }
}

class RxTableViewModel: RxTableViewModelProtocol {
    var input: RxViewModelInput
    var output: RxViewModelOutput
    let bag = DisposeBag()
    
    //MARK: Input
    let filterItems = PublishRelay<String>()
    //MARK: Output
    let items = BehaviorRelay<[RxTableModel]>(value: data)
    
    init() {
        input = RxViewModelInput(filterItems: filterItems)
        output = RxViewModelOutput(items: items)
        filterItems.bind(onNext: filterItemsBinder).disposed(by: bag)
    }
    
    private func filterItemsBinder(searchString: String) {
        let filteredItems = data.filter { model in
            colorMatchedPart(of: model.title, comparedToString: searchString, color: .red)
            colorMatchedPart(of: model.subtitle, comparedToString: searchString, color: .red)
            let title = model.title.string.lowercased()
            let subtitle = model.subtitle.string.lowercased()
            
            return
                title.contains(searchString.lowercased()) ||
                subtitle.contains(searchString.lowercased()) || searchString.isEmpty
        }
        items.accept(filteredItems)
    }
    
    private func colorMatchedPart(of attributedString: NSMutableAttributedString, comparedToString string: String, color: UIColor) {
        let attributedText = attributedString.string.lowercased()
        let startIndex = attributedText.distance(of: string.lowercased())
        
        let range = NSRange(location: 0, length: attributedString.string.count)
        attributedString.removeAttribute(.foregroundColor, range: range)
        
        if startIndex != nil {
            let range = NSRange(location: startIndex!, length: string.count)
            attributedString.addAttributes([.foregroundColor : color], range: range)
        }
    }
}
