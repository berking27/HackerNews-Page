//
//  ContentView.swift
//  HackerNews
//
//  Created by Berkin Koca on 5.02.2023.
//

import SwiftUI

struct ContentView: View {
     
     @ObservedObject var networkManager = NetworkManager()
     
     var body: some View {
          NavigationView{
               List(networkManager.posts) { post in
                    NavigationLink(destination: DetailedView(url: post.url)) {
                         HStack {
                              Text(String(post.points))
                              Text(post.title)
                         }//Each post inside post array
                    }
               }
               .navigationTitle("Hacker News")
          }
          .onAppear {
               self.networkManager.fetchData()
          }
     }
}

struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
          ContentView()
     }
}

//let posts = [
//     Post(id: "1", title: "Hello"),
//     Post(id: "2", title: "World"),
//     Post(id: "3", title: "It's Berkin")
//]
