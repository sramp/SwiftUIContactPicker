//
//  ContentView.swift
//  SwiftUIContactPicker
//
//  Created by Stefano Rampazzo on 24/02/2020.
//  Copyright © 2020 Stefano Rampazzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var contactObj: ContactObject
    
    var body: some View {
        ZStack {
            if (!self.contactObj.showContactPicker){
                VStack{
                    Spacer()
                    Button(action: {
                        self.contactObj.showContactPicker.toggle()
                    }) {
                        Text("Pick a contact")
                    }
                    Spacer()
                    Text("\(self.contactObj.cObj.givenName) \(self.contactObj.cObj.familyName)")
                    Spacer()
                    Text("From an original idea of Artur Grigor")
                  
                }
            }
            else
            {
                EmbeddedContactPicker()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
