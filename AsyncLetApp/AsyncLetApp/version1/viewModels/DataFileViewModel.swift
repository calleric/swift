//
//  DataFileViewModel.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import Foundation


class DataFileViewModel: ObservableObject {
    @Published private(set) var file: DataFile
    
    init() {
        self.file = DataFile(id: 1, fileSize: 10)
    }
    
    func downloadFile() {
        file.isDownloading = true
        
        for _ in 0..<file.fileSize {
            file.increment()
            usleep(300000)
        }
        
        file.isDownloading = false
    }
    
    func reset() {
        self.file = DataFile(id: 1, fileSize: 10)
    }
}
