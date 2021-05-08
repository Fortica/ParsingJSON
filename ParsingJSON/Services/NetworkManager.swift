//
//  NetworkManager.swift
//  ParsingJSON
//
//  Created by Larisa on 05.05.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    
func fetchSpase(from url: String, completion: @escaping(Space) -> Void) {
    
    AF.request(url)
        .validate()
        .responseJSON { dataResponce in
            
            switch dataResponce.result {
            case .success(let value):
                guard let spaceData = value as? [String:Any] else { return }
                
                let space = Space(spaceData: spaceData)
                
                DispatchQueue.main.async {
                completion(space)
                }
            case .failure(let error):
                print(error)
            }
        }.resume()
        
    }
}

class ImageManager {
    
    static let shared = ImageManager()
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringUrl = url else { return nil}
        guard let imageURL = URL(string: stringUrl) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
    
}


