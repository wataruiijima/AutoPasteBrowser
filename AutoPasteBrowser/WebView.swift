//
//  WebView.swift
//  AutoPasteBrowser
//
//  Created by w-iijima on 2020/05/08.
//  Copyright © 2020 omuriceman. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    var url: URL?
    var webView: WKWebView?

    init(web: WKWebView?, url: URL) {
        self.webView = WKWebView()
        self.url = url
    }
    
    func makeUIView(context:Context) -> WKWebView {
        return webView!
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if (url != nil){
            uiView.load(URLRequest(url: url!))
        }
    }
        
    func load(url:URL?){
        if (url != nil){
            webView?.load(URLRequest(url: url!))
        }
    }
    
    
    func goBack(){
        webView?.goBack()
    }
    
    func goForward(){
        webView?.goForward()
    }
    
    func evaluateJavaScript(_ javaScriptString: String){
        webView?.evaluateJavaScript(javaScriptString, completionHandler: nil)
        
    }
}

