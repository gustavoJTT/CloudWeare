import SwiftUI

struct Usuario: Decodable, Hashable{
    let nomeUsu: String?
    let fotoPerfil: String?
    let idade: Int?
    let amigos: [Amigo]
    let camisas: [Roupa]
    let calcas: [Roupa]
    let bermudas: [Roupa]
}

struct Amigo: Decodable, Hashable{
    let nome: String?
    let foto: String?
}

struct Roupa: Decodable, Hashable{
    let nome: String?
    let tipo: String?
    let cor: String?
}

var usu = [Usuario(nomeUsu: "Icaro", fotoPerfil: "https://uploads.metroimg.com/wp-content/uploads/2023/12/05134510/Nicolas-Cage-1.jpg", idade: 19, amigos: [Amigo(nome: "Asaph", foto: "https://uploads.metroimg.com/wp-content/uploads/2023/12/05134510/Nicolas-Cage-1.jpg"),Amigo(nome: "Icaro", foto: "https://sm.ign.com/ign_br/cover/n/nicolas-ca/nicolas-cage_eyk4.jpg"), Amigo(nome:"Isabella", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: ""), Amigo(nome: "nome", foto: "")], camisas: [Roupa(nome: "Morbid Angel", tipo: "Normal", cor: "Preta"), Roupa(nome: "Open the Coffin", tipo: "Normal", cor: "Preta"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor")], calcas: [Roupa(nome: "calca coisa", tipo: "dijians", cor: "azul"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor"),Roupa(nome: "Nome", tipo: "Tipo", cor: "Cor")], bermudas: [Roupa(nome: "Bermuda", tipo: "bermuda", cor: "bermuda"),Roupa(nome: "Bermuda", tipo: "bermuda", cor: "bermuda"),Roupa(nome: "Bermuda", tipo: "bermuda", cor: "bermuda"),Roupa(nome: "Bermuda", tipo: "bermuda", cor: "bermuda"),Roupa(nome: "Bermuda", tipo: "bermuda", cor: "bermuda")])]

struct SwiftUIView_Amigos: View {
    @State var Amigos_nome: String = ""
    @State private var searchText = ""
    @State  var RecebeGloabl = ""
    
    var body: some View {
        ZStack{
            Color(.C_BG).ignoresSafeArea()
            VStack{
                ScrollView{
                    HStack{
                        Image(.component1)
                        Spacer()
                        ForEach(usu, id: \.self){ p in
                            let url = URL(string: p.fotoPerfil!)
                        
                            Text(RecebeGloabl)
                            HStack{
                                AsyncImage(url: url, content: { returnedImage in returnedImage.resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                }, placeholder: {
                                    Color.gray
                                }).frame(width: 70, height: 70).cornerRadius(100)
                            }
                        }
                    }.padding(.horizontal)
                    Text("Amigos").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
//                    NavigationView{
//                        ZStack{
//                            Color(.corFundo).ignoresSafeArea()
//                        }
//                    }
                    .navigationTitle("Amigos")
                    .searchable(text: $searchText)
                    ForEach(usu, id: \.self) { usuario in
                        ForEach(usuario.amigos, id: \.self) { p in
                            let url = URL(string: p.foto!)
                            VStack{
                                HStack{
                                    AsyncImage(url: url, content: { returnedImage in returnedImage.resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    }, placeholder: {
                                        Color.gray
                                    }).frame(width: 70, height: 70).cornerRadius(100)
                                    Text(p.nome!)
                                    Spacer()
                                }.background(Color.cinza).cornerRadius(50)
                                Spacer()
                            }
                        }

                    }.padding(.horizontal)
                }
            }
        }.onAppear(){
            RecebeGloabl = globalVariable.usrName
           // print(teste2.usrName)
        }
    }
}

#Preview {
    SwiftUIView_Amigos()
}
