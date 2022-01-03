//
//  ContentView.swift
//  UI-412
//
//  Created by nyannyan0328 on 2022/01/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       SplashScrren()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func HW()->some View{
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
    
    func hLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
}


struct SplashScrren : View{
    
    @State var animationValue : [Bool] = Array(repeating: false, count: 2)
    var body: some View{
        
        ZStack{
            
            
            Home()
                .opacity(animationValue[0] ? 1 : 0)
            
            if !animationValue[1]{
                
                
                Color("BG-1")
                    .mask(
                    
                 Rectangle()
                    .overlay(
                    
                    
                        Image("p1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .scaleEffect(animationValue[0] ? 40 : 1)
                            .blendMode(.destinationOut)
                    
                    
                    )
                    
                    
                    
                    )
                
                
            }
            
            
            
                
            
            
            
            
            
        }
        .ignoresSafeArea()
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                
                
                withAnimation(.easeInOut){
                    
                    animationValue[0] = true
                }
                
                
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                
                animationValue[0] = false
                
                
            }
            
            
        }
       
    }
}


