//
//  searchBar.swift
//  chatting2
//
//  Created by 곽보선 on 2021/08/06.
//

import SwiftUI

struct searchBar: View{
    
    @Binding var text : String
    @State var editText : Bool = false
    
    var body: some View{
    
        HStack{
        
            TextField("Search.. ",text: self.$text)
                .padding(15)
                .padding(.horizontal, 15)
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .overlay(
                    HStack{
                        Spacer()
                        
                        if self.editText{
                            Button(action: {
                                self.editText = false
                                self.text = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color(.black))
                                    .padding()
                            }
                        }else{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.black))
                                .padding()
                        }
                    }
                ).onTapGesture {
                    self.editText = true
                }
        }
    }
}
