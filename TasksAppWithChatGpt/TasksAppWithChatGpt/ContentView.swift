//
//  ContentView.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.tasks) { task in
                Button(action: {
                    if let index = self.viewModel.tasks.firstIndex(where: { $0.id == task.id }) {
                        self.viewModel.tasks[index].completed.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                        Text(task.title)
                    }
                }
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: Button(action: {
                self.viewModel.tasks.append(Task(title: "New Task"))
            }) {
                Image(systemName: "plus")
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
