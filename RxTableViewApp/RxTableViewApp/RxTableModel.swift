//
//  RxTableModel.swift
//  RxTableViewApp
//
//  Created by Даниил Апальков on 11.07.2021.
//

import Foundation

struct RxTableModel: Comparable {
    static func < (lhs: RxTableModel, rhs: RxTableModel) -> Bool {
        lhs.title.string > rhs.title.string || lhs.subtitle.string > rhs.subtitle.string
    }
    
    let title: NSMutableAttributedString
    let subtitle: NSMutableAttributedString
}

let data: [RxTableModel] = [
    .init(title: .init(string: "Дед из Саратова"), subtitle: .init(string: "Очередной день как не в Саратове")),
    .init(title: .init(string: "Хмельной заговор"), subtitle: .init(string: "Почему пиво полезно для потенции")),
    .init(title: .init(string: "Медведь сгорел в машине"), subtitle: .init(string: "Но сначала он туда сел")),
    .init(title: .init(string: "Рубль переназвали в Упадль"), subtitle: .init(string: "В госдуме решили, что это забавно")),
    .init(title: .init(string: "Сырок дружба"), subtitle: .init(string: "Нет, творог вражда")),
    .init(title: .init(string: "Резкое дорожание водки"), subtitle: .init(string: "Вгоняет в дипрессию")),
    .init(title: .init(string: "Гений мысли"), subtitle: .init(string: "Отец русской демократии")),
    .init(title: .init(string: "Доказан вред iOS разработки"), subtitle: .init(string: "Выявленны случаи понижения iq")),
    .init(title: .init(string: "Собака ведет вертолет"), subtitle: .init(string: "И тут даже добавить нечего")),
    .init(title: .init(string: "Даниил Храповицкий"), subtitle: .init(string: "Устал, но работает")),
    .init(title: .init(string: "Секрет успеха"), subtitle: .init(string: "На то и секрет")),
]
