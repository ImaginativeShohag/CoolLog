//
//  MainScreen.swift
//  CoolLog
//
//  Created by Md. Mahmudul Hasan Shohag on 22/8/22.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var mainVM = MainViewModel()

    var body: some View {
        Text("Hello, Cool Log!")
            .padding()
            .onAppear {
                mainVM.callApis()
            }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
