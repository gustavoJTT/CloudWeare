import SwiftUI

struct Coiso : Identifiable {
    var id: Int
    var nome: String
    var imagem: String
}



struct SwiftUIView_Adicionar: View {
    @State  var RecebeGloabl = ""
    
    let rows = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    
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
    
    var body: some View {
        ZStack {
            Color("Fundo")
                .ignoresSafeArea()
            VStack {
                HStack{
                    VStack {
                        HStack {
                            Image("component1")
                            Spacer()
                            Text(RecebeGloabl)
                            Circle()
                                .frame(width: 60)
                        }
                        
                        
                        HStack {
                            Menu{
                                Button("Calças",action: trocaCalca)
                                Button("Camisas",action: trocaCamisa)
                            }label: {
                                Label("\(menuNome)",systemImage: "chevron.down")
                            }.fontWeight(.bold)
                                .frame(width: 105, height: 53)
                                .background(Color("mainAzul"))
                                .cornerRadius(5)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            LazyHGrid(rows:rows){
                                ForEach(opcao) { a in
                                    Button {
                                        nomeEscolhido = a.nome
                                     } label: {
                                         VStack{
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
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("\(nomeEscolhido)")
                                }
                                Spacer()
                                HStack {
                                    Text("Escolha a cor:")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Picker("Escolha a cor", selection: $cor) {
                                        ForEach(0..<cores.count, id: \.self) {
                                            Text(cores[$0])
                                        }
                                        
                                    }.pickerStyle(.menu)
                                }
                                Spacer()
                                VStack {
                                    HStack {
                                        Text("Escolha o nome da roupa:")
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    TextField("Digite aqui", text: $nomeRoupa)
                                        .frame(height: 30)
                                        .background(Color.white)
                                        .cornerRadius(7)
    
                                }
                                Spacer()
                            }
                            //Spacer()
                            VStack{
                                Button("Salvar",action: escolhido)
                                    .fontWeight(.bold)
                                    .frame(width: 105, height: 53)
                                    .background(Color("mainAzul"))
                                    .cornerRadius(5)
                                    .foregroundColor(.white)
                            }.padding()
                            
                        }
                    }
                    .padding()
                }
            }.onAppear(){
                RecebeGloabl = globalVariable.usrName
               // print(teste2.usrName)
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
    
    func escolhido() {
        
    }
}


#Preview {
    SwiftUIView_Adicionar()
}
