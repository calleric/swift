//
//  Task.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var completed: Bool = false
}
