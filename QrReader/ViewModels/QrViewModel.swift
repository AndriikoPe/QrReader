//
//  QrViewModel.swift
//  QrReader
//
//  Created by Пермяков Андрей on 03.11.2022.
//

import SwiftUI
import CodeScanner

final class QrViewModel: ObservableObject {
  @Published var codes = [QrCodeModel]()
  @Published var shouldShowScanner = false
  
  func handleScan(result: Result<ScanResult, ScanError>) {
    shouldShowScanner = false
    switch result {
    case .failure(let scanError):
      print(scanError.localizedDescription)
    case .success(let scanResult):
      codes.append(QrCodeModel(text: scanResult.string))
    }
  }
  
  func pluseTapped() {
    shouldShowScanner = true
  }
}
