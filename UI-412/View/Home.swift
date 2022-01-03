//
//  Home.swift
//  UI-412
//
//  Created by nyannyan0328 on 2022/01/03.
//

import SwiftUI

struct Home: View {
    @State var currentIndex : Int = 0
    @State var textColor : Color = .white
    
    @State var bgOffset : CGFloat = 0
    
    @State var animatedText : Bool = false
    @State var animatedImage : Bool = false
    var body: some View {
        VStack{
            
            
            Text(foods[currentIndex].itemTitle)
                .font(.title.bold())
                .frame(height:100)
                .padding(.top)
                .offset(y: animatedText ? 200 : 0)
                .clipped()
                .hLeading()
            
            HStack(spacing:15){
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Label {
                        Text("1hour")
                    } icon: {
                        
                        
                        
                        Image(systemName: "flame")
                            .frame(width: 30)
                    }
                    
                    Label {
                        
                        Text("40")
                        
                    } icon: {
                        
                        Image(systemName: "bookmark")
                            .frame(width:30)

                    }

                    
                    
                    Label {
                        
                        Text("Safety")
                        
                    } icon: {
                        
                        Image(systemName: "safari")
                            .frame(width:30)

                    }

                    
                    
                    Label {
                        
                        Text("Easy")
                        
                    } icon: {
                        
                        Image(systemName: "bolt")
                            .frame(width:30)

                    }
                    
                    Label {
                        
                        Text("Health")
                        
                    } icon: {
                        
                        Image(systemName: "drop")
                            .frame(width:30)

                    }

                }
                .padding(.top,5)
              
               
                .hLeading()
                
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    
                    Image(foods[currentIndex].itemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .background(
                        
                        
                            Circle()
                    
                                .trim(from: 0.3, to: 1)
                                .stroke(
                                
                                
                                LinearGradient(colors: [
                                
                                    
                                    textColor,
                                    textColor,
                                    textColor,
                                    textColor,
                                
                                
                                
                                ], startPoint: .top, endPoint: .bottom),lineWidth: 1
                                
                                
                                
                                
                                )
                                .padding(-15)
                                .rotationEffect(.init(degrees: -90))
                                .opacity(animatedImage ? 0 : 1)
                            
                                
                           
                        
                        
                        )
                        .frame(width: size.width, height: size.width * 1.8)
                        .frame(maxHeight:.infinity)
                        .rotationEffect(.init(degrees: animatedImage ? 360 : 0))
                        .offset(x: 60)
                    
                    
                    
                }
                .frame(height:(getRect().width / 2) * 2)
                
                
           

                
            }
            
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.")
                .font(.callout.weight(.semibold))
                .lineSpacing(9)
                .lineLimit(3)
                .offset(y: animatedText ? 200 : 0)
                .clipped()
                .padding(.vertical)
            
            
            
            
            
        }
        .padding()
        .foregroundColor(textColor)
        .HW()
        .background(
        
            GeometryReader{proxy in
                
                let hight = proxy.size.height
                
                LazyVStack(spacing:0){
                    
                    
                    ForEach(foods.indices,id:\.self){index in
                        
                        
                        if index % 2 == 0{
                            
                            
                            Color("BG")
                                .frame(height:hight)
                        }
                        else{
                            
                            
                            
                            Color.white
                                .frame(height:hight)
                        }
                        
                        
                    }
                    
                    
                    
                }
                .offset(y: bgOffset)
                
                
            }
                .ignoresSafeArea()
        
        
        )
        .gesture(
        
        DragGesture()
            .onEnded({ value in
                let translation = value.translation.height
                
                if translation < 0 && -translation > 50 && (currentIndex < (foods.count - 1)){
                    
                    
                    AnimatedSlider(moveUP: true)
                    
                }
                
                if translation > 0 && translation > 50 && currentIndex > 0{
                    
                    AnimatedSlider(moveUP: false)
                    
                }
                
                
            })
        
        )
       
    }
    
    func AnimatedSlider(moveUP : Bool = true){
        
        animatedText = true
        
        withAnimation(.easeInOut(duration: 0.6)){
            
            bgOffset += (moveUP ? -getRect().height : getRect().height)
            
            
        }
        
        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.3, blendDuration: 0.4)){
            
            animatedImage = true
            
          
            
            
            
            
        
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            animatedText = false
            
            
            currentIndex = (moveUP ? (currentIndex + 1) : (currentIndex - 1))
            
            withAnimation(.easeInOut){
                
                textColor = (textColor == Color.black ? .white : .black)
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                
                
                
                animatedImage = false
                
            }
            
            
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
