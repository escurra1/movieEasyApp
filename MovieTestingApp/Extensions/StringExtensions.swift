//
//  StringExtensions.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

extension String {
    static let empty = ""
    static let withSpace = " "
    
    /// Formats string
    var isFormatName: Bool {
        return !isEmpty && range(of: "[^a-zñáéíóúA-ZÑÁÉÍÓÚ 0-9]+", options: .regularExpression) == nil
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9.*]", options: .regularExpression) == nil
    }
}
