//
//  ContentView.swift
//  Button
//
//  Created by 곽보선 on 2021/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            
            //상단 status bar를 제외하고 배경 채우기
            //Color.blue
            
            //전부 채우기
            Color.blue.edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Let's make Button")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
                MyButton(title: "Click Me", iconName: "paperplane.circle").padding()
            }
           
//            MyButton(title: "Click Me", iconName: "paperplane.circle").padding()
           

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//button view
struct MyButton: View{
    var title: String
    var iconName: String
    
    var body: some View{
        Button(action:{
            print("button")
        }){
            HStack{
                Image(systemName: iconName)
                    .font(.title)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(40)
        }
    }
}
