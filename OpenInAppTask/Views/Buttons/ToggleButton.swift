//
//  ToggleButton.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import SwiftUI

struct ToggleButton: View {
    var tag:Int
    var title: String
    
    @Binding var selectedTab:Int
    
    var body: some View {
        Button(action:{selectedTab = tag}){
            RoundedRectangle(cornerRadius: 25)
                .fill(selectedTab == tag ? .blue : .lightBackground)
                .overlay{
                    Text(title)
                        .foregroundStyle(selectedTab == tag ? .white : .gray)
        
                }
        }
    }
}

#Preview {
    ToggleButton(tag:0, title:"Top Links",selectedTab: .constant(0))
}
