//
//  ImageViewController.swift
//  ParsingJSON
//
//  Created by Larisa on 03.05.2021.
//

import Alamofire

class ImageViewController: UIViewController {

    @IBOutlet var imageView: SpaceImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImageView(from: URLApi.json.rawValue)
        
    }
    
    private func fetchImageView(from url: String) {
        NetworkManager.shared.fetchSpase(from: url) { space in
            self.imageView.fetchImage(from: space.url ?? "")
            self.activityIndicator.stopAnimating()
        }
    }





}
