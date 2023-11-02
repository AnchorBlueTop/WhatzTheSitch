//
//  Data.swift
//  WhatzTheSitch
//
//  Created by Harshil Patel on 12/02/22.
//

import SwiftUI

struct Post: Codable {
    let range: String
    let majorDimension: String
    let values: [[String]]
}

// Each class serves as an API endpoint to retreive data from a Google Sheets spreadsheet.


class Api {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/API_KEY_HIDDEN") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

class ApiComm {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/API_KEY_HIDDEN") else { return }
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

class ApiVax {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1fktqHEnKjaX8RhtJW7CPYDAkmTRrD7WBVKCzDvK7Jdk/values/A1:D300000?key=AIzaSyDF2A4RtSulIjXX3_FgSPuG3pmWGmEzNXY") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

class ApiBorder {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/API_KEY_HIDDEN") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

class ApiTests {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/API_KEY_HIDDEN") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

class ApiLocation {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/API_KEY_HIDDEN") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

class ApiEthnicity {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/API_KEY_HIDDEN") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

