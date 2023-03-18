//
//  TaskTests.swift
//  TasksAppWithChatGptTests
//
//  Created by Eric Callanan on 18/03/2023.
//

import XCTest
@testable import TasksAppWithChatGpt

class TaskTests: XCTestCase {
    
    // Test task creation
    func testTaskCreation() {
        let title = "Test Task"
        let dueDate = Date()
        let status: TaskStatus = .notStarted
        
        let task = Task(title: title, dueDate: dueDate, status: status)
        
        XCTAssertEqual(task.title, title)
        XCTAssertEqual(task.dueDate, dueDate)
        XCTAssertEqual(task.status, status)
        XCTAssertFalse(task.completed)
    }
    
    // Test task completion
    func testTaskCompletion() {
        var task = Task(title: "Test Task", dueDate: nil, status: .notStarted)
        
        XCTAssertFalse(task.completed)
        
        task.completed = true
        
        XCTAssertTrue(task.completed)
    }
    
    // Test task status updates
    func testTaskStatusUpdates() {
        var task = Task(title: "Test Task", dueDate: nil, status: .notStarted)
        
        XCTAssertEqual(task.status, .notStarted)
        
        task.status = .inProgress
        
        XCTAssertEqual(task.status, .inProgress)
        
        task.status = .complete
        
        XCTAssertEqual(task.status, .complete)
    }
    
    // Test task equality
    func testTaskEquality() {
        let id1 = UUID()
        let id2 = UUID()
        
        let task1 = Task(id: id1, title: "Task 1", dueDate: nil, status: .notStarted)
        let task2 = Task(id: id2, title: "Task 2", dueDate: nil, status: .notStarted)
        let task3 = Task(id: id1, title: "Task 1", dueDate: nil, status: .notStarted)
        
        XCTAssertNotEqual(task1, task2)
        XCTAssertNotEqual(task2, task3)
        XCTAssertEqual(task1, task3)
    }

}

