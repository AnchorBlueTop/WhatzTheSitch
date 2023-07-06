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

class Api {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "HIDDEN") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

import SwiftUI


class ApiComm {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "HIDDEN") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
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
        guard let url = URL(string: "HIDDEN") else { return }
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
        guard let url = URL(string: "HIDDEN") else { return }
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
        guard let url = URL(string: "HIDDEN") else { return }
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
        guard let url = URL(string: "HIDDEN") else { return }
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
        guard let url = URL(string: "HIDDEN") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

