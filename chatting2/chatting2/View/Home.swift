//
//  Home.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

import SwiftUI
import Foundation


struct Home: View {
    //
//    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
        //

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
            .background(Color("Color"))
            // ///////////////////////////////////////////////////////////////
//            GeometryReader{ reader in
//                ScrollView{
//                    let columns = [GridItem(.flexible(minimum: 10))]
//                    LazyVGrid(columns: columns, spacing: 0){
//                        ForEach(homeData.msgs) { message in
//                            let isReceived = message.type == .Received
//                            HStack{
//                                ZStack{
//                                    Text(message.text)
//                                        .padding(.horizontal)
//                                        .padding(.vertical, 12)
//                                        .background(isReceived ? Color.black.opacity(0.2) : .green.opacity(0.9))
//                                }
//                                .frame(width: viewWidth * 0.7, alignmnet: isReceived ? .leading : .trailing)
//                                .padding(.vertical)
//                                .background(Color.blue)
//                            }
//                            .frame(maxWidth: .infinity, alignmnet: isReceived ? .leading : .trailing)
//                            .id(message.id)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
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
//            .offset(y: kGuardian.slide).animation(.easeInOut(duration: 1.0))
            .animation(.default)
            .padding()
        }
        .onAppear(perform:{
            homeData.onAppear()
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}
