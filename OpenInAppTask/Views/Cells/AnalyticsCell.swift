//
//  AnalyticsCell.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import SwiftUI

struct AnalyticsCell: View {
    var icon: String
    var title: String
    var label: String
    var color: Color
    
    var body: some View {
        VStack(alignment:.leading,spacing:15){
            Circle()
                .fill(color)
                .frame(width:50,height:50)
                .overlay{
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:25,height:25)
                }
            
            Text(title)
                .font(.title2)
                .lineLimit(1)
                .truncationMode(.tail)
                .bold()
            
            Text(label)
                .foregroundStyle(.gray)
        }
        
        
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 15)
                .stroke()
                .opacity(0.1)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15 ))
        .padding([.vertical,.trailing])
        
    }
}

#Preview {
    AnalyticsCell(icon:"pin",title:"123",label:"Today's clicks",color:.lightBlue)
}
