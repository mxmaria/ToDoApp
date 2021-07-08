//
//  Item.swift
//  ToDoApp
//
//  Created by Maria Pecheritsyna on 27.06.2021.
//

import Foundation

struct ItemModel {
    var title: String = ""
    var done: Bool = false
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
