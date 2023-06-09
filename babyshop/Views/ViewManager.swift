//
//  ViewManager.swift
//  babyshop
//
//  Created by Jakub Górka on 04/06/2023.
//

import SwiftUI

struct ViewManager: View {
    
    @ObservedObject var system: System
    
    var body: some View {
        if system.user == nil{
            LoginView(system: system)
        }
        else{
            ShopView(system: system)
        }
    }
}
