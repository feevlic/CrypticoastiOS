//
//  HomeView.swift
//  CrypticoastiOS
//
//  Created by Felix Boudnik on 17.05.23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectCoin: Coin? = nil
    @State private var showDetailView: Bool = false
    
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                homeHeader
                columnTitles
                allCoinsList
                
                Spacer(minLength: 0)
                
            }
        }
        .background(
            NavigationLink(destination: DetailLoadingView(coin: $selectCoin), isActive: $showDetailView, label: {EmptyView()})
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVm)
        
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            Spacer()
            Text("Live Prices")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .padding()
            Spacer()
        }
    }
    
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) {
                coin in CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .listRowBackground(Color.theme.background)
                    .onTapGesture {
                        seque(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func seque(coin: Coin) {
        selectCoin = coin
        showDetailView.toggle()
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
           
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
                
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
