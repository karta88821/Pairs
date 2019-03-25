//
//  Country.swift
//  Pairs
//
//  Created by liaoyuhao on 2019/3/25.
//  Copyright © 2019 liaoyuhao. All rights reserved.
//

import Foundation

enum Country: String {
    case china = "中國"
    case japan = "日本"
    case canada = "加拿大"
    case taiwan = "台灣"
    case indonesia = "印尼"
    case southkorea = "南韓"
    case america = "美國"
    case england = "英國"
    case hongkong = "香港"
    case thailand = "泰國"
    case malaysia = "馬來西亞"
    case philippines = "菲律賓"
    case vietnam = "越南"
    case singapore = "新加坡"
    case australia = "澳大利亞"
}

extension Country {
    
    static func acroddingCourtries() -> [[Int: [Country]]] {
        return [
            [4: [.china, .japan]],
            [5: [.canada, .taiwan]],
            [6: [.indonesia]],
            [9: [.southkorea, .america, .england, .hongkong]],
            [10: [.thailand, .malaysia]],
            [12: [.philippines, .vietnam]],
            [13: [.singapore]],
            [16: [.australia]]
        ]
    }
    
    var code: String {
        switch self {
        case .china:
            return "+86"
        case .japan:
            return "+81"
        case .canada:
            return "+1"
        case .taiwan:
            return "+886"
        case .indonesia:
            return "+62"
        case .southkorea:
            return "+82"
        case .america:
            return "+1"
        case .england:
            return "+44"
        case .hongkong:
            return "+852"
        case .thailand:
            return "+66"
        case .malaysia:
            return "+60"
        case .philippines:
            return "+63"
        case .vietnam:
            return "+84"
        case .singapore:
            return "+65"
        case .australia:
            return "+61"
        }
    }
}
