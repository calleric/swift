//
//  CancelTaskView.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 22/01/2023.
//

import SwiftUI

struct CancelTaskView: View {
    @ObservedObject private var dataFiles: DataFileViewModel7
    @State var fileCount = 0
    
    @State var fileDownloadTask: Task<Void, Error>?
    
    init() {
        dataFiles = DataFileViewModel7()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TitleView(title: ["Cancel Task", "", "<checkCancellation()>"])
                
                HStack {
                    Button("Download All") {
                        fileDownloadTask = Task {
                            let num = await dataFiles.downloadFile()
                            fileCount += num
                        }
                    }
                    .buttonStyle(BlueButtonStyle())
                    .disabled(dataFiles.file.isDownloading)
                    Button("Cancel") {
                        fileDownloadTask?.cancel()
                    }
                    .buttonStyle(BlueButtonStyle())
                    .disabled(!dataFiles.file.isDownloading)
                }
                
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
                
                .onDisappear {
                    fileDownloadTask?.cancel()
                    dataFiles.reset()
                }
                
                Spacer().frame(height: 200)
                
                Button("Reset") {
                    fileDownloadTask?.cancel()
                    dataFiles.reset()
                }
                .buttonStyle(BlueButtonStyle())
                
                Spacer()
            }
            .padding()
        }
    }
}



struct CancelTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CancelTaskView()
    }
}
