//
//  DataFileViewModel4.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import Foundation

class DataFileViewModel4: ObservableObject {
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
        async let num1 = await downloadFile(0)
        async let num2 = await downloadFile(1)
        async let num3 = await downloadFile(2)
        
        let (result1, result2, result3) = await (num1, num2, num3)
        await MainActor.run {
            fileCount = result1 + result2 + result3
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
