//
//  CoinImageViewModel.swift
//  CrypticoastiOS
//
//  Created by Felix Boudnik on 18.05.23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isloading: Bool = false
    
    
    private let coin: Coin
    private let dataservice: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.dataservice = CoinImageService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers(){
        dataservice.$image
            .sink{ [weak self] (_) in
                self?.isloading = false
            } receiveValue: { [weak self] (returnedImage)in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
