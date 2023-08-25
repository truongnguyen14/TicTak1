//
//  Setting.swift
//  Tictac
//
//  Created by Truong, Nguyen Tan on 28/08/2023.
//

import SwiftUI
import UIKit

struct Setting: View {
    @AppStorage("isDarkMode") private var Darkmode: Bool = false
    @State private var text = "Setting"
    @State private var showingInformationview = false
    
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        ZStack{
            Menubackgroundcolor()
            VStack(alignment: .center){
                Toggle(
                    isOn: $Darkmode,
                    label: {
                        Text("Theme switch: ")
                        Text("Light/Dark")
                            .padding(.top, 2)
                })
                .modifier(Buttonfunction(color: Color("Blue")))
                .padding(.bottom, 5)
                Button(action: {
                    self.showingInformationview = true
                }) {
                    Text("App information")
                        .padding(8)
                }
                .modifier(Buttonfunction(color: Color("Blue")))
            }
        }
        .navigationTitle(text.uppercased())
        .navigationBarTitleDisplayMode(.inline)
        .bold()
        .environment(\.colorScheme, Darkmode ? .dark : .light)
        .sheet(isPresented: $showingInformationview) {
            Informationview()
          }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
