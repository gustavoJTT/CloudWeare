//
//  SwiftUIView_Home.swift
//  CloudWearApp
//
//  Created by Turma01-1 on 13/11/24.
//

import SwiftUI

struct SwiftUIView_Home: View {
    @State var sitacao_Climatica = "Ensolarado"
    @State var situacao_Temperatura = 24
    @State var sitacao_Climatica_maxima = 26
    @State var sitacao_Climatica_minima = 20
    @State var nome_Home: String = ""
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            ZStack{
                VStack{
                Image(.component1) // LOGO
                    Spacer()
                HStack{ // DIV CARDS
                    ZStack{ // CARDS
                        Rectangle() // RETANGULO
                            .fill(.blue900)
                            .frame(width: 178, height: 164).cornerRadius(14)
                        Rectangle() // RETANGULO
                            .fill(.backgroundCard)
                            .frame(width: 175, height: 160).cornerRadius(14)
                            
                        VStack{
                            // CONDICAO
                            
                            if (sitacao_Climatica == "Ensolarado"){
                                Image(.imagemSolENSOLARADO).resizable().frame(width: 60, height: 60)
                                Text(sitacao_Climatica).font(.title2).bold()
                            }
                            if (sitacao_Climatica == "Chuvoso"){
                                Image(.imagemNuvemCHUVOSO).resizable().frame(width: 80, height: 80)
                                Text(sitacao_Climatica).font(.title2).bold()
                            }
                        }
                    }
                    Spacer()
                    ZStack{
                        Rectangle() // RETANGULO
                            .fill(.blue900)
                            .frame(width: 178, height: 164).cornerRadius(14)
                        Rectangle()
                            .fill(.backgroundCard)
                            .frame(width: 175, height: 160).cornerRadius(14)
                        HStack{
                            Image(.imagemTermometro)
                            VStack{
                                Text("Máxima: \(sitacao_Climatica_maxima)º")
                                Text("Mínima: \(sitacao_Climatica_minima)º")
                                Text("\(sitacao_Climatica_minima)º").font(.system(size: 50))
                            }
                                
                            }
                        }
                    
                    }
                    Spacer()
                }
            }.padding()
        }
    }
}

#Preview {
    SwiftUIView_Home()
}
