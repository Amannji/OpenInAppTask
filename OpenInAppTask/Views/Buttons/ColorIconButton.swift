//
//  ColorIconButton.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import SwiftUI

struct ColorIconButton: View {
    var bgColor: Color
    var borderColor: Color
    var icon: String
    var label: String
    var body: some View {
        VStack{
            Button(action:{}){
                HStack(spacing: 20){
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25,height:25)
                    Text(label)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Spacer()
                }

            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(bgColor)
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    
                    .stroke(borderColor, lineWidth: 1)
            }
        
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    ColorIconButton(bgColor: .lightBlue, borderColor: .blue, icon: "copy", label: "Copy this")
}
