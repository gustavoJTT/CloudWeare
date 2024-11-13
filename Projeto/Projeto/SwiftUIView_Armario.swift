import SwiftUI

struct SwiftUIView_Armario: View {
    @State var nome_Armario: String = ""
    @State  var RecebeGloabl = ""

    
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
                            ForEach(usu, id: \.self){ p in
                                ForEach(p.camisas, id: \.self){ camisa in
                                    VStack{
                                        Image("Camisa")
                                        Text(camisa.nome!).bold()
                                        Text(camisa.tipo!)
                                        Text(camisa.cor!)
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
                            ForEach(usu, id: \.self){ p in
                                ForEach(p.calcas, id: \.self){ camisa in
                                    VStack{
                                        Image("Calca")
                                        Text(camisa.nome!).bold()
                                        Text(camisa.tipo!)
                                        Text(camisa.cor!)
                                    }.frame(width: 150,height: 170).background(.azulclaro).cornerRadius(20)
                                }
                            }
                        }
                    })
                    HStack{
                        Text("Bermuda").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            ForEach(usu, id: \.self){ p in
                                ForEach(p.bermudas, id: \.self){ camisa in
                                    VStack{
                                        Image("Calca")
                                        Text(camisa.nome!).bold()
                                        Text(camisa.tipo!)
                                        Text(camisa.cor!)
                                    }.frame(width: 150,height: 170).background(.azulclaro).cornerRadius(20)
                                }
                            }
                        }
                    })
                }.padding()
            }
        }.onAppear(){
            RecebeGloabl = globalVariable.usrName
           // print(teste2.usrName)
        }
    }
}

#Preview {
    SwiftUIView_Armario()
}
