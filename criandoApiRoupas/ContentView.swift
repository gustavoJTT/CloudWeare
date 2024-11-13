import SwiftUI

struct ContentView: View {
    @State private var nome: String = ""
    @State private var cor: String = ""
    @State private var tipo: String = ""
    var body: some View {
        VStack {
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
            Button(action: {post(Roupas(tipo:tipo, nome: nome, cor: cor))}, label: {
                Text("btn")
            })
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
