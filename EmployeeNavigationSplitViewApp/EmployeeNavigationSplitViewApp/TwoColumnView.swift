//
//  TwoColumnView.swift
//  EmployeeNavigationSplitViewApp
//
//  Created by Eric Callanan on 20/11/2022.
//

import SwiftUI

struct TwoColumnView: View {
    @State private var employeeIds: Set<Employee.ID> = []
    
    var body: some View {
        NavigationSplitView {
            List(model.employees, selection: $employeeIds) { employee in
                Text(employee.name)
            }
        } detail: {
            EmployeeDetails(for: employeeIds)
        }
    }
}

fileprivate var model = ModelTwoColumn()

@ViewBuilder
fileprivate func EmployeeDetails(for employeeIds: Set<Employee.ID>) -> some View {
    VStack {
        ForEach (model.selectedEmployees(selectedIds: employeeIds) ) {
            Text("\($0.name)")
                .font(.system(size: 100, design:.rounded))
        }
    }
}

struct Employee: Identifiable {
    var id = UUID()
    var name: String
}

struct ModelTwoColumn {
    var employees: [Employee]

    init() {
        employees = [
            Employee(name: "Iron Man"),
            Employee(name: "Hulk"),
            Employee(name: "Wanda"),
            Employee(name: "Groot"),
            Employee(name: "Black Widow")
        ]
    }
    
    func selectedEmployees(selectedIds: Set<Employee.ID>) -> [Employee] {
        employees.filter { selectedIds.contains($0.id) }
    }
}


struct TwoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnView()
    }
}
