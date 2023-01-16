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
                NavigationLink (destination: SynchronousView(), label: {Text("01 Synchronous view")})
                NavigationLink (destination: AsynchronousView(), label: {Text("02 Asynchronous view")})
                NavigationLink (destination: SequentialView(), label: {Text("03 Asynchronous Sequential View")})
                NavigationLink (destination: ParallelView(), label: {Text("04 Asynchronous Parallel View")})
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
