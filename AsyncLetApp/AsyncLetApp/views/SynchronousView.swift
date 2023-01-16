//
//  SynchronousView.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import SwiftUI

struct SynchronousView: View {
    @ObservedObject private var dataFiles: DataFileViewModel
    
    init() {
        dataFiles = DataFileViewModel()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TitleView(title: ["Synchronous"])
                
                Button("Download All") {
                    dataFiles.downloadFile()
                }
                .buttonStyle(BlueButtonStyle())
                .disabled(dataFiles.file.isDownloading)
                
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

struct SynchronousView_Previews: PreviewProvider {
    static var previews: some View {
        SynchronousView()
    }
}
