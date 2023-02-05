//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Berkin Koca on 5.02.2023.
//

import Foundation

class NetworkManager : ObservableObject {
     
     @Published var posts = [Post]()//Whenever it changes to notify the listeners
     
     func fetchData() {
          
          if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { data, response, error in
                    if error == nil{
                         let decoder = JSONDecoder()
                         if let safeData = data{
                              do {
                                   let results = try decoder.decode(Results.self, from: safeData)
                                   DispatchQueue.main.sync {
                                        self.posts = results.hits
                                   }
                              } catch{
                                   print(error)
                              }
                         }
                    }
               }
               task.resume()
          }//We're going to request from this url
     }
}
