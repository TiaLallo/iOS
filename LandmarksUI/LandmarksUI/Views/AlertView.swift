//
//  AlertView.swift
//  LandmarksUI
//
//  Created by Tia Lallo on 27/01/2020.
//  Copyright © 2020 Jouni Könönen. All rights reserved.
//

import SwiftUI

struct AlertView: View {
    @State private var showingAlert = false
    var body: some View {
        EditButton(action: {
            self.showingAlert = true
        }) {
            
            Text("Show Alert")
                .font(.title)
                .foregroundColor(Color.white)
        }
        
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Alert"), message: Text("Are you sure you wanna delete?"), primaryButton: .default(Text("Delete")), secondaryButton: .destructive(Text("Cancel")))
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
