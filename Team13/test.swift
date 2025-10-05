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
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(12)
                .shadow(radius: 2)
            Text(dateText)
                .font(.caption2)
                .foregroundColor(.primary)
        }
    }
}

// شاشة فاضية مؤقتًا لعرض البورد لاحقًا
struct BoardScreen: View {
    var body: some View {
        Color(.systemBackground)
            .ignoresSafeArea()
            .navigationTitle("Board")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ontentView: View {
    let augustDates = ["5 Aug", "14 Aug", "23 Aug", "29 Aug"]
    let julyDates   = ["2 Jul", "26 Jul"]
    
    // مبدئيًا نختار List عشان يصير أخضر أول ما نشغّل
    @State private var selected: Tab = .list
    private let tabIconSize: CGFloat = 20
    private let activeGreen = Color(red: 111/255, green: 182/255, blue: 157/255)

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 246/255, green: 238/255, blue: 229/255).ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            // Header
                            HStack(alignment: .firstTextBaseline) {
                                Text("My Boards").font(.title2).fontWeight(.bold)
                                Text("21 Sep, 2025").font(.subheadline).foregroundColor(.gray)
                                    .padding(.bottom, 2)
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "plus").foregroundColor(.black).font(.title2)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            
                            // Current Board — كلكبل ويحوّل التبويب إلى Board
                            Text("Current Board").font(.headline).padding(.horizontal, 20)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    NavigationLink(destination: BoardScreen()) {
                                        BoardCard(imageName: "board_image", dateText: "24 Sep, 2025")
                                    }
                                    .buttonStyle(.plain)
                                    .simultaneousGesture(TapGesture().onEnded { selected = .board })
                                }
                                .padding(.horizontal, 20)
                            }
                            
                            Divider().padding(.vertical, 10)
                            
                            // Previous Boards
                            Text("My Previous Boards").font(.headline).padding(.horizontal, 20)
                            
                            // August — كلكبل
                            Text("August, 2025")
                                .font(.subheadline).fontWeight(.semibold)
                                .foregroundColor(.black.opacity(0.85))
                                .padding(.horizontal, 20)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(augustDates, id: \.self) { date in
                                        NavigationLink(destination: BoardScreen()) {
                                            BoardCard(imageName: "board_image", dateText: date)
                                        }
                                        .buttonStyle(.plain)
                                        .simultaneousGesture(TapGesture().onEnded { selected = .board })
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                            
                            // July — كلكبل
                            Text("July, 2025")
                                .font(.subheadline).fontWeight(.semibold)
                                .foregroundColor(.black.opacity(0.85))
                                .padding(.horizontal, 20)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(julyDates, id: \.self) { date in
                                        NavigationLink(destination: BoardScreen()) {
                                            BoardCard(imageName: "board_image", dateText: date)
                                        }
                                        .buttonStyle(.plain)
                                        .simultaneousGesture(TapGesture().onEnded { selected = .board })
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
            .safeAreaInset(edge: .bottom) { bottomBar }
            // تأكيد إن اللون الأخضر يبدأ على List عند التشغيل
            .onAppear { selected = .list }
        }
    }
    
    // MARK: - Bottom Bar
    private var bottomBar: some View {
        ZStack {
            Color(red: 5/255, green: 7/255, blue: 36/255).ignoresSafeArea()
            HStack(spacing: 4) {
                tabButton(.board,  title: "Board",  systemImage: "light.panel")
                tabButton(.advice, title: "Advice", systemImage: "face.smiling")
                tabButton(.list,   title: "List",   systemImage: "list.bullet")
            }
            .frame(height: 64)
            .padding(.top, 8)
        }
        .frame(height: 64)
    }
    
    // MARK: - Tab Button (الأخضر للتبويب النشط)
    @ViewBuilder
    private func tabButton(_ tab: Tab, title: String, systemImage: String) -> some View {
        let isActive = (selected == tab)
        Button {
            selected = tab
            print("\(title) tapped")
        } label: {
            VStack(spacing: 4) {
                Image(systemName: systemImage).font(.system(size: tabIconSize))
                Text(title).font(.caption2)
            }
            .foregroundColor(isActive ? activeGreen : .white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ontentView()
}
