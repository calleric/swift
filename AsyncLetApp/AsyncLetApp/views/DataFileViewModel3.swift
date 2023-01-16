//
//  DataFileViewModel3.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import Foundation

class DataFileViewModel3: ObservableObject {
    @Published private(set) var files: [DataFile]
    @Published private(set) var fileCount = 0
    
    init() {
        files = [
            DataFile(id: 1, fileSize: 10),
            DataFile(id: 2, fileSize: 20),
            DataFile(id: 3, fileSize: 5)
        ]
    }
    
    var isDownloading : Bool {
        files.filter { $0.isDownloading }.count > 0
    }
    
    func downloadFiles() async {
        for index in files.indices {
            let num = await downloadFile(index)
            await MainActor.run {
                fileCount += num
            }
        }
    }
    
    private func downloadFile(_ index: Array<DataFile>.Index) async -> Int {
        await MainActor.run {
            files[index].isDownloading = true
        }
        
        for _ in 0..<files[index].fileSize {
            await MainActor.run {
                files[index].increment()
            }
            usleep(300000)
        }
        await MainActor.run {
            files[index].isDownloading = false
        }
        return 1
    }
    
    func reset() {
        files = [
            DataFile(id: 1, fileSize: 10),
            DataFile(id: 2, fileSize: 20),
            DataFile(id: 3, fileSize: 5)
        ]
    }
}
