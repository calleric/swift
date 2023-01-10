//
//  ErrorView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct ErrorView: View {
    var title: String
    var error: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20)  {
            Divider()
            Text(title).font(.largeTitle).fontWeight(.bold)
            Text("FATAL ERROR").font(.largeTitle).fontWeight(.medium).foregroundColor(.red)
            Text(error).font(.title).fontWeight(.medium).multilineTextAlignment(.leading)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(title: "Title", error: "Error description")
    }
}
