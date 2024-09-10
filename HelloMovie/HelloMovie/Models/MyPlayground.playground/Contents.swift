import UIKit
import HelloMovie


for publisher in Publisher.allCases {
    print("\(publisher.rawValue)")
}


var movies: [Movie] = MovieStore.shared.movies

var filteredMovies = movies.filter { movie in
    if movie.publisher == .cjEnm {
        return true
    } else {
        return false
    }
}

filteredMovies = movies.filter { $0.publisher == .cjEnm }.sorted { $0.year > $1.year }

print(filteredMovies.count)



for movie in filteredMovies {
    print(movie.posterURL ?? "(none)")
    
    if let urlString = movie.posterURL {
        Task {
            do {
                let image: UIImage = try await UIImage.fetchImage(from: urlString)
                print(image)
            } catch {
                
            }
        }
    }
}

