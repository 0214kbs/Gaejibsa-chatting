//
//  Home.swift
//  chattingFinal
//
//  Created by 곽보선 on 2021/08/06.
//

import SwiftUI
import Foundation
import Combine

struct Home: View {


    @StateObject var homeData = HomeModel()
    @AppStorage("current_user") var user = ""
    @State var scrolled = false
    
    var body: some View {
        
        VStack(spacing: 0){
            
            //Top NavBar
            HStack{
                Button(action: {
                }) {
                    Image(systemName: "arrow.left")
                }

                Text("상대방 이름")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            
            MyButton(title: "산책 시작").padding()
            
            ScrollViewReader{reader in
                ScrollView{
                    VStack(spacing: 15){
                        ForEach(homeData.msgs){msg in
                            ChatRow(chatData: msg)
                                .onAppear{
                                    //First Time Scroll
                                    if msg.id == self.homeData.msgs.last!.id && scrolled{
                                        
                                        reader.scrollTo(homeData.msgs.last!.id,anchor: .bottom)
                                        scrolled = true
                                    }
                                }
                        }
                        .onChange(of: homeData.msgs, perform: {value in
                            
                            reader.scrollTo(homeData.msgs.last!.id,anchor: .bottom)
                        })
                    }
                    .padding(.vertical)
                }
            }

            HStack(spacing: 15){
                TextField("Enter Message", text: $homeData.txt)
                    .padding(.horizontal)
                    //Fixed Height for Animation
                    .frame(height: 45)
                    .background(Color.primary.opacity(0.06))
                    .clipShape(Capsule())
                
                if homeData.txt != ""{
                    Button(action: homeData.writeMsg, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                            .frame(width: 45, height: 45)
                            .background(Color("Color"))
                            .clipShape(Circle())
                    })
                }
            }
            .animation(.default)
            .padding()
        }
        .onAppear(perform:{
            homeData.onAppear()
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct MyButton: View{
    var title: String
    
    var body: some View{
        Button(action:{
        }){
            HStack{
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title)
                    .minimumScaleFactor(0.5)
            }
            .padding()
            .frame(width: 300, height: 30)
            .foregroundColor(.black)
            .background(Color.yellow)
            .cornerRadius(40)
        }
    }
}


