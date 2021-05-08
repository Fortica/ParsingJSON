//
//  InfoViewController.swift
//  ParsingJSON
//
//  Created by Larisa on 03.05.2021.
//

import Alamofire

class InfoViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    var spaces: [Space] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchInfo(from: URLApi.json.rawValue )
    }
    
    private func fetchInfo(from url: String) {
        NetworkManager.shared.fetchSpase(from: url) { space in
            self.textView.text = String("Data: \(space.date ?? "") \n\nName: \(space.title ?? "") \n\n\(space.explanation ?? "")")
        }
    }
    

}

