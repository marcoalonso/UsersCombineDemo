//
//  APIService.swift
//  APICombineDemo
//
//  Created by Marco Alonso on 23/09/24.
//

import Foundation
import Combine

class APIService {
    func fetchUsers() -> AnyPublisher<[User], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

/*
 En resumen, este método hace lo siguiente:

 Crea una URL para la API de usuarios.
 Realiza una solicitud GET a esa URL.
 Toma los datos de la respuesta.
 Decodifica esos datos en un array de objetos User.
 Devuelve un publisher que emitirá ese array de usuarios o un error si algo sale mal en el proceso.

 Este enfoque utiliza Combine para manejar la asincronía de la llamada a la red de una manera declarativa y fácil de componer. Permite a los consumidores de este método (como el ViewModel) suscribirse a los resultados y reaccionar en consecuencia, ya sea mostrando los usuarios o manejando errores.
 */
