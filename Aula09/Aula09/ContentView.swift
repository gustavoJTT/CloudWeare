//
//  ContentView.swift
//  Aula09
//
//  Created by Turma01-6 on 06/11/24.
//

import SwiftUI

struct Coiso : Identifiable {
    var id: Int
    var nome: String
    var imagem: String
}



struct ContentView: View {
    
    let rows = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    
    @State private var menuNome: String = "Opções"
    @State var opcao = [
        Coiso(id: 1, nome: "", imagem: "icon-image")
    ]
    @State private var opRoupa: String = ""
    @State private var cor = 0
    @State private var nomeRoupa: String = ""
    
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
                            Circle()
                                .frame(width: 60)
                            Text("úsuario")
                            Spacer()
                            Image("Logo")
                        }
                        HStack {
                            Menu(menuNome) {
                                Button("Calças",action: trocaCalca)
                                Button("Camisas",action: trocaCamisa)
                            }.fontWeight(.bold)
                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .frame(width: 95, height: 50)
                            .background(Color("mainAzul"))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            LazyHGrid(rows:rows){
                                ForEach(opcao) { a in
                                    Button(action: escolhido){
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
                            VStack {
                                HStack {
                                    Text("Escolha a cor:")
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
                                        Spacer()
                                    }
                                    TextField("", text: $nomeRoupa)
                                        .frame(height: 30)
                                        .background(Color.white)
                                    
                                }
                            }
                            
                        }
                    }.padding()
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
    
    func escolhido() {
      //  opRoupa = nome
    }
}


#Preview {
    ContentView()
}
