import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State private var nome: String = ""
    @State private var cor: String = ""
    @State private var tipo: String = ""
    var body: some View {
        VStack {
            ForEach(vm.roupas, id: \.self){ r in
                HStack{
                    
                    Text(r.nome!).foregroundColor(.black)
                    Spacer()
                    
                }
            }
            
            
            TextField(
                "Digite o tipo",
                text: $tipo
            )
            TextField(
                "Digite o nome",
                text: $nome
            )
            TextField(
                "Digite a cor",
                text: $cor
            )
            Button(action: {vm.post(Roupas(tipo:tipo, nome: nome, cor: cor))}, label: {
                Text("btn")
            })
            
        }.onAppear(){
            vm.fetch()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
