//
//  ContentView.swift
//  babyshop
//
//  Created by Jakub Górka on 30/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var system: System = System()
    
    var body: some View {
        ViewManager(system: system)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
