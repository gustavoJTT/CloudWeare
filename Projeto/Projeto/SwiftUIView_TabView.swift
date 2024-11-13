import SwiftUI

struct SwiftUIView_TabView: View {
    @State var TabView_nome: String = ""
    var body: some View {
        ZStack{
            TabView{
                SwiftUIView_Home(nome_Home: TabView_nome).tabItem {
                    Label("primeiro", systemImage: "house")
                }
                SwiftUIView_Armario(nome_Armario: TabView_nome).tabItem {
                    Label("segundo", systemImage: "house")
                }
                SwiftUIView_Amigos(Amigos_nome: TabView_nome).tabItem { // adicionem as outras telas aqui, por favor
                    Label("primeira", systemImage: "house")
                }
              
            }.tint(.black)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SwiftUIView_TabView()
}
