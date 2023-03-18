//
//  ContentView.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var taskListViewModel: TaskListViewModel
    @State private var newTaskTitle = ""
    @State private var newTaskDueDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task title", text: $newTaskTitle)
                    DatePicker("Due date", selection: $newTaskDueDate, displayedComponents: .date)
                    Button("Add") {
                        let newTask = Task(title: newTaskTitle, dueDate: newTaskDueDate, status: .notStarted)
                        let newTaskViewModel = TaskViewModel(task: newTask)
                        taskListViewModel.addTask(taskViewModel: newTaskViewModel)
                        newTaskTitle = ""
                        newTaskDueDate = Date()
                    }
                }.padding()
                List {
                    ForEach($taskListViewModel.taskViewModels) { $taskViewModel in
                        NavigationLink(destination: ContentView(taskListViewModel: taskListViewModel)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(taskViewModel.title)
                                    if let dueDate = taskViewModel.dueDate {
                                        Text("Due: \(dueDate, formatter: taskListViewModel.dueDateFormatter)")
                                    }
                                }
                                Spacer()
                                Image(systemName: taskViewModel.status.iconName)
                            }
                        }
                    }.onDelete(perform: taskListViewModel.removeTask)
                }
            }.navigationTitle("Tasks")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskListViewModel: TaskListViewModel())
    }
}
