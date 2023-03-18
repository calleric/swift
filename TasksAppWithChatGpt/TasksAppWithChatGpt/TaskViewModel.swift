//
//  TaskViewModel.swift
//  TasksAppWithChatGpt
//
//  Created by Eric Callanan on 17/03/2023.
//

import Foundation


class TaskViewModel: ObservableObject, Identifiable {
    let id = UUID()
    static func == (lhs: TaskViewModel, rhs: TaskViewModel) -> Bool {
        return lhs.task == rhs.task
    }
    
    @Published var tasks: [Task] = []
    
    private var task: Task
    
    var title: String {
        get { task.title }
        set { task.title = newValue }
    }
    
    var dueDate: Date? {
        get { task.dueDate }
        set { task.dueDate = newValue }
    }
    
    var status: TaskStatus {
        get { task.status }
        set { task.status = newValue }
    }
    
    var completed: Bool {
        get { task.status == .complete }
        set { task.status = newValue ? .complete : .notStarted }
    }
    
    init(task: Task) {
        self.task = task
    }
    
    func copy() -> TaskViewModel {
        return TaskViewModel(task: Task(id: task.id, title: task.title, dueDate: task.dueDate, status: task.status))
    }
    
    func addTask() {
        tasks.append(task)
    }
    
    func removeTask() {
        tasks.removeAll(where: { $0.id == task.id })
    }
    
    func updateTask() {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
        }
    }
}
