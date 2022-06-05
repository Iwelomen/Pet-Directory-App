//
//  CatApiService.swift
//  PetDirectoryApp
//
//  Created by Decagon on 3/29/22.
//

import Foundation

enum UserError: Error{
    case NoDataAvailable
    case cannotProcessData
    case InvaildURL
}

struct ApiService {
    static let sharedInstance = ApiService()
    let session = URLSession.shared
    let allCatURL = URL(string: "https://api.thecatapi.com/v1/breeds")
    
    func getCats(completion: @escaping(Result<[AllCat], UserError>) -> Void){
        guard let userURL =  allCatURL else{
            completion(.failure(.InvaildURL))
            return
        }
        
        let dataTask = session.dataTask(with: userURL){data, response, UserError in
            guard let data = data else {
                completion(.failure(.NoDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let user = try decoder.decode([AllCat].self, from: data)
                completion(.success(user))
                print(user)
            }
            catch{
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
    private init () {}
}
