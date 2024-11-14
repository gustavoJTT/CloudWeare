import SwiftUI

struct Coiso: Identifiable {
    var id: Int
    var nome: String
    var imagem: String
}

struct SwiftUIView_Adicionar: View {
    
    let rows = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    @StateObject var vm = ViewModel()
    
    @State private var menuNome: String = "Opções"
    @State var opcao = [
        Coiso(id: 1, nome: "Simples", imagem: "camisa-simples"),
        Coiso(id: 2, nome: "Manga Longa", imagem: "manga-longa"),
        Coiso(id: 3, nome: "Regata", imagem: "camisa-regata"),
        Coiso(id: 4, nome: "Camisa social", imagem: "camisa-social"),
        Coiso(id: 5, nome: "Cropped", imagem: "cropped"),
        Coiso(id: 6, nome: "Vestido", imagem: "vestido")
    ]
    @State private var cor = 0
    @State private var nomeRoupa: String = ""
    @State private var nomeEscolhido: String = ""
    @State private var corEscolhida: String = "Escolha"

    var camisas = [
        Coiso(id: 1, nome: "Simples", imagem: "camisa-simples"),
        Coiso(id: 2, nome: "Manga Longa", imagem: "manga-longa"),
        Coiso(id: 3, nome: "Regata", imagem: "camisa-regata"),
        Coiso(id: 4, nome: "Camisa social", imagem: "camisa-social"),
        Coiso(id: 5, nome: "Cropped", imagem: "cropped"),
        Coiso(id: 6, nome: "Vestido", imagem: "vestido"),
    ]
    var calcas = [
        Coiso(id: 1, nome: "Calça jeans", imagem: "calca-jeans"),
        Coiso(id: 2, nome: "Calça moletom", imagem: "calca-moletom"),
        Coiso(id: 3, nome: "Leggings", imagem: "leggings"),
        Coiso(id: 4, nome: "Calça bermuda", imagem: "bermuda"),
        Coiso(id: 5, nome: "Calça shorts", imagem: "calca-shorts")
    ]
    
   @State var cores = ["Preto", "Branco", "Cinza", "Vermelho",
                 "Rosa", "Amarelo", "Verde", "Roxo", "Laranja",
                 "Azul claro", "Azul escuro", "Marrom"]

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color("Fundo")
                .ignoresSafeArea()
            VStack {
                HStack{
                    VStack {
                        HStack {
                            Image("Logo")
                            Spacer()
                            Text("usuário")
                            Circle()
                                .frame(width: 60)
                        }
                        
                        
                        HStack {
                            Menu{
                                Button("Calças", action: trocaCalca)
                                Button("Camisas", action: trocaCamisa)
                            } label: {
                                Label("\(menuNome)", systemImage: "chevron.down")
                            }
                            .fontWeight(.bold)
                            .frame(width: 105, height: 53)
                            .background(Color("mainAzul"))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            LazyHGrid(rows: rows){
                                ForEach(opcao) { a in
                                    Button {
                                        nomeEscolhido = a.nome
                                     } label: {
                                         VStack {
                                             Image(a.imagem)
                                                 .resizable()
                                                 .scaledToFit()
                                                 .frame(width: 90)
                                                 .background(Color("backPhotos"))
                                                 .cornerRadius(7)
                                             Text(a.nome)
                                                 .foregroundColor(.black)
                                         }
                                     }
                                }
                            }
                            Spacer()
                            VStack {
                                HStack {
                                    Text("Tipo:")
                                    Spacer()
                                    Text("\(nomeEscolhido)")
                                }
                                Spacer()
                                HStack {
                                    Text("Escolha a cor:")
                                    Spacer()
                                    Menu(corEscolhida){
                                        ForEach(0..<cores.count) { y in
                                            Button {
                                                corEscolhida = cores[y]
                                            } label: {
                                                Text(cores[y])
                                            }
                                        }
                                    }
                                }
                                Spacer()
                                VStack {
                                    HStack {
                                        Text("Escolha o nome da roupa:")
                                        Spacer()
                                    }
                                    TextField("", text: $nomeRoupa)
                                        .frame(height: 30)
                                        .background(Color.white)
                                        .cornerRadius(7)
    
                                }
                                Spacer()
                            }
                            VStack {
                                Button(action: {
                                    vm.post(Roupas(tipo: nomeEscolhido, nome: nomeRoupa, cor: corEscolhida))
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Text("Salvar")
                                })
                                   .fontWeight(.bold)
                                   .frame(width: 105, height: 53)
                                   .background(Color("mainAzul"))
                                    .cornerRadius(5)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    func trocaCalca(){
        menuNome = "Calças"
        opcao = calcas
    }
    
    func trocaCamisa() {
        menuNome = "Camisas"
        opcao = camisas
    }
}

#Preview {
    SwiftUIView_Adicionar()
}
