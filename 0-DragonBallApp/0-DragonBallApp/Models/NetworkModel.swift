//
//  NetworkModel.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 3/11/22.
//

import Foundation


//CREMOA NUESTROS ERROR
enum NetworkError: Error {
    case malformedURL
    case dataFormatting
    case other
    case noData
    case errorCode(Int?)
    case tokenFormatError
    case decoding
}

class NetworkModel {
    //Creo variable para guardarme el token
    var token: String?
    //Creo instancia de objeto singelton
    static let shared = NetworkModel()
    private init () {
    }
    
    // MARK: - CREO LA FUNCION PARA HACER EL LOGIN Y COMPROBARLO
    //Le paso el escaping porque a lo mejor el completion tarda mas ue la vida de la funcion
    func login(user: String, password: String, completion: @escaping (String?, NetworkError?) -> Void) {
        //CREO LA URL HACIA LA API DE LOGIN y SI FALLA QUE ME DEVUELVA UN ERROR
        guard let url = URL (string: "https://vapor2022.herokuapp.com/api/auth/login") else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        //CODIFICACION DE LA URL
        //let loginString = user + ":" + password
        let loginString = String(format: "%@:%@", user, password)
        guard let loginData = loginString.data(using: .utf8) else {
            completion(nil, NetworkError.dataFormatting)
            return
        }
        let base64LoginString = loginData.base64EncodedString()
        //Creo la REQUEST
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        //MARK: Creamos el DATATASK que usa este REQUEST
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            //Compruebo que el error es nil para seguir, sino salta el error
            guard error == nil
            else {
                completion(nil, NetworkError.other)
                return
            }
            //Miramos que la data tenga contenido
            guard let data = data
            else {
                completion(nil, NetworkError.noData)
                return
            }
            //Miramos e tipo de respuesta recibido
            guard let httpResponse = (response as? HTTPURLResponse),
                  httpResponse.statusCode == 200
            else {
                completion(nil, NetworkError.errorCode((response as? HTTPURLResponse)?.statusCode))
                return
            }
            //Miramos el token
            guard let token = String(data: data, encoding: .utf8)
            else {
                completion(nil, NetworkError.tokenFormatError)
                return
            }
            //Guardo el token
            self.token = token
            //Paso el token
            completion(token, nil)
        }
        task.resume()
    }
    
    
    //MARK: - CREO FUNCION PARA LISTA DE HEROES -
    func getHeroes (name: String = "", completion: @escaping ([Hero], NetworkError?) -> Void) {
        //LLAMADA A RED
        guard let url = URL (string: "https://vapor2022.herokuapp.com/api/heros/all") else {
            completion([], NetworkError.malformedURL)
            return
        }
        //CHEQUEO TOKEN
        guard let token = self.token else {
            completion([], NetworkError.other)
            return
        }
        //Creo la REQUEST
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Necesitamos pasarle un BODY a la request
        struct Body: Encodable {
            let name: String
        }
        let body = Body(name: name)
        
        //Le pasamos el body a la request
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        
        //Vuelvo a crear la tarea para verificar todo
        //MARK: Creamos el DATATASK que usa este REQUEST
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            //Compruebo que el error es nil para seguir, sino salta el error
            guard error == nil
            else {
                completion([], NetworkError.other)
                return
            }
            //Miramos que la data tenga contenido
            guard let data = data
            else {
                completion([], NetworkError.noData)
                return
            }
            //Miramos e tipo de respuesta recibido
            guard let httpResponse = (response as? HTTPURLResponse),
                  httpResponse.statusCode == 200
            else {
                completion([], NetworkError.errorCode((response as? HTTPURLResponse)?.statusCode))
                return
            }
            
            guard let heroesResponse = try? JSONDecoder().decode([Hero].self, from: data) else {
                completion([], NetworkError.decoding)
                return
            }
            
            //Paso el token
            completion(heroesResponse, nil)
        }
        task.resume()
    }
    
    //MARK: - CREO FUNCION PARA LISTA DE HEROES -
    func getTransformation (id: String, completion: @escaping ([Transformation], NetworkError?) -> Void) {
        //LLAMADA A RED
        guard let url = URL (string: "https://vapor2022.herokuapp.com/api/heros/tranformations") else {
            completion([], NetworkError.malformedURL)
            return
        }
        //CHEQUEO TOKEN
        guard let token = self.token else {
            completion([], NetworkError.tokenFormatError)
            return
        }
        //Creo la REQUEST
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Necesitamos pasarle un BODY a la request
        struct Body: Encodable {
            let id: String
        }
        let body = Body(id: id)
        
        //Le pasamos el body a la request
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        
        //Vuelvo a crear la tarea para verificar todo
        //MARK: Creamos el DATATASK que usa este REQUEST
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            //Compruebo que el error es nil para seguir, sino salta el error
            guard error == nil
            else {
                completion([], NetworkError.other)
                return
            }
            //Miramos que la data tenga contenido
            guard let data = data
            else {
                completion([], NetworkError.noData)
                return
            }
            //Miramos e tipo de respuesta recibido
            guard let httpResponse = (response as? HTTPURLResponse),
                  httpResponse.statusCode == 200
            else {
                completion([], NetworkError.errorCode((response as? HTTPURLResponse)?.statusCode))
                return
            }
            
            guard let transformationResponse = try? JSONDecoder().decode([Transformation].self, from: data) else {
                completion([], NetworkError.decoding)
                return
            }
            
            //Paso el token
            completion(transformationResponse, nil)
        }
        task.resume()
    }
}
