//
//  DataFileViewModel6.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 22/01/2023.
//

import Foundation

class DataFileViewModel6: ObservableObject {
    @Published private(set) var file: DataFile
    
    @MainActor var cancelFlag = false
    
    init() {
        self.file = DataFile(id: 1, fileSize: 10)
    }
    
    func downloadFile() async -> Int {
        await MainActor.run {
            file.isDownloading = true
        }
        
        while await !cancelFlag, file.isDownloading {
            await MainActor.run {
                print("  --   Downloading file - \(file.progress * 100) %")
                file.increment()
            }
            usleep(300000)
        }
        
        await MainActor.run {
            file.isDownloading = false
            print(" ***** File : \(file.id) setting isDownloading to FALSE")
        }
        
        return 1
    }
  
    @MainActor
    func cancel() {
        self.cancelFlag = true
        print(" ***** File : \(file.id) setting cancelFlag to TRUE")
        self.reset()
    }
        
    @MainActor
    func reset() {
        self.file = DataFile(id: 1, fileSize: 10)
        self.cancelFlag = false
    }
}
