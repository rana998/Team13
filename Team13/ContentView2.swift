//
//  ContentView2.swift
//  Team13
//
//  Created by SADEEM on 10/04/1447 AH.
//


import SwiftUI

struct ContentView2: View {
    private let tabIconSize: CGFloat = 28  // حجم موحّد لكل الأيقونات
    
    var body: some View {
        VStack {
            Spacer()
            
            // النص العلوي
            VStack(alignment: .leading, spacing: 10) {
                Text("Choose words that heal,\nnot hurt...")
                    .font(.system(size: 30, design:.serif))
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                
                Text("Once spoken, they can’t\nbe taken back.")
                    .font(.system(size: 30, design:.serif ))
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            // صورة الشخصية
            Image("IMAGE") // تأكد من أنك أضفت الصورة إلى Assets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .offset(y: 110)
            
            Spacer()
            
            // الشريط السفلي (تاب بار)
            HStack {
                Spacer()
                
                // Board (قابل للضغط)
                Button {
                    print("Board tapped")
                    // لاحقًا: ضع التنقّل هنا
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: "light.panel")
                            .font(.system(size: tabIconSize))
                            .foregroundColor(.white)
                            .offset(y: 6) // نزّل الأيقونة
                        Text("Board")
                            .font(.caption)
                            .foregroundColor(.white)
                            .offset(y: 6) // نزّل النص
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                // Advice (قابل للضغط)
                Button {
                    print("Advice tapped")
                    // لاحقًا: ضع التنقّل هنا
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: "face.smiling")
                            .font(.system(size: tabIconSize)) // نفس حجم بقية الأيقونات
                            .foregroundColor(Color(red: 92/255, green: 191/255, blue: 162/255))
                            .offset(y: 6) // نزّل الأيقونة
                        Text("Advice")
                            .font(.caption) // موحّد مع البقية
                            .foregroundColor(Color(red: 92/255, green: 191/255, blue: 162/255))
                            .offset(y: 6) // نزّل النص
                    }
                    .padding()
                    .background(Color(red: 5/255, green: 7/255, blue: 36/255))
                    .clipShape(Circle())
                    .contentShape(Circle())
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                // List (قابل للضغط)
                Button {
                    print("List tapped")
                    // لاحقًا: ضع التنقّل هنا
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: "list.bullet")
                            .font(.system(size: tabIconSize))
                            .foregroundColor(.white)
                            .offset(y: 6) // نزّل الأيقونة
                        Text("List")
                            .font(.caption)
                            .foregroundColor(.white)
                            .offset(y: 6) // نزّل النص
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                
                Spacer()
            }
            .padding(9)
            .background(Color(red: 5/255, green: 7/255, blue: 36/255))
        }
        .background(Color(red: 1.0, green: 0.96, blue: 0.93))
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView2()
}
