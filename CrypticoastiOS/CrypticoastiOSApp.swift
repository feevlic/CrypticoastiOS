//
//  CrypticoastiOSApp.swift
//  CrypticoastiOS
//
//  Created by Felix Boudnik on 17.05.23.
//

import SwiftUI

@main
struct CrypticoastiOSApp: App {
    
    @State  private var  vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
