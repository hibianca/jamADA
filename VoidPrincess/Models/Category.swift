//
//  Category.swift
//  VoidPrincess
//
//  Created by Bianca Nathally Bezerra de Lima on 09/04/24.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case body, skin, hair, bottom, top, shoe, overlay, background
    
    var id: String { self.rawValue }
}
