//
//  ContentView.swift
//  SamCard
//
//  Created by sam gomez on 04/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.18, blue: 0.24)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("baldur")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("Sam Gomez")
                    .font(Font.custom("Righteous-Regular", size: 40))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                Text("IOS Developer")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                Divider()
                InfoView(text: "+52 442 747 19 50", imageName: "phone.fill")
                InfoView(text: "samgomezs7@hotmail.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


