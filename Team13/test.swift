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

struct ontentView: View {
    let augustDates = ["5 Aug", "14 Aug", "23 Aug", "29 Aug"]
    let julyDates   = ["2 Jul", "26 Jul"]
    
    // فتح صفحة الرفلكشن
    @State private var showReflection = false

    private let headerDate = "21 Sep, 2025"
    
    var body: some View {
        ZStack {
            Color(red: 246/255, green: 238/255, blue: 229/255).ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Header
                        HStack(alignment: .firstTextBaseline) {
                            Text("My Boards")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(headerDate)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 2)
                            
                            Spacer()
                            // زر + يفتح الرفلكشن (بدون Back الأزرق)
                            Button {
                                showReflection = true
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        // Current Board — يفتح Board_Screen بدون Back الأزرق
                        Text("Current Board")
                            .font(.headline)
                            .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                NavigationLink {
                                    Board_Screen()
                                        .navigationBarBackButtonHidden(true)
                                        .toolbar(.hidden, for: .navigationBar)
                                } label: {
                                    BoardCard(imageName: "board_image", dateText: "24 Sep, 2025")
                                }
                                .buttonStyle(.plain)
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
                                    NavigationLink {
                                        Board_Screen()
                                            .navigationBarBackButtonHidden(true)
                                            .toolbar(.hidden, for: .navigationBar)
                                    } label: {
                                        BoardCard(imageName: "board_image", dateText: date)
                                    }
                                    .buttonStyle(.plain)
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
                                    NavigationLink {
                                        Board_Screen()
                                            .navigationBarBackButtonHidden(true)
                                            .toolbar(.hidden, for: .navigationBar)
                                    } label: {
                                        BoardCard(imageName: "board_image", dateText: date)
                                    }
                                    .buttonStyle(.plain)
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
        // وجهة صفحة الرفلكشن — بدون Back الأزرق
        .navigationDestination(isPresented: $showReflection) {
            ContentView()
                .navigationBarBackButtonHidden(true)
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    NavigationStack { ontentView() }
}
