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

// Each class contatins a function that is an async GET request to retreive data from a Google Shets spreadsheet.


class Api {
    
    func getPosts(completion: @escaping (Post) -> ()) {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1kLT_bCo1MoknF1O_XzekIjHimQDQF38b3gQ9NDlWuys/values/A1:A100000?key=AIzaSyDF2A4RtSulIjXX3_FgSPuG3pmWGmEzNXY") else { return }
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
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1K1TE8zEWnvXlxF_bPIvZZnQSpc4JmP2qry8FaMeXevo/values/A1:B100000?key=AIzaSyDF2A4RtSulIjXX3_FgSPuG3pmWGmEzNXY") else { return }
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
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qs4a4laPQ6-m4zLcrcmPYX8NIKgdJp72OR_aOldbMxk/values/A1:B100000?key=AIzaSyDF2A4RtSulIjXX3_FgSPuG3pmWGmEzNXY") else { return }
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
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/14qOxvMAN0mk2ffWmNu7eW1A0j2OcsV5JoPiSt29p16w/values/A1:B100000?key=AIzaSyDF2A4RtSulIjXX3_FgSPuG3pmWGmEzNXY") else { return }
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
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1_4bNQNDwBzjuUzmvvVEEHMGXOR8TFDzYeoFa0jYpFLk/values/A1:C100000?key=AIzaSyDF2A4RtSulIjXX3_FgSPuG3pmWGmEzNXY") else { return }
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
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1VK7ByhCsZmVzkb28AABTPvnOtOAfk9i3NVRN8TsrYtQ/values/A1:D100000?key=AIzaSyDF2A4RtSulIjXX3_FgSPuG3pmWGmEzNXY") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Post.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

