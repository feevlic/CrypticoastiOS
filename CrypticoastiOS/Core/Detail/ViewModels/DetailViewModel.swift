//
//  DetailViewModel.swift
//  CrypticoastiOS
//
//  Created by Felix Boudnik on 19.05.23.
//

import Foundation
import Combine
class CoinDetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink{ (returnedCoinDetails) in
                print("Recieve")
                print(returnedCoinDetails)
                
            }
            .store(in: &cancellables)
    }
}
