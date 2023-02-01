//
//  DataFile.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import SwiftUI

struct DataFile : Identifiable, Equatable {
    var id: Int
    var fileSize: Int
    var downloadedSize = 0
    var isDownloading = false
    
    init(id: Int, fileSize: Int) {
        self.id = id
        self.fileSize = fileSize
    }
    
    var progress: Double {
        return Double(self.downloadedSize) / Double(self.fileSize)
    }
    
    mutating func increment() {
        if downloadedSize < fileSize {
            downloadedSize += 1
        } else {
            isDownloading = false
        }
    }
}
