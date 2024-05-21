//
//  BasicIconButton.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import SwiftUI

struct LongIconButton: View {
    var icon:String
    var label: String
    var body: some View {
        VStack{
            Button(action:{}){
                HStack(spacing: 20){
                    Image(icon)
                    Text(label)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()

            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            }
        
            
        }
        
        
    }
}

#Preview {
    LongIconButton(icon:"price-boost",label:"Sample Button")
}
