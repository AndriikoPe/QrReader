//
//  ContentView.swift
//  QrReader
//
//  Created by Пермяков Андрей on 03.11.2022.
//

import SwiftUI
import CodeScanner

struct ScannedCodesList: View {
  @EnvironmentObject private var scannerVm: QrViewModel
  
  var body: some View {
    NavigationView {
      List {
        ForEach(scannerVm.codes) {
          Text($0.text)
        }
      }
      .sheet(isPresented: $scannerVm.shouldShowScanner) {
        CodeScannerView(
          codeTypes: [.qr],
          completion: scannerVm.handleScan
        )
      }
      .navigationTitle("Scanned QR codes")
      .toolbar {
        Button {
          scannerVm.pluseTapped()
        } label: {
          Image(systemName: "plus")
        }
      }
    }
  }
}
