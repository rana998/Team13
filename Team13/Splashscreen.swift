//
//  Splashscreen.swift
//  Team13
//
//  Created by Nuha  on 14/04/1447 AH.
//



import SwiftUI
import SDWebImageSwiftUI

struct Splashscreen: View {
    // A state variable to control when the splash screen disappears.
    @State private var isTransitionComplete = false
    private let splashDuration: TimeInterval = 3.0
    
    var body: some View {
        // Use a ZStack to layer the background and the GIF.
        
        
        ZStack (){
            
            // Your background color. Use a Solid Color or an Image here.
            Color.darkblue
                .edgesIgnoringSafeArea(.all) // Makes the background color fill the entire screen
            
            VStack (){
                
                
                Button(action: {
                    self.isTransitionComplete = true
                }) {
                    Text("SKIP")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Color.white.opacity(0.3)
                                .clipShape(Capsule())
                        )
                }
            
                .offset(x: -145, y: -375)
            }
            
            
            // This is where you use the GIF.
            // The `AnimatedImage` from SDWebImageSwiftUI will automatically
            // play your GIF animation.
            AnimatedImage(name: "Relief.gif") // Use the name you gave your GIF in Assets.xcassets
                .resizable()
                .scaledToFit()
                .frame() // Adjust the size of the GIF
                .onAppear {
                    // This is optional but good practice to show the splash screen for a few seconds.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) { // Wait for 3 seconds
                        self.isTransitionComplete = true
                    }
                }
               
        } //
        
        
        
        
        
        
        .fullScreenCover(isPresented: $isTransitionComplete) {
            // This will show your main app view after the timer runs out.
            // Replace `ContentView()` with the name of your main app view.
            TabBar()
        }
        
    }
    
    
    // You can add a preview to see how your splash screen looks.
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            Splashscreen()
        }
    }
}
