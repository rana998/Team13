//
//  ContentView.swift
//  Kizu
//
//  Created by Nouf Alshawoosh on 03/04/1447 AH.
//

import SwiftUI

struct Board_Screen: View {
    
    enum ToolMode {
        case nail
        case nailRemover
        case none
    }
    
    @State var currentTool: ToolMode = .none
    @State var nailPositions = [CGPoint]()
    @State var removedNailPositions = [CGPoint]()
    
    var body: some View {
        ZStack{
            Image("Wood_Board")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                HStack(alignment: .top, spacing: 22){
                    Text("My Board")
                        .font(.system(size: 24))
                        .foregroundStyle(.white)
                        .bold()
                    
                    
                    Button(action: {
                        currentTool = currentTool == .nailRemover ? .none : .nailRemover
                        
                    }, label: {
                        Image("Hammer_Tool")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 27, height: 27)
                            .colorMultiply(currentTool == .nailRemover ? Color(red: 111/255, green: 182/255, blue: 157/255) : .white)
                        
                    }).offset(x: 140, y: 10)
                    
                    Button(action: {
                        currentTool = currentTool == .nail ? .none : .nail
                    }, label: {
                        Image("Nail_Tool")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 27, height: 27)
                            .colorMultiply(currentTool == .nail ? Color(red: 111/255, green: 182/255, blue: 157/255) : .white)
                        
                    }).offset(x: 150, y: 10)
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, 30)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                
                
                
                Rectangle()
                    //.stroke(Color.black)
                    .fill(Color.clear)
                    .frame(height: 650)
                    .contentShape(Rectangle())
                    .offset(y: -85)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onEnded { value in
                                let location = value.location
                                // print("Tapped at: \(location)")
                                switch currentTool {
                                case .nail:
                                    nailPositions.append(location)
                                    
                                case .nailRemover:
                                    if let index = nailPositions.firstIndex(where: {
                                        nail in
                                        let distance = sqrt(pow(nail.x - location.x, 2) + pow(nail.y - location.y, 2))
                                        return distance < 10
                                    }){
                                        let removedNail = nailPositions[index]
                                        nailPositions.remove(at: index)
                                        removedNailPositions.append(removedNail)
                                        
                                    }
                                    
                                case .none:
                                    break
                                }
                            }
                    )
                    .overlay(
                        ZStack {
                            // display all nails
                            ForEach(nailPositions.indices, id: \.self) { index in
                                Image("Nail")
                                    .position(nailPositions[index])
                                    .onTapGesture {
                                        if currentTool == .nailRemover {
                                            let removedNail = nailPositions[index]
                                            removedNailPositions.append(removedNail)
                                            nailPositions.remove(at: index)
                                        }
                                    }
                            }
                            
                            // display all removed nail spots
                            ForEach(removedNailPositions.indices, id: \.self) { index in
                                Image("RemovedNailSpot")
                                    .position(removedNailPositions[index])
                            }
                        }
                    )
                
                
                
            }
            
            
            
        }.ignoresSafeArea(.container, edges: .bottom)
        
        
        
    }
    
}




#Preview {
    Board_Screen()
}
