//
//  Api_Usuarios.swift
//  CloudWearApp
//
//  Created by Turma01-1 on 11/11/24.
//

import Foundation

func enviarMensagem() {
    // 1. Para onde estou enviando a carta?
    let url = URL(string: "http://192.168.128.73:1880/postCloudWear")!

    // 2. O que está escrito na carta?
    let mensagem: [String: Any] = ["Nome": "João", "Idade": 10]

    // 3. Colocar a carta no envelope e preparar o envio.
    var envelope = URLRequest(url: url)
    envelope.httpMethod = "POST" // Estou enviando a carta.
    envelope.setValue("application/json", forHTTPHeaderField: "Content-Type")

    // 4. Transformar a carta em algo que o carteiro entende (JSON).
    envelope.httpBody = try? JSONSerialization.data(withJSONObject: mensagem)

    // 5. O carteiro leva a carta e espera uma resposta.
    URLSession.shared.dataTask(with: envelope) { data, response, error in
        if let erro = error {
            print("Algo deu errado: \(erro)")
            return
        }

        // Se chegou uma resposta, tentamos ler o que está escrito.
        if let dados = data {
            print("Resposta recebida!")
        }
    }.resume() // O carteiro começa a trabalhar.
}

