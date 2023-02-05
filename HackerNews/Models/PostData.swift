//
//  PostData.swift
//  HackerNews
//
//  Created by Berkin Koca on 5.02.2023.
//

import Foundation
import SwiftUI

struct Results :Decodable {
     let hits : [Post]
}

struct Post : Decodable, Identifiable {
     
     var id: String{ //When it is identifiable you need to add id
          return objectID
     }
     let objectID : String
     let points : Int
     let title : String
     let url : String?
}
