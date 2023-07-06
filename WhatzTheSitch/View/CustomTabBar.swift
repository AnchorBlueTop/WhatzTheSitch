//
//  CustomTabBar.swift
//  WhatzTheSitch
//
//  Created by Harshil Patel on 11/02/22.
//

import SwiftUI

struct CustomTabBar: View {
    @StateObject var tabData = TabViewModel()
    @State private var bar_padding: Double = 20
    
    // Hiding Tab View...
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        
        TabView(selection: $tabData.currentTab) {
            
            Home()
                .tag("Home")
            
            Statistics()
                .tag("Statistics")
            
            About()
                .tag("About")
        }
        .overlay(
        
            HStack{
                
                TabBarButton(title: "Home", image: "house.fill", animation: animation)
                
                TabBarButton(title: "Statistics", image: "chart.bar.fill", animation: animation)
                
                TabBarButton(title: "About", image: "info.circle.fill", animation: animation)
            }
                .onAppear{
                    if (UIScreen.main.bounds.height == 568.0) {
                        self.bar_padding = 0
                    }
                }
                
            .environmentObject(tabData)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(.regularMaterial,in: Capsule())
                .padding(.horizontal,20)
                .padding(.bottom, self.bar_padding)
            // Shadow...
                .shadow(color: .black.opacity(0.09), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.09), radius: 5, x: -5, y: 0)
            // Hiding Tab Bar...
                .offset(y: tabData.showDetail ? 250 : 0)
            // always light tab bar ...
                .colorScheme(.light)
            
            ,alignment: .bottom
        )
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

// TabBarButton...
struct TabBarButton: View{
    
    var title: String
    var image: String
    // For Slide Tab Indicator Aniamtion...
    var animation: Namespace.ID
    @EnvironmentObject var tabData: TabViewModel
    
    var body: some View{
        
        Button {
            
            withAnimation{
                tabData.currentTab = title
            }
            
        } label: {
            
            VStack{
                
                Image(systemName: image)
                    .font(.title2)
                // setting same height for all images...
                // to avoid the animation glitch..
                    .frame(height: 18)
                
                Text(title)
                    .font(.caption.bold())
            }
            .foregroundColor(tabData.currentTab == title ? Color("Violet") : .primary.opacity(0.5))
            .frame(maxWidth: .infinity)
            .overlay(
            
                ZStack{
                    
                    // showing only for current Tab...
                    if tabData.currentTab == title{
                        TabIndicator()
                            .fill(.linearGradient(
                                .init(colors: [
                                
                                    Color("Magenta").opacity(0.3),
                                    Color("Pink").opacity(0.2),
                                    .clear
                                ]),
                                startPoint: .top,
                                endPoint: .bottom))
                        // Geometry Effect...
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .padding(.top,-10)
                            .padding(.horizontal,8)
                    }
                }
            )
        }

    }
}

// Custom Tab Lighting Indicator...
// Shape..

struct TabIndicator: Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width - 10, y: rect.height))
            path.addLine(to: CGPoint(x: 10, y: rect.height))
        }
    }
}
