//
//  ContentView.swift
//  Save images to macOS file system
//
//  Xcode version 13.4 (13F17a)
//  Swift version 5
//
//  Created by Eric Callanan on 21/05/2022.
//

/// Setup steps:
/// 1. Enable the User Selected File Read/Write entitlement for the App
/// 2. Add a selection of images to the App Assets


import SwiftUI

struct ContentView: View {
    @State private var selectedImage = 1
    
    private var images: [String] = ["cake", "mountain", "coffee", "trees"]
    
    func showSavePanel() -> URL? {
        let savePanel = NSSavePanel()
        savePanel.allowedContentTypes = [.png]
        savePanel.canCreateDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.title = "Save your image"
        savePanel.message = "Choose a folder and a name to store the image."
        savePanel.nameFieldLabel = "Image file name:"
        
        let response = savePanel.runModal()
        return response == .OK ? savePanel.url : nil
    }
    
    func savePNG(imageName: String, path: URL) {
        let image = NSImage(named: imageName)!
        let imageRepresentation = NSBitmapImageRep(data: image.tiffRepresentation!)
        let pngData = imageRepresentation?.representation(using: .png, properties: [:])
        do {
            try pngData!.write(to: path)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 214/255, green: 232/255, blue: 248/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:20) {
                Text("Saving Image to File System")
                    .foregroundColor(.blue)
                    .font(.title)
                    .fontWeight(.bold)
                
                Image(images[selectedImage])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400, alignment: .center)
                
                HStack {
                    Button("Change Image") {
                        selectedImage = (selectedImage + 1) % images.count
                    }
                    .buttonStyle(BlueButtonStyle())
                    
                    Button("Save Image") {
                        if let url = showSavePanel() {
                            savePNG(imageName: images[selectedImage], path: url)
                        }
                    }
                    .buttonStyle(BlueButtonStyle())
                }
                
                Spacer()
            }
            .padding(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18, weight:.bold, design: .rounded))
            .foregroundColor(.white)
            .frame(width: 180)
            .padding(5)
            .background(Color.blue.opacity(0.8))
            .cornerRadius(12)
            .shadow(color: .black, radius: 3, x: 2, y: 2)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


