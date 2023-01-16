//
//  SequentialView.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import SwiftUI

struct SequentialView: View {
    @ObservedObject private var dataFiles: DataFileViewModel3
    
    init() {
        dataFiles = DataFileViewModel3()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TitleView(title: ["Asynchronous", "(multiple Files)"])
                
                Button("Download All") {
                    Task {
                        await dataFiles.downloadFiles()
                    }
                }
                .buttonStyle(BlueButtonStyle())
                .disabled(dataFiles.isDownloading)
                
                Text("Files Downloaded: \(dataFiles.fileCount)")
                
                ForEach(dataFiles.files) { file in
                    HStack(spacing: 10) {
                        Text("File \(file.id):")
                        ProgressView(value: file.progress)
                            .frame(width: 180)
                        Text("\((file.progress * 100), specifier: "%0.0F")%")
                        
                        ZStack {
                            Color.clear
                                .frame(width: 30, height: 30)
                            if file.isDownloading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            }
                        }
                    }
                }
                .padding()
                
                Spacer().frame(height: 150)
                
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

struct SequentialView_Previews: PreviewProvider {
    static var previews: some View {
        SequentialView()
    }
}
