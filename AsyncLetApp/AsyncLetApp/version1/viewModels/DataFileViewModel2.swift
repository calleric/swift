//
//  DataFileViewModel2.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import Foundation

class DataFileViewModel2: ObservableObject {
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
                file.increment()
            }
            usleep(300000)
        }
        
        await MainActor.run {
            file.isDownloading = false
        }
        
        return 1
    }
    
    func reset() {
        self.file = DataFile(id: 1, fileSize: 10)
    }
}
