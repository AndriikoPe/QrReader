//
//  QrReaderApp.swift
//  QrReader
//
//  Created by Пермяков Андрей on 03.11.2022.
//

import SwiftUI

@main
struct QrReaderApp: App {
  @StateObject private var scannerModel = QrViewModel()
  
  var body: some Scene {
    WindowGroup {
      ScannedCodesList()
        .environmentObject(scannerModel)
    }
  }
}
