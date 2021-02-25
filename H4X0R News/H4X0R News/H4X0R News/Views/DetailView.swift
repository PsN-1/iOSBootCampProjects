//
//  DetailView.swift
//  H4X0R News
//
//  Created by Pedro Neto on 19/09/20.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "htts://www.google.com")
    }
}

