//
//  Home.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeData = HomeModel()
    @AppStorage("current_user") var user = ""
    @State var scrolled = false
    
    var body: some View {
        
        VStack(spacing: 0){
            
            //Top NavBar
            HStack{
                Text("개집사")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color("color"))
            
            
            
            ScrollViewReader{reader in
                ScrollView{
                    VStack(spacing: 15){
                        ForEach(homeData.msgs){msg in
                            ChatRow(chatData: msg)
                        }
                    }
                    .padding(.vertical)
                }
            }

        }
        .onAppear(perform:{
            homeData.onAppear()
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}
