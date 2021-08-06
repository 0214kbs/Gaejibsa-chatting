//
//  Home.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
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
                
                // 상대방을 설정할 수 있도록 하면 상대방이름이 뜨도록 하려고 했는데 실패
                //Text("상대방 이름")
                Text("김철수")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
            
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            
            
            //산책시작 버튼
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

            
            // 문자 쳐서 보내는 코드
            // TextField에 "Enter Message"가 나와있고 글자 하나라도 치면 옆에 paperplane 아이콘이 뜸
            // 해당 아이콘 누르면 "writeMsg" 수행
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


