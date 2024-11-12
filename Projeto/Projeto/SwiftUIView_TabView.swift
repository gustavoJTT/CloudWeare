import SwiftUI

struct SwiftUIView_TabView: View {
    @State var TabView_nome: String = ""
    var body: some View {
        ZStack{
            TabView{
                SwiftUIView_Home().tabItem {
                    Label("primeiro", systemImage: "house")
                }
                SwiftUIView_Amigos(Amigos_nome: TabView_nome).tabItem { // adicionem as outras telas aqui, por favor
                    Label("primeira", systemImage: "house")
                }
              
            }.tint(.black)  //.toolbarBackground(Color.yellow, for: .tabBar)
            //        .onAppear(){
            //            UITabBar.appearance().backgroundColor = .blue // isso aqui vai mudar a cor da tabview, alguem acha a cor certa
            //        }.tint(.black)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SwiftUIView_TabView()
}
