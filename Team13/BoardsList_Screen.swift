//
//  BoardsList_Screen.swift
//  Team13
//
//  Created by Nouf Alshawoosh on 14/04/1447 AH.
//
import SwiftUI

struct BoardsList_Screen : View {
    
    @State var showBoardDetail : Bool = false
    @State var showReflection : Bool = false
    @Binding var selectedTab : Int
    
    // TEMPORARY vars. (until we implement the backend)
    let augustDates = ["5 Aug", "14 Aug", "23 Aug", "29 Aug"]
    let julyDates   = ["2 Jul", "26 Jul"]
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color(red: 246/255, green: 238/255, blue: 229/255).ignoresSafeArea()
            
            // HEADER --------------------------------------
            HStack(alignment: .top) {
                Text("My Boards")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(Date(), style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 6)
                
                Spacer()
                
                // Reflection Button (+)
                Button {
                    showReflection = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.title2)
                }.fullScreenCover(isPresented: $showReflection){
                    Reflection_Screen()
                }
                
                
            } // end of HStack
            .ignoresSafeArea()
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            
            //--------------------------------------------
            
            VStack(alignment: .leading, spacing: 16){
                
                // Current Board -------------------------
                
                Text("Current Board")
                    .font(.headline)
                
                BoardCard(imageName: "board_image", dateText: "24 Sep, 2025")
                    .onTapGesture {
                        selectedTab = 1
                    }.padding(.horizontal, 6)
                
                // ----------------------------------------
                
                Divider().padding(.vertical, 10)
                
                Text("My Previous Boards")
                    .font(.headline)
                
                ScrollView(){
                    // TEMPORARY Content
                    VStack(alignment: .leading, spacing: 16) {
                        
                        HStack() {
                            Text("August, 2025")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black.opacity(0.85))
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 15, weight: .bold))
                                .padding(.trailing)
                                .opacity(0.3)
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 16){
                                ForEach(augustDates, id: \.self){
                                    date in
                                    BoardCard(imageName: "board_image", dateText: date)
                                        .onTapGesture {
                                            showBoardDetail = true
                                        }.padding(.leading, 6)
                                }
                                
                            } // end of HStack
                            
                        } // end of ScrollView (Horizontal)
                        
                        //--------------------------------------------
                        Spacer()
                        
                        HStack() {
                            Text("July, 2025")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black.opacity(0.85))
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 15, weight: .bold))
                                .padding(.trailing)
                                .opacity(0.3)
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 16){
                                ForEach(julyDates, id: \.self){
                                    date in
                                    BoardCard(imageName: "board_image", dateText: date)
                                        .padding(.leading, 6)
                                        .onTapGesture {
                                            showBoardDetail = true
                                        }
                                    
                                    
                                }
                                
                            } // end of HStack
                            
                        } // end of ScrollView (Horizontal)
                        
                        
                    } // end of VStack
                    
                } // end of ScrollView (Vertically)
                .fullScreenCover(isPresented: $showBoardDetail) {
                    BoardDetailView()
                }
                
                
                
                
                
            }.padding(.top, 65)
                .padding(.horizontal, 20)
            
            
            
            
        }
        
    }
}

// ---------------------------------------------

struct BoardDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(red: 246/255, green: 238/255, blue: 229/255)
                .ignoresSafeArea()
            
            VStack {
                // Back button
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.uturn.backward")
                            .foregroundColor(.black)
                    }
                    Spacer()
                } // end of HStack
                .padding()
                
                TabView {
                    Image("Board_Example")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(.all)
                    
                    
                    Image("Reflection_Example")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(.all)
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
            } // end of VStack
        } // end of ZStack
    }
}



#Preview {
    BoardsList_Screen(selectedTab: .constant(2))
    
}
