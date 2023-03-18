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

struct TaskView: View {
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
            if let dueDate = task.dueDate {
                Text("Due date: \(dueDate, formatter: ContentView.taskDateFormat)")
                    .font(.caption)
            }
            Text("Status: \(task.status.rawValue)")
        }
        .foregroundColor(task.completed ? .gray : .primary)
        .opacity(task.completed ? 0.5 : 1)
    }
}

struct EditableTaskView: View {
    @Binding var task: Task
    @State private var dueDate: Date? // Add new property

    init(task: Binding<Task>) {
        _task = task
        _dueDate = State(initialValue: task.wrappedValue.dueDate) // Assign initial value to dueDate
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Title", text: $task.title)
            if let dueDate = dueDate {
                DatePicker("Due date", selection: Binding<Date>(
                    get: { dueDate },
                    set: { newValue in self.dueDate = newValue }
                ), displayedComponents: .date)
            }
            Picker("Task Status", selection: $task.status) {
                ForEach(TaskStatus.allCases, id: \.self) { status in
                    Text(status.rawValue).tag(status)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .foregroundColor(task.completed ? .gray : .primary)
        .opacity(task.completed ? 0.5 : 1)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
