//
//  ContentView.swift
//  AutoPasteBrowser
//
//  Created by w-iijima on 2020/05/08.
//  Copyright © 2020 omuriceman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    let webView = WebView(web: nil, url: URL(string: "https://www.deepl.com/ja/translator")!)
    
    var body: some View {
        VStack(alignment: .leading) {
            webView
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in

                guard let copyText = UIPasteboard.general.value(forPasteboardType: "public.text") as! String? else { return }
                let replaceText = copyText.replacingOccurrences(of: "'", with: "\\'").filter { !"\n\t\r".contains($0) }

                if(self.text != replaceText){
                    self.text = replaceText
                    self.webView.evaluateJavaScript("LMT_WebTranslator_Instance.publicInterface.setSourceText(\'\(self.text)\')")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
