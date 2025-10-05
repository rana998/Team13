//
//  ContentView2.swift
//  Team13
//
//  Created by SADEEM on 10/04/1447 AH.
//
// test
import SwiftUI

struct Advice_Screen: View {
    @State private var selectedTab: String = "Advice" // التاب الافتراضي
    
    private let tabIconSize: CGFloat = 20
    
    var body: some View {
        VStack {
            Spacer()
            
            // النصوص
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
            
            // صورة الشخصية
            Image("IMAGE")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .offset(y: 110)
            
            Spacer()
            
         
        }
        .background(Color(red: 246/255, green: 238/255, blue: 229/255)) // F6EEE5
        .edgesIgnoringSafeArea(.bottom)
        
    }

    
}


#Preview {
    Advice_Screen()
}
