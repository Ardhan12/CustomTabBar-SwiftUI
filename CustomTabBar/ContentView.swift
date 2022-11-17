//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Arief Ramadhan on 17/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("home")
                Spacer()
                HStack {
                    TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/20, systemIconName: "house", tabName: "Map")
                    TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/20, systemIconName: "plus", tabName: "Add")
                    
                    TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/20, systemIconName: "bookmark.fill", tabName: "List")
                }.frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("bg").shadow(radius: 2))
            } .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarIcon: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
