//
//  ContentView2.swift
//  Team13
//
//  Created by SADEEM on 10/04/1447 AH.
//
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
            
            // التاب بار
            HStack {
                Spacer()
                
                TabBarButton(
                    title: "Board",
                    systemImage: "light.panel",
                    isSelected: selectedTab == "Board"
                ) {
                    selectedTab = "Board"
                }
                
                Spacer()
                
                TabBarButton(
                    title: "Advice",
                    systemImage: "face.smiling",
                    isSelected: selectedTab == "Advice"
                ) {
                    selectedTab = "Advice"
                }
                
                Spacer()
                
                TabBarButton(
                    title: "List",
                    systemImage: "list.bullet",
                    isSelected: selectedTab == "List"
                ) {
                    selectedTab = "List"
                }
                
                Spacer()
            }
            .frame(height: 64)
            .padding(9)
            
            .background(Color(red: 5/255, green: 7/255, blue: 36/255))
            
        }
        .background(Color(red: 246/255, green: 238/255, blue: 229/255)) // F6EEE5
        .edgesIgnoringSafeArea(.bottom)
        
    }

    
}

// زر التاب بار
struct TabBarButton: View {
    let title: String
    let systemImage: String
    let isSelected: Bool
    let action: () -> Void
    
    private let tabIconSize: CGFloat = 20
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: systemImage)
                    .font(.system(size: tabIconSize))
                    .foregroundColor(isSelected ? Color(red: 92/255, green: 191/255, blue: 162/255) : .white)
                    .offset(y: 4)
                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? Color(red: 92/255, green: 191/255, blue: 162/255) : .white)
                    .offset(y: 4)
            }
            .contentShape(Rectangle())
            
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    Advice_Screen()
}
