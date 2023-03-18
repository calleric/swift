//
//  TasksAppWithChatGptTests.swift
//  TasksAppWithChatGptTests
//
//  Created by Eric Callanan on 17/03/2023.
//

import XCTest
@testable import TasksAppWithChatGpt

class TaskViewModelTests: XCTestCase {
    
    func testAddTask() {
        let task = Task(title: "Example Task", dueDate: Date(), status: .notStarted)
        let viewModel = TaskViewModel(task: task)
        let initialCount = viewModel.tasks.count
        
        viewModel.addTask()
        
        XCTAssertEqual(viewModel.tasks.count, initialCount + 1)
    }
    
//    func testDeleteTask() {
//        let viewModel = TaskViewModel()
//        viewModel.addTask()
//        let initialCount = viewModel.tasks.count
//
//        guard let task = viewModel.tasks.first else {
//            XCTFail("Unable to retrieve first task")
//            return
//        }
//
//        viewModel.deleteTask(task)
//
//        XCTAssertEqual(viewModel.tasks.count, initialCount - 1)
//    }
    
//    func testUpdateTask() {
//        let viewModel = TaskViewModel()
//        viewModel.addTask()
//
//        guard let task = viewModel.tasks.first else {
//            XCTFail("Unable to retrieve first task")
//            return
//        }
//
//        let newTitle = "New Title"
//        let newDescription = "New Description"
//        let newDueDate = Date().addingTimeInterval(3600)
//        let newStatus = TaskStatus.inProgress
//
//        viewModel.updateTask(task: task, title: newTitle, description: newDescription, dueDate: newDueDate, status: newStatus)
//
//        XCTAssertEqual(task.title, newTitle)
//        XCTAssertEqual(task.description, newDescription)
//        XCTAssertEqual(task.dueDate, newDueDate)
//        XCTAssertEqual(task.status, newStatus)
//    }
    
//    func testToggleTaskStatus() {
//        let viewModel = TaskViewModel()
//        viewModel.addTask()
//
//        guard let task = viewModel.tasks.first else {
//            XCTFail("Unable to retrieve first task")
//            return
//        }
//
//        let initialStatus = task.status
//
//        viewModel.toggleTaskStatus(task: task)
//
//        let newStatus = task.status
//
//        switch initialStatus {
//        case .notStarted:
//            XCTAssertEqual(newStatus, TaskStatus.inProgress)
//        case .inProgress:
//            XCTAssertEqual(newStatus, TaskStatus.complete)
//        case .complete:
//            XCTFail("Invalid initial status: \(initialStatus)")
//        }
//    }
}



class TaskTests: XCTestCase {
    
    var task: Task!
    
    override func setUp() {
        super.setUp()
        task = Task(title: "Test Task", dueDate: Date(), status: .notStarted)
    }
    
    override func tearDown() {
        task = nil
        super.tearDown()
    }
    
    func testTaskEquality() {
        let task1 = Task(title: "Test Task", dueDate: Date(), status: .notStarted)
        let task2 = Task(title: "Test Task", dueDate: Date(), status: .notStarted)
        XCTAssertEqual(task1, task2)
    }
    
    func testTaskInequality() {
        let task1 = Task(title: "Test Task 1", dueDate: Date(), status: .notStarted)
        let task2 = Task(title: "Test Task 2", dueDate: Date(), status: .notStarted)
        XCTAssertNotEqual(task1, task2)
    }
    
    func testTaskStatusUpdates() {
        XCTAssertEqual(task.status, .notStarted)
        task.status = .inProgress
        XCTAssertEqual(task.status, .inProgress)
        task.status = .complete
        XCTAssertEqual(task.status, .complete)
    }
    
//    func testTaskEditable() {
//        task.edit(title: "New Title", dueDate: nil, status: .inProgress)
//        XCTAssertEqual(task.title, "New Title")
//        XCTAssertNil(task.dueDate)
//        XCTAssertEqual(task.status, .inProgress)
//    }
}
