//
//  test.swift
//  Team13
//
//  Created by Raghad Aljuid on 08/04/1447 AH.
//
import SwiftUI

enum Tab { case board, advice, list }

struct BoardCard: View {
    let imageName: String
    let dateText: String
    
    var body: some View {
        VStack(spacing: 6) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100) // حجم البورد
                .clipped()
                .cornerRadius(12)
                .shadow(radius: 2)
            
            Text(dateText)
                .font(.caption2)
                .foregroundColor(.primary)
        }
    }
}

struct ontentView: View {
    let augustDates = ["5 Aug", "14 Aug", "23 Aug", "29 Aug"]
    let julyDates = ["2 Jul", "26 Jul"]
    
    @State private var selected: Tab = .board
    
    var body: some View {
        ZStack {
            // الخلفية
            Color(red: 246/255, green: 238/255, blue: 229/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Header
                        HStack(alignment: .firstTextBaseline) {
                            Text("My Boards")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("21 Sep, 2025")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 2)
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        // Current Board (أفقي)
                        Text("Current Board")
                            .font(.headline)
                            .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                BoardCard(imageName: "board_image", dateText: "24 Sep, 2025")
                            }
                            .padding(.horizontal, 20)
                        }

                        Divider().padding(.vertical, 10)
                        
                        // Previous Boards
                        Text("My Previous Boards")
                            .font(.headline)
                            .padding(.horizontal, 20)
                        
                        // August
                        Text("August, 2025")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black.opacity(0.85))
                            .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(augustDates, id: \.self) { date in
                                    BoardCard(imageName: "board_image", dateText: date)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        // July
                        Text("July, 2025")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black.opacity(0.85))
                            .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(julyDates, id: \.self) { date in
                                    BoardCard(imageName: "board_image", dateText: date)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Spacer().frame(height: 8)
                    }
                    .padding(.bottom, 6)
                }
            }
        }
        // Bottom Tab Bar (كلكبل)
        .safeAreaInset(edge: .bottom) {
            bottomBar
        }
    }
    
    // MARK: - Bottom Bar
    private var bottomBar: some View {
        ZStack {
            Color(red: 5/255, green: 7/255, blue: 36/255)
                .ignoresSafeArea()
            
            HStack(spacing: 0) {
                tabButton(
                    .board,
                    title: "Board",
                    systemImage: "light.panel",
                    tint: .white
                )
                
                tabButton(
                    .advice,
                    title: "Advice",
                    systemImage: "face.smiling",
                    tint: .white // غيّرها للأخضر لو تحب
                )
                
                tabButton(
                    .list,
                    title: "List",
                    systemImage: "list.bullet",
                    tint: Color(red: 111/255, green: 182/255, blue: 157/255) // أخضر مثل كودك
                )
            }
            .frame(height: 64)
            .padding(.top, 8)
        }
        .frame(height: 64) // مهم لتوسيع الهت-إيريا
    }
    
    // MARK: - Tab Button
    @ViewBuilder
    private func tabButton(_ tab: Tab, title: String, systemImage: String, tint: Color) -> some View {
        Button {
            // هنا اربط التنقل الفعلي حسب مشروعك
            selected = tab
            print("\(title) tapped")
        } label: {
            VStack(spacing: 6) {
                Image(systemName: systemImage)
                    .font(.system(size: 20))
                Text(title)
                    .font(.caption2)
            }
            .foregroundColor(tint)
            .frame(maxWidth: .infinity)   // توزيع متساوي وتكبير الهت-إيريا
            .padding(.vertical, 10)       // تكبير الهت-إيريا عموديًا
            .contentShape(Rectangle())    // حتى الفراغ يكون قابل للضغط
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ontentView()
}
