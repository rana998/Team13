//
//  Reflection_Screen.swift
//  Team13
//
//  Created by Nouf Alshawoosh on 14/04/1447 AH.
//
import SwiftUI

struct Reflection_Screen: View {
    let backgroundColor = Color(red: 246/255, green: 238/255, blue: 229/255)
    
    @State var reflectionText: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack(){
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    
                    Button(action: {
                        dismiss()
                        
                    }) {
                        Image(systemName: "arrow.uturn.backward")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Text("What do I feel ?")
                        .font(.custom("Snell Roundhand", size: 22))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.black)
                    }
                    
                } // end of HStack
                .padding(.horizontal)
                .padding(.top, 50)
                
                TextEditor(text: $reflectionText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(12)
                    .frame(maxHeight: .infinity)
                    .padding()
                
            } // end of VStack
        } // end of ZStack
    }
}

#Preview {
    Reflection_Screen()
}
