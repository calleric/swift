//
//  ThreeColumnView.swift
//  EmployeeNavigationSplitViewApp
//
//  Created by Eric Callanan on 20/11/2022.
//

import SwiftUI

struct ThreeColumnView: View {
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

struct Department: Identifiable {
    var id = UUID()
    var name: String
    var employees: [Employee]
    
    init(name: String, employees: [Employee]) {
        self.name = name
        self.employees = employees
    }
}

struct ModelThreeColumn {
    var departments: [Department]

    init() {
        departments = [
            Department(name: "Earth", employees: [
                Employee(name: "Hulk"),
                Employee(name: "Iron Man"),
                Employee(name: "Wanda")
            ]),
            Department(name: "Galaxy", employees: [
                Employee(name: "Drax"),
                Employee(name: "Gamora"),
                Employee(name: "Groot"),
                Employee(name: "Star-lord")
            ]),
            Department(name: "Asgard", employees: [
                Employee(name: "Hela"),
                Employee(name: "Loki"),
                Employee(name: "Thor")
            ]),
        ]
    }
    
    func department(id: Department.ID?) -> Department? {
        self.departments.first(where: { $0.id == id })
    }
    
    func selectedEmployees(selectedIds: Set<Employee.ID>) -> [Employee] {
        return self.departments.flatMap {
            $0.employees.filter { selectedIds.contains($0.id) }
        }
    }
}


struct ThreeColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnView()
    }
}
