//
//  ContentView.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TaskViewModel()
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks) { task in
                    if viewModel.isEditing {
                        EditableTaskView(task: $viewModel.tasks[viewModel.tasks.firstIndex(of: task)!])
                    } else {
                        TaskView(task: task)
                    }
                }
                .onDelete { indexSet in
                    self.viewModel.tasks.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Tasks")
            .navigationBarItems(
                trailing: HStack {
                    if viewModel.isEditing {
                        Button("Done") {
                            self.viewModel.isEditing.toggle()
                        }
                    } else {
                        Button(action: {
                            self.viewModel.tasks.append(Task(title: "New Task", dueDate: Date(), status: .notStarted))
                        }) {
                            Image(systemName: "plus")
                        }
                        Button("Edit") {
                            self.viewModel.isEditing.toggle()
                        }
                    }
                }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
