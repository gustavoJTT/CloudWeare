import SwiftUI

struct globalVariable {
    public static var usrName = ""
}

struct ContentView: View {
    @State private var Inicial_nome: String = ""
    @State private var isSaved: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("Inicio")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Text("Insira seu nome")
                        .font(.headline)
                    
                    TextField("Nos diga seu nome", text: $Inicial_nome)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    if !isSaved {
                        Button("Salvar") {
                            globalVariable.usrName = Inicial_nome
                            isSaved = true
                        }
                        .padding(.top)
                    }
                    
                    if isSaved {
                        NavigationLink {
                            SwiftUIView_TabView()
                        } label: {
                            Text("Entrar")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
