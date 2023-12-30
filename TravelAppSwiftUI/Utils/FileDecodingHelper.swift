//
//  FileDecodingHelper.swift
//  TravelAppSwiftUI
//
//  Created by Ramill Ibragimov on 30.12.2023.
//

import Foundation

struct FileDecodingHelper<T: Decodable> {
    
    private var fileName: String
    
    init(file name: String) {
        fileName = name
    }
    
    func getData() -> [T] {
        guard let json = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("JSON loading failed")
        }
        
        do {
            let jsonData = try Data(contentsOf: json)
            return try JSONDecoder().decode([T].self, from: jsonData)
        } catch let error {
            fatalError("JSON parsing failed \(error)")
        }
    }
}
