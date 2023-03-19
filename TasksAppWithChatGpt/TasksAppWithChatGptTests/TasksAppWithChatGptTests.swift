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

}


