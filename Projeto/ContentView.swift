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
                    Text("Insira seu nome:")
                        .font(.headline)
                    
                    TextField("Nos diga seu nome", text: $Inicial_nome)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    NavigationLink(destination: SwiftUIView_TabView()) {
                        Text("Salvar")
                            .fontWeight(.bold)
                            .frame(width: 105, height: 53)
                            .background(Inicial_nome.isEmpty ? Color.gray : Color("mainAzul"))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    .disabled(Inicial_nome.isEmpty)
                    .simultaneousGesture(TapGesture().onEnded {
                        if !Inicial_nome.isEmpty {
                            globalVariable.usrName = Inicial_nome
                        }
                    })
                    
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
