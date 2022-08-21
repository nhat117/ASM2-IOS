//
//  LinkView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 20/08/2022.
//

import SwiftUI
import AVKit
import WebKit

struct YoutubeVideoView: UIViewRepresentable {
    
    var youtubeVideoID: String
    
    func makeUIView(context: Context) -> WKWebView  {
        
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        let path = "https://www.youtube.com/embed/\(youtubeVideoID)"
        guard let url = URL(string: path) else { return }
        
        uiView.scrollView.isScrollEnabled = true
        uiView.load(.init(url: url))
    }
}
