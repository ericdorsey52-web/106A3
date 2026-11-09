//
//  Task.swift
//  106A3
//
//  Created by Eric Dorsey on 11/9/26.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool = false
}
