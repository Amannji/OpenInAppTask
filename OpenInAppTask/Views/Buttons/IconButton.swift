//
//  IconButton.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import SwiftUI

struct IconButton: View {
    var icon:String
    var body: some View {
        Button(action:{}){
            Image(icon)
        }
        .padding(10)
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray)
        }
    }
}

#Preview {
    IconButton(icon:"search")
}
