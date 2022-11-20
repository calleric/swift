//
//  ThreeColumnDepartmentView.swift
//  EmployeeNavigationSplitViewApp
//
//  Created by Eric Callanan on 20/11/2022.
//

import SwiftUI

struct ThreeColumnDepartmentView: View {
    @State private var departmentId: Department.ID? // Single selection.
    @State private var employeeIds: Set<Employee.ID> = [] // Multiple selection.
    
    var body: some View {
        NavigationSplitView() {
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
            EmployeeDetails(by: departmentId, for: employeeIds)
        }
    }
}

fileprivate var model = ModelThreeColumn()

@ViewBuilder
fileprivate func EmployeeDetails(by departmentId: Department.ID?,
                                 for employeeIds: Set<Employee.ID>) -> some View {
    VStack {
        ForEach (model.selectedEmployees(departmentId: departmentId,
                                         employeeIds: employeeIds) ) {
            Text("\($0.name)")
                .font(.system(size: 100, design:.rounded))
        }
    }
}

extension ModelThreeColumn {
    func selectedEmployees(departmentId: Department.ID?,
                           employeeIds: Set<Employee.ID>) -> [Employee] {
        var matchedEmployees: [Employee] = []
        if let dept = self.departments.first(where: { $0.id == departmentId }) {
            matchedEmployees = dept.employees.filter { employeeIds.contains($0.id) }
        }
        return matchedEmployees
    }
}

struct ThreeColumnDepartmentView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnDepartmentView()
    }
}
