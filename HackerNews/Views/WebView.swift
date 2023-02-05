//
//  WebView.swift
//  HackerNews
//
//  Created by Berkin Koca on 5.02.2023.
//

import Foundation
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable{
     let urlString : String?
     
     func makeUIView(context: Context) -> WKWebView {
          return WKWebView()
     }
     
     func updateUIView(_ uiView: WKWebView, context: Context) {
          if let urlString = urlString {
               if let url = URL(string: urlString){
                    let request = URLRequest(url: url)
                    uiView.load(request)
               }
          }
     }
}
