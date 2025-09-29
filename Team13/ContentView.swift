//
//  ContentView.swift
//  Team13
//
//  Created by Rana Mohsen Bin Madhi on 04/04/1447 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var reflectionText: String = ""
    let backgroundColor = Color(red: 246/255, green: 238/255, blue: 229/255)

    
    var body: some View {
        ZStack {
            // الخلفية F6EEE5
            Color(red: 246/255, green: 238/255, blue: 229/255)
                .ignoresSafeArea()
            
            VStack {
                // شريط علوي فيه زر الرجوع والنص والتأكيد
                HStack {
                    Button(action: {
                        // اكشن الرجوع
                    }) {
                        Image(systemName: "arrow.uturn.backward")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Text("What do i feel ?")
                        .font(.custom("Snell Roundhand", size: 22))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        // اكشن التأكيد
                    }) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50) // عشان ما يدخل بالنوتش
                
                // خانة الكتابة
                TextEditor(text: $reflectionText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(12)
                    .frame(maxHeight: .infinity)
                    .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
