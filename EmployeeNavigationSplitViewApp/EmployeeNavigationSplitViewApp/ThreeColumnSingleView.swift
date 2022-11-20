//
//  ThreeColumnSingleView.swift
//  EmployeeNavigationSplitViewApp
//
//  Created by Eric Callanan on 20/11/2022.
//

import SwiftUI

struct ThreeColumnSingleView: View {
    @State private var departmentId: Department.ID? // Single selection.
    @State private var employeeId: Employee.ID? // Single Employee selection.
    
    var body: some View {
        NavigationSplitView() {
            List(model.departments, selection: $departmentId) { department in
                Text(department.name)
            }
        } content: {
            if let department = model.department(id: departmentId) {
                List(department.employees, selection: $employeeId) { employee in
                    Text(employee.name)
                }
            } else {
                Text("Select a department")
            }
        } detail: {
             EmployeeDetails(for: employeeId)
        }
    }
}

fileprivate var model = ModelThreeColumn()

@ViewBuilder
fileprivate func EmployeeDetails(for employeeId: Employee.ID?) -> some View {
    VStack {
        if let employee = model.selectedEmployee(selectedId: employeeId) {
            Text("\(employee.name)")
                .font(.system(size: 100, design:.rounded))
        } else {
            Text("Select Employee")
        }
    }
}

extension ModelThreeColumn {
    func selectedEmployee(selectedId: Employee.ID?) -> Employee? {
        for dept in self.departments {
            if let emp = dept.employees.first(where: { $0.id == selectedId }) {
                return emp
            }
        }
        return nil
    }
}



struct ThreeColumnSingleView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnSingleView()
    }
}
