//
//  DataFileViewMode7.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 22/01/2023.
//

import Foundation

class DataFileViewModel7: ObservableObject {
    @Published private(set) var file: DataFile
    
    init() {
        self.file = DataFile(id: 1, fileSize: 10)
    }
    
    func downloadFile() async  -> Int {
        await MainActor.run {
            file.isDownloading = true
        }
        
        while file.isDownloading {
            do {
                try await MainActor.run {
                    try Task.checkCancellation()
                    
                    print("  --   Downloading file - \(file.progress * 100) %")

                    file.increment()
                }
                usleep(300000)
            } catch {
                print(" *************** Catch - The task has been cancelled")
                // Set the isDownloading flag to false
                await MainActor.run {
                    file.isDownloading = false
                    // reset()
                }
            }
        }
        
        await MainActor.run {
            file.isDownloading = false
            print(" ***** File : \(file.id) setting isDownloading to FALSE")
        }
        
        return 1
    }
        
    @MainActor
    func reset() {
        self.file = DataFile(id: 1, fileSize: 10)
    }
}
