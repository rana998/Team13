//
//  TabBar.swift
//  Team13
//
//  Created by Nouf Alshawoosh on 13/04/1447 AH.
//
import SwiftUI

struct TabBar: View {
    @State private var selectedTab = 3

    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 5/255, green: 7/255, blue: 36/255, alpha: 1.0)
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                Board_Screen()
            }
            .tabItem {
                Image(systemName: "light.panel")
                Text("Board")
            }
            .tag(1)

            NavigationStack {
                Advice_Screen()
            }
            .tabItem {
                Image(systemName: "face.smiling")
                Text("Advice")
            }
            .tag(2)

            // هنا صفحتك ontentView
            NavigationStack {
                ontentView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("List")
            }
            .tag(3)
        }
        .tint(Color(red: 111/255, green: 182/255, blue: 157/255))
    }
}

#Preview {
    TabBar()
}
