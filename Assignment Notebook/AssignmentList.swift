//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Student on 2/8/21.
//

import SwiftUI

class AssignmentList: ObservableObject {
    @Published var items: [AssignmentItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    
    init () {
        if let items =  UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: items){
                self.items = decoded
                return
            }
        }
        items = []
    }
}