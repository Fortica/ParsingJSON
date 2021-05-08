//
//  ImageViewController.swift
//  ParsingJSON
//
//  Created by Larisa on 03.05.2021.
//

import Alamofire

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchInfo(from: URLApi.json.rawValue)
        
        
    }
    
    private func fetchInfo(from url: String?) {
        NetworkManager.shared.fetchSpase(from: url ?? "") { space in
            guard let imageData = ImageManager.shared.fetchImage(from: space.url) else { return }
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: imageData)
            self.activityIndicator.stopAnimating()
        }
        }
    }
        




}
