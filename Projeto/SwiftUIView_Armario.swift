import SwiftUI

struct SwiftUIView_Armario: View {
    @State var nome_Armario: String = ""
    @State  var RecebeGloabl = ""
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ZStack{
            Color(.C_BG).ignoresSafeArea()
            ScrollView{
                VStack{
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
                    }
                    Text("Seu armario").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    HStack{
                        Text("Camisas").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            ForEach(vm.roupas, id: \.self){ roupa in
                                if roupa.tipo == "Simples" || roupa.tipo == "Manga Longa" || roupa.tipo == "Regata" || roupa.tipo == "Camisa social" || roupa.tipo == "Cropped"{
                                    VStack{
                                        Image("Camisa")
                                        Text(roupa.nome!).bold()
                                        Text(roupa.tipo!)
                                        Text(roupa.cor!)
                                    }.frame(width: 150,height: 170).background(.azulclaro).cornerRadius(20)
                                }
                            }
                        }
                    })
                    
                    HStack{
                        Text("Vestidos").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            
                            ForEach(vm.roupas, id: \.self){ roupa in
                                if roupa.tipo == "Vestido" {
                                    VStack{
                                        Image("vestido")
                                        Text(roupa.nome!).bold()
                                        Text(roupa.tipo!)
                                        Text(roupa.cor!)
                                    }.frame(width: 150,height: 170).background(.azulclaro).cornerRadius(20)
                                }
                            }
                            
                        }
                    })
                    HStack{
                        Text("Calcas").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            
                            ForEach(vm.roupas, id: \.self){ roupa in
                                if roupa.tipo == "Calça jeans" || roupa.tipo == "Calça moletom" || roupa.tipo == "Leggings"{
                                    VStack{
                                        Image("Calca")
                                        Text(roupa.nome!).bold()
                                        Text(roupa.tipo!)
                                        Text(roupa.cor!)
                                    }.frame(width: 150,height: 170).background(.azulclaro).cornerRadius(20)
                                }
                            }
                        }
                        
                    })
                    HStack{
                        Text("Bermuda/Short").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            
                            ForEach(vm.roupas, id: \.self){ roupa in
                                if roupa.tipo == "Calça bermuda" || roupa.tipo == "Calça shorts"{
                                    
                                    
                                    VStack{
                                        Image("Calca")
                                        Text(roupa.nome!).bold()
                                        Text(roupa.tipo!)
                                        Text(roupa.cor!)
                                    }.frame(width: 150,height: 170).background(.azulclaro).cornerRadius(20)
                                }
                            }
                        }
                        
                    })
                }.padding()
            }
            
            VStack{
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    NavigationLink {
                        SwiftUIView_Adicionar()
                    } label: {
                        Text("+")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.mainAzul)
                            .cornerRadius(100)
                            .padding()
                    }
                }
            }
        }.onAppear(){
            RecebeGloabl = globalVariable.usrName
            vm.fetch()
        }
    }
}

#Preview {
    SwiftUIView_Armario()
}
