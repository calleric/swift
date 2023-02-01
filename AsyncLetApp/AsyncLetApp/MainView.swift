//
//  MainView.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack() {
            List {
                Section(header: Text("Synchronous")) {
                    NavigationLink (destination: SynchronousView(), label: {Text("01 Synchronous view")})
                }
                Section(header: Text("asynchronous")) {
                    NavigationLink (destination: AsynchronousView(), label: {Text("02 Asynchronous view")})
                    NavigationLink (destination: SequentialView(), label: {Text("03 Asynchronous Sequential View")})
                    NavigationLink (destination: ParallelView(), label: {Text("04 Asynchronous Parallel View")})
                }
                Section(header: Text("With Cancel")) {
                    NavigationLink (destination: NaiveCancelView(), label: {Text("05 Naive Cancel")})
                    NavigationLink (destination: CancelFlagView(), label: {Text("06 Use Cancel Flag")})
                    NavigationLink (destination: CancelTaskView(), label: {Text("07 Use Cancel Task")})
                    NavigationLink (destination: CancelTaskMultipleView(), label: {Text("08 Use Cancel Task on Multiple Files")})

                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
