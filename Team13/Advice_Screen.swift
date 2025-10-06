//
//  ContentView2.swift
//  Team13
//
//  Created by SADEEM on 10/04/1447 AH.
//
import SwiftUI

struct Advice_Screen: View {
        
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Choose words that heal,\nnot hurt...")
                    .font(.system(size: 30, design:.serif))
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                
                Text("Once spoken, they can’t\nbe taken back.")
                    .font(.system(size: 30, design:.serif))
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            Image("IMAGE")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .offset(y: 66)
            
            Spacer()
            
         
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 246/255, green: 238/255, blue: 229/255)) // F6EEE5
        .ignoresSafeArea(.all)
        
    }

    
}


#Preview {
    Advice_Screen()
}
