//
//  InfoViewController.swift
//  ParsingJSON
//
//  Created by Larisa on 03.05.2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInfo()
    }
    
    private func fetchInfo() {
        guard let url = URL(string: URLExamples.jsonApi.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let spase = try JSONDecoder().decode(Spase.self, from: data)
                DispatchQueue.main.async { 
                    self.textView.text = "\nData: \(spase.date ?? "")\nName of object: \(spase.title ?? "")\n \n\(spase.explanation ?? "")"
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }

}
