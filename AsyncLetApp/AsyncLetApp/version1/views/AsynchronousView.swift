//
//  AsynchronousView.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import SwiftUI

struct AsynchronousView: View {
    @ObservedObject private var dataFiles: DataFileViewModel2
    @State var fileCount = 0
    
    init() {
        dataFiles = DataFileViewModel2()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TitleView(title: ["Asynchronous"])
                
                Button("Download All") {
                    Task {
                        let num = await dataFiles.downloadFile()
                        fileCount += num
                    }
                }
                .buttonStyle(BlueButtonStyle())
                .disabled(dataFiles.file.isDownloading)
                
                Text("Files Downloaded: \(fileCount)")
                
                HStack(spacing: 10) {
                    Text("File 1:")
                    ProgressView(value: dataFiles.file.progress)
                        .frame(width: 180)
                    Text("\((dataFiles.file.progress * 100), specifier: "%0.0F")%")
                    
                    ZStack {
                        Color.clear
                            .frame(width: 30, height: 30)
                        if dataFiles.file.isDownloading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                    }
                }
                .padding()
                
                Spacer().frame(height: 200)
                
                Button("Reset") {
                    dataFiles.reset()
                }
                .buttonStyle(BlueButtonStyle())
                
                Spacer()
            }
            .padding()
        }
    }
}

struct AsynchronousView_Previews: PreviewProvider {
    static var previews: some View {
        AsynchronousView()
    }
}
