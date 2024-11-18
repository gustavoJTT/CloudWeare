import SwiftUI

struct SwiftUIView_TabView: View {
    @State var TabView_nome: String = ""
    var body: some View {
        ZStack{
            TabView{
                SwiftUIView_Home(nome_Home: TabView_nome).tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                SwiftUIView_Armario(nome_Armario: TabView_nome).tabItem {
                    Label("Armário", systemImage: "door.sliding.left.hand.closed")
                }
                SwiftUIView_Amigos(Amigos_nome: TabView_nome).tabItem { // adicionem as outras telas aqui, por favor
                    Label("Amigos", systemImage: "person.2.fill")
                }
              
            }.tint(.black)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SwiftUIView_TabView()
}
