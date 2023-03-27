//
//  SwiftUIVersionView.swift
//  Hello
//
//  Created by giovanni russo on 24/03/23.
//

import SwiftUI

struct SwiftUIVersionView: View {
    
    @State var text: String = ""
    @State var isOn: Bool = true
    @State var value: Double = 0.5
    
    var body: some View {
        VStack{
            
            Text("Giovanni M Russo")
                .font(.title)
                .padding()
            
                Image(systemName: "apple.logo")
                    .resizable()
                    .padding()
                    .frame(width: 180, height: 220,alignment: .center)
            
            Section{
                Text("Hello i'm giovanni and i want to learn how to use UIKit and the difference with swiftUI.")
                    .padding()
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                
                print("Button was tapped!")
                
                if isOn{
                    print("toggle is on")

                } else{
                    print("toggle is off")

                }
                
            }.foregroundColor(.purple)
                .padding()

            HStack{
                TextField("Enter text", text: $text) //search bar
                    .padding(.leading, 5.0)
                    .padding(.horizontal, 5.0)
                    .accentColor(.black)
                
            }
            .padding(.vertical, 10)
            .background(.white)
            .cornerRadius(6)
            .shadow(radius: 0.5)
            .padding(.horizontal)
            
                            Toggle("Toggle", isOn: $isOn)
                    .padding()
                    .toggleStyle(SwitchToggleStyle(tint: Color.purple))
                    
            Slider(value: $value)
                .padding(.horizontal)
                .accentColor(.purple)
            
            Button(action: {
                        // action to perform when button is tapped
                    }) {
                        Text("SwiftUI View")
                            .foregroundColor(.black)
                            .padding(10)
                    }
                    .background(Color.purple)
                    .cornerRadius(10)
                    .padding()
            
            Spacer()
        }
    }
}

struct SwiftUIVersionView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVersionView()
    }
}
