//
//  ThreeColumnVisibilityView.swift
//  EmployeeNavigationSplitViewApp
//
//  Created by Eric Callanan on 20/11/2022.
//

import SwiftUI

struct ThreeColumnVisibilityView: View {
    @State private var departmentId: Department.ID? // Single selection.
    @State private var employeeIds: Set<Employee.ID> = [] // Multiple selection.
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(model.departments, selection: $departmentId) { department in
                Text(department.name)
            }
        } content: {
            if let department = model.department(id: departmentId) {
                List(department.employees, selection: $employeeIds) { employee in
                    Text(employee.name)
                }
            } else {
                Text("Select a department")
            }
        } detail: {
             EmployeeDetails(for: employeeIds)
        }
    }
}

fileprivate var model = ModelThreeColumn()

@ViewBuilder
fileprivate func EmployeeDetails(for employeeIds: Set<Employee.ID>) -> some View {
    VStack {
        ForEach (model.selectedEmployees(selectedIds: employeeIds) ) {
            Text("\($0.name)")
                .font(.system(size: 100, design:.rounded))
        }
    }
}

struct ThreeColumnVisibilityView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnVisibilityView()
    }
}
