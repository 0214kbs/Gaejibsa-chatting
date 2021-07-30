//
//  ContentView.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

import SwiftUI
import UIKit
import Firebase

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack{
                AppTitle1
            }
        }
        
        ZStack{
            VStack{
              //  Chat()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension ContentView{
    var AppTitle1: some View{
        
        VStack{
            Text("개집사")
                .font(.title)
                .fontWeight(.medium)
                .padding()
            
        }
        .frame(maxHeight: 150, alignment: .center)
    }
}
