//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Arief Ramadhan on 17/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var router: TabRouter
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch router.screen {
                case .homepage:
//                    MapPage()
                    Text("home")
                case .listpage:
//                    AlarmList()
                    Text("list")
                case .addAlarmPage:
//                    AddNewView()
                    Text("new page")
                }
                Spacer()
                HStack {
                    TabBarIcon(router: router, screen: .homepage, width: geometry.size.width/3, height: geometry.size.height/20, systemIconName: "house", tabName: "Map")
                    //
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/5, height: geometry.size.width/5)
                            .shadow(radius: 4)
                        
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/5.5-5 , height: geometry.size.width/5.5-5)
                            .foregroundColor(Color("primary"))
                    }.offset(y: -geometry.size.height/8/2)
                    
                    TabBarIcon(router: router, screen: .listpage, width: geometry.size.width/3, height: geometry.size.height/20, systemIconName: "bookmark.fill", tabName: "List")
                }.frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("bg").shadow(radius: 2))
            } .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarIcon: View {
    
    @StateObject var router: TabRouter
    let screen: Screen
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
        .onTapGesture {
            router.screen = screen
        }.foregroundColor(router.screen == screen ? Color("primary") : .gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(router: TabRouter())
    }
}
