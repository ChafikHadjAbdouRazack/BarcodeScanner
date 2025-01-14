//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Chafik HADJ ABDOU RAZACK on 13/01/2025.
//

import SwiftUI

struct BarcodeScannerView: View {
    @State private var scannedBarcode = ""
    @State private var showAlert = false
    var body: some View {
    
        
        NavigationView {
            VStack {
                ScannerView(scannedBarcode: $scannedBarcode).frame(width: .infinity, height: 300).foregroundColor(.red)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder").font(.title)
                
                Text(scannedBarcode.isEmpty ? "Nothing scanned yet" : scannedBarcode  ).bold().foregroundColor(scannedBarcode.isEmpty ? .red : .green).padding()
                
                Button("Show Alert") { showAlert.toggle() }
            }.navigationTitle("Barcode Scanner")
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Barcode Scanned"), message: Text(scannedBarcode), dismissButton: .default(Text("OK")))
                }
        }
       
    }
}

#Preview {
    BarcodeScannerView()
}
