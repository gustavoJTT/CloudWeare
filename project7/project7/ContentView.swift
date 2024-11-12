//
//  ContentView.swift
//  project7
//
//  Created by Turma01-5 on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            SwiftUIView_Amigos().tabItem { // adicionem as outras telas aqui, por favor
                Text("primeira")
                Image(systemName:"house")
            }
        }.onAppear(){
            UITabBar.appearance().backgroundColor = .blue // isso aqui vai mudar a cor da tabview, alguem acha a cor certa
        }.tint(.black)
    }
}

#Preview {
    ContentView()
}
