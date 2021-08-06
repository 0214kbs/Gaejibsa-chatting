//
//  ChatBubble.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/31.
//

import SwiftUI

//말풍선모양
struct ChatBubble: Shape{
    
    var myMsg : Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners:
                                    [.topLeft,.topRight, myMsg ? .bottomLeft : .bottomRight],cornerRadii: CGSize(width: 15, height: 15))
        
        return Path(path.cgPath)
    }
}
