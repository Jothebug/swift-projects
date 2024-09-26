//
//  ContentView.swift
//  SwiftUI Slots
//
//  Created by HaYen on 17/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var credit = 100
    
    @State var image1 = "apple"
    @State var image2 = "apple"
    @State var image3 = "apple"
    
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            VStack {
                Spacer()
                Text("SwiftUI Slots!").font(.largeTitle)
                Spacer()
                HStack {
                    Text("Credits:")
                    Text(String(credit))
                }
                Spacer()
                HStack {
                    Image(image1).resizable().aspectRatio(contentMode: .fit)
                    Image(image2).resizable().aspectRatio(contentMode: .fit)
                    Image(image3).resizable().aspectRatio(contentMode: .fit)
                }
                Spacer()
                Button("Spin"){spin()}
                .padding()
                .padding([.leading, .trailing], 40)
                .foregroundColor(.white)
                .background(Color(.systemPink))
                .cornerRadius(25)
                .font(.system(size: 18, weight: .bold, design: .default))
                Spacer()
            }
        }
    }
    
    func spin(){
        let assets = ["apple", "cherry", "star"]
        image1 = assets.randomElement()!
        image2 = assets.randomElement()!
        image3 = assets.randomElement()!
        
        if(image1 == image2 && image2 == image3) {
            credit += 15
        } else {
            if (credit >= 0) {
                credit -= 15
            }
        }
    }
}

#Preview {
    ContentView()
}
