//
//  EditableTaskView.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 19/03/2023.
//

import SwiftUI

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

struct EditableTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTaskView(task: .constant(
            Task(title: "task 42",
                 dueDate: Date(),
                 status: .inProgress)
        ))
    }
}
