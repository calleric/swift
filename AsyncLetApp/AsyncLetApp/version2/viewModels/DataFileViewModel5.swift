//
//  DataFileViewModel5.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 22/01/2023.
//

import Foundation

class DataFileViewModel5: ObservableObject {
    @Published private(set) var file: DataFile
    
    init() {
        self.file = DataFile(id: 1, fileSize: 10)
    }
    
    func downloadFile() async -> Int {
        await MainActor.run {
            file.isDownloading = true
        }
        
        for _ in 0..<file.fileSize {
            await MainActor.run {
                guard file.isDownloading else { return }
                file.increment()
                print("  --   Downloading file - \(file.progress * 100) %")
            }
            usleep(300000)
        }
        
        await MainActor.run {
            file.isDownloading = false
            print(" ***** File : \(file.id) setting isDownloading to FALSE")
        }
        
        return 1
    }
    
    func cancel() {
        file.isDownloading = false
        self.file = DataFile(id: 1, fileSize: 10)
    }
        
    func reset() {
        self.file = DataFile(id: 1, fileSize: 10)
    }
}
