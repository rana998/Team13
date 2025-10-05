//
//  ContentView.swift
//  Team13
//
//  Created by Rana Mohsen Bin Madhi on 04/04/1447 AH.
//


import SwiftUI

struct ContentView: View {
    @State private var reflectionText: String = ""
    @State private var backToList = false  // متغير زر الرجوع فقط
    @State private var navigateToBoard = false // هذا موجود من قبل للصح
    let backgroundColor = Color(red: 246/255, green: 238/255, blue: 229/255)

    var body: some View {
        NavigationStack {
            ZStack {
                // الخلفية
                backgroundColor
                    .ignoresSafeArea()
                
                VStack {
                    // الشريط العلوي
                    HStack {
                        // زر الرجوع ← يودّي على الصفحة الثانية
                        Button(action: {
                            backToList = true
                        }) {
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Text("What do i feel ?")
                            .font(.custom("Snell Roundhand", size: 22))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        // ✅ يودّي على صفحة البورد (زي ما كان)
                        Button(action: {
                            navigateToBoard = true
                        }) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    
                    // خانة الكتابة
                    TextEditor(text: $reflectionText)
                        .scrollContentBackground(.hidden)
                        .padding()
                        .background(backgroundColor)
                        .cornerRadius(12)
                        .frame(maxHeight: .infinity)
                        .padding()
                    
                    Spacer()
                    
                    // ✅ الانتقال إلى البورد (ما تغيّر)
                    NavigationLink(destination: Board_Screen()
                        .navigationBarBackButtonHidden(true),
                                   isActive: $navigateToBoard) {
                        EmptyView()
                    }
                    
                    // 🔙 الانتقال إلى الصفحة الثانية فقط
                    NavigationLink(destination: ontentView()
                        .navigationBarBackButtonHidden(true),
                                   isActive: $backToList) {
                        EmptyView()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
