//
//  AudiModelGridView.swift
//  AudiSwiftUIApp
//
//  Created by jcruzsa on 29/11/22.
//

import SwiftUI
import Kingfisher

struct AudiModelGridView: View {
    @State var audiModel: AudiCarModel
    
    var body: some View {
        VStack {
            if let strUrl = audiModel.imageUrl,
               let url = URL(string: strUrl)  {
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Text("Test")
            }
        }
    }
}

struct AudiModelGridView_Previews: PreviewProvider {
    static var previews: some View {
        AudiModelGridView(audiModel: AudiCarModel())
    }
}
