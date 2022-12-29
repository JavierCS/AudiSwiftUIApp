//
//  AudiCarModel.swift
//  AudiSwiftUIApp
//
//  Created by jcruzsa on 29/11/22.
//

import Foundation

class AudiCarModel: Decodable {
    var modelName: String?
    var modelYear: Int?
    var imageUrl: String?
    var initialPrice: Double?
    var versions: [AudiCarVersion]?
}

extension AudiCarModel: Identifiable {
    
}
