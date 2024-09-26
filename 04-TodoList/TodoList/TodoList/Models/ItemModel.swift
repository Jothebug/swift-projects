//
//  ItemModel.swift
//  TodoList
//
//  Created by HaYen on 8/9/24.
//

import Foundation

// Immutable Struct

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted )
    }
    
    static var sampleData = ItemModel(title: "This is sample data", isCompleted: false)
}
