//
//  AppTabView.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import SwiftUI

struct AppTabView: View {
    
    var body: some View {
        VStack{
            LinksView()
                .padding(.bottom,-150)
            CustomTabbar()
                .shadow(radius: 3)
                
        }
    }
    

    struct CustomTabbar: View{
        @State var selectedTab: Int = 0
        var body: some View{
            HStack(spacing:15){
                TabbarItem(icon: "link", label: "Links", tag:0, selectedTab: $selectedTab)
                TabbarItem(icon: "Files", label: "Courses", tag:1, selectedTab: $selectedTab)
                
                Button(action:{}){
                    Circle()
                        .fill()
                        .shadow(color:Color.blue.opacity(0.5),radius: 2,y:2)
                        .frame(width:60)
                        .overlay{
                            Image(systemName:"plus")
                                .foregroundColor(.white)
                                .font(.title)
                                
                        }
                    
                }
                .offset(y:-25)
                
                TabbarItem(icon: "Media", label: "Campaign",tag:2, selectedTab: $selectedTab)
                TabbarItem(icon: "Generic", label: "Profile", tag:3, selectedTab: $selectedTab)
                
            }
            
            .frame(maxWidth: .infinity)
            .padding(.vertical,30)
            .background(.white)
            .clipShape(TabBarShape())
            .offset(y:40)
            
        }
    }
    
    struct TabbarItem: View{
        var icon: String
        var label: String
        var tag: Int
        @Binding var selectedTab:Int
        var body: some View{
            Button(action:{}){
                VStack{
                Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30,height:30)
                Text(label)
                        .foregroundStyle(selectedTab == tag ? .black : .secondary )
                }
            }
        }
    }
    
    
    
}



#Preview {
    AppTabView()
}
