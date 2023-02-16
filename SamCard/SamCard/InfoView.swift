//
//  InfoView.swift
//  SamCard
//
//  Created by sam gomez on 05/02/23.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.blue)
            .frame(height: 50)
            .foregroundColor(.blue)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Text(text).foregroundColor(.white)
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hola", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
