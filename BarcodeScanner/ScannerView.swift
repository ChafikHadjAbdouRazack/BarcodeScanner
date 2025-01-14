//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Chafik HADJ ABDOU RAZACK on 14/01/2025.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    @Binding var scannedBarcode: String
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(ScannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(ScannerView: ScannerView) {
            self.scannerView = ScannerView
        }
        func didFind(barcode: String) {
            scannerView.scannedBarcode = barcode
            print("Barcode: \(barcode)")
        }
        
        func didSurface(error: CameraError) {
            print("Error: \(error)")
        }
    }
    
}

#Preview {
    ScannerView(scannedBarcode: .constant(""))
}
