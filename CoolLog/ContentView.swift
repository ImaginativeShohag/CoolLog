//
//  ContentView.swift
//  CoolLog
//
//  Created by Md. Mahmudul Hasan Shohag on 22/8/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mainVM = MainViewModel()
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                mainVM.callApis()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
