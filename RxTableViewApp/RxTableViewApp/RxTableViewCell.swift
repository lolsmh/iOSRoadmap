//
//  RxTableViewCell.swift
//  RxTableViewApp
//
//  Created by Даниил Апальков on 11.07.2021.
//

import UIKit
import SnapKit

class RxTableViewCell: UITableViewCell, UIFiller {
    
    static let id = "RxTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    func fill() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.right.left.equalToSuperview().inset(16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.right.left.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).inset(-6)
        }
    }
    
    func configure(from model: RxTableModel) {
        titleLabel.attributedText = model.title
        subtitleLabel.attributedText = model.subtitle
    }
}
