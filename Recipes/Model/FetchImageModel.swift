//
//  fetchImageModel.swift
//  Recipes
//
//  Created by Buse Karabıyık on 18.07.2023.
//

import UIKit

struct FetchImageModel {
    
    func setImage(_ urlString: String, imageView: UIImageView) {
        fetchImage(from: urlString) { data in
            if let safeData = data {
                
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: safeData)
                }
                
            } else {
                print("Error loading image")
            }
        }
    }
    
    func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        
       let url = URL(string: urlString)
       let session = URLSession.shared
        if let safeUrl = url {
            let dataTask = session.dataTask(with: safeUrl) { data, response, error in
                if let e = error {
                    print(e.localizedDescription)
                    completionHandler(nil)
                } else {
                    completionHandler(data)
                }
            }
            dataTask.resume()
        }
    }
    
}
