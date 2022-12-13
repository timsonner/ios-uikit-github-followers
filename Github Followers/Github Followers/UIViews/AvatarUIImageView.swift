//
//  AvatarUIImageView.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/25/22.
//

import UIKit

class AvatarUIImageView: UIImageView {
    // Set location of placeholder image.
    let avatarPlaceholderImage = UIImage(named: "avatar-placeholder")
    // Set cache for loading images.
    let cache = NetworkSingleton.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUIImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUIImageView() {
        layer.cornerRadius = 10
        clipsToBounds = true
        // Set the default image to the placeholder image.
        image = avatarPlaceholderImage
        // Stroyboard hack.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(urlString: String) {
        // Can a valid URL be created from the url string?
        guard let url = URL(string: urlString) else {
            // Valid URL could not be created.
            return
        }
        
        // Create a cache key from the unique URL string.
        if let image = cache.object(forKey: NSString(string: urlString)) {
            // Image was in cache, set UIImageView to image.
            self.image = image
            // Image was in cache, no need to make network call. Return from downloadImage() without downloading an image.
            return
        }
        
        // On error, display the placeholder image for a cell and return.
        let task = URLSession.shared.dataTask(with: url)  { [weak self] (data, response, error) in
            guard let self = self else {
                return
            }
            
            // Was an error returned?
            if error != nil {
                return
            }
            
            // Is response status code 200?
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            // Was data returned?
            guard let data = data else {
                return
            }
            
            // Can an image be created from the data?
            guard let image = UIImage(data: data) else {
                return
            }
            
            // Add dowloaded image to network singleton cache.
            self.cache.setObject(image, forKey: NSString(string: urlString))
            
            // Switch to main thread to update UI.
            DispatchQueue.main.async {
                self.image = image
            }
        }
        // Run the network call.
        task.resume()
    }
}
