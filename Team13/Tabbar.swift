//
//  TabBar.swift
//  Team13
//
//  Created by Nouf Alshawoosh on 13/04/1447 AH.
//
import SwiftUI

struct TabBar: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(red: 5/255, green: 7/255, blue: 36/255, alpha: 1.0)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
    }
    var body: some View{
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Board_Screen().tabItem {
                Image(systemName: "light.panel")
                Text("Board")
            }.tag(1)
            
            Advice_Screen().tabItem {
                Image(systemName: "face.smiling")
                Text("Advice")
            }.tag(2)
            
            Text("List").tabItem{
                Image(systemName: "list.bullet")
                Text("List")
            }.tag(3)
        }.accentColor(Color(red: 111/255, green: 182/255, blue: 157/255))
    }
    
}

#Preview {
    TabBar()
}
