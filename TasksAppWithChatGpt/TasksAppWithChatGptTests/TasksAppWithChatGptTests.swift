//
//  TasksAppWithChatGptTests.swift
//  TasksAppWithChatGptTests
//
//  Created by Eric Callanan on 17/03/2023.
//

import XCTest
@testable import TasksAppWithChatGpt

class TaskViewModelTests: XCTestCase {
    var viewModel: TaskViewModel!
    
    override func setUp() {
        viewModel = TaskViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
    }

    func testAddTask() {
        let initialCount = viewModel.tasks.count
        viewModel.tasks.append(Task(title: "New Task", dueDate: Date(), status: "Not started"))
        let finalCount = viewModel.tasks.count
        XCTAssertEqual(finalCount, initialCount + 1)
    }

    func testToggleCompleted() {
        let task = Task(title: "Task", dueDate: Date(), status: "In progress")
        viewModel.tasks.append(task)
        viewModel.tasks[0].completed.toggle()
        XCTAssertTrue(viewModel.tasks[0].completed)
    }

    func testDueDateAndStatus() {
        let task = Task(title: "Task", dueDate: Date(), status: "In progress")
        viewModel.tasks.append(task)
        XCTAssertNotNil(viewModel.tasks[0].dueDate)
        XCTAssertEqual(viewModel.tasks[0].status, "In progress")
    }

}


