//
//  SpaceImageView.swift
//  ParsingJSON
//
//  Created by Larisa on 12.05.2021.
//

import UIKit

class SpaceImageView: UIImageView {
    
     func fetchImage(from url: String) {
        guard let imageUrl = URL(string: url) else {
            print("lol")
        image = #imageLiteral(resourceName: "picture")
        return
        }
        
        if let cachedImage = getCachedImage(from: imageUrl) {
            print("lol1")

            image = cachedImage
            return
        }
        
        ImageManager.shared.fetchImage(from: imageUrl) { (data, response) in
            self.image = UIImage(data: data)
            print("lol3")

            self.saveDataToCache(with: data, and: response)
        }
    }
        
        private func saveDataToCache(with data: Data, and response: URLResponse) {
            guard let url = response.url else { return }
            let cachedRasponse = CachedURLResponse(response: response, data: data)
            let request = URLRequest(url: url)
            URLCache.shared.storeCachedResponse(cachedRasponse, for: request)
        }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedRasponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedRasponse.data)
        }
        return nil
    }
    
}
