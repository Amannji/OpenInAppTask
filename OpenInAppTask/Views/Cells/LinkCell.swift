//
//  LinkCell.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import SwiftUI

struct LinkCell: View {
    var data: LinkModel
    
    var formatedDate: String{
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM yyyy"
        
        if let date = inputFormatter.date(from: data.createdAt) {
                    return outputFormatter.string(from: date)
                } else {
                    return "Invalid Date"
                }
    }
    
  
    var body: some View {
        
        
        VStack{
            HStack{
                AsyncImage(url: URL(string:data.originalImage)){ image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:80,height:70)
                    
                }
                .overlay{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke()
                        .opacity(0.1)
                }
                
                    
                VStack(alignment:.leading,spacing:10){
                    Text(data.title)
                               .lineLimit(1)
                               .truncationMode(.tail)
                               
                               .font(.title3)
                    Text(formatedDate)
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                Spacer()
                VStack(spacing:15){
                    Text("\(data.totalClicks)")
                        .font(.system(size:20,weight: .semibold))
                    Text("Clicks")
                        .foregroundStyle(.gray)
                }
                
            }
            .padding()
            HStack{
                Text(data.webLink)
                    .lineLimit(1)
                    .foregroundStyle(.blue)
                Spacer()
                Image("copy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:20,height:20)
            }
            .padding()
            .background(.lightBlue)
            .overlay{
                CurvedCornerShape()
                    .stroke(Color.blue,style: StrokeStyle(lineWidth:2,dash:[5,10]))
            }
            .clipShape(CurvedCornerShape())
            

        }
        .background(.white)
        
    }
}

#Preview {
    LinkCell(data: sampleData)
}
