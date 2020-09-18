//
//  Formatter.swift
//  Carangas
//
//  Created by Eric Alves Brito on 08/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

struct Formatter {
    
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    
    static let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
}
