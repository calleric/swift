//
//  CancelTaskMultipleView.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 22/01/2023.
//

import SwiftUI

struct CancelTaskMultipleView: View {
    @ObservedObject private var dataFiles: DataFileViewModel8
    
    @State var fileDownloadTask: Task<Void, Error>?
    
    init() {
        dataFiles = DataFileViewModel8()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TitleView(title: ["Cancel Task", "", "<Task.isCancelled>"])
                
                HStack {
                    Button("Download All") {
                        fileDownloadTask = Task {
                            await dataFiles.downloadFiles()
                        }
                    }
                    .buttonStyle(BlueButtonStyle())
                    .disabled(dataFiles.isDownloading)
                    
                    Button("Cancel") {
                        fileDownloadTask?.cancel()
                    }
                    .buttonStyle(BlueButtonStyle())
                    .disabled(!dataFiles.isDownloading)
                }
                
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
                
                .onDisappear {
                    fileDownloadTask?.cancel()
                    dataFiles.reset()
                }
                
                Spacer().frame(height: 150)
                
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


struct CancelTaskMultipleView_Previews: PreviewProvider {
    static var previews: some View {
        CancelTaskMultipleView()
    }
}
