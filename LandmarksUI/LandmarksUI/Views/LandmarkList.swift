//
//  LandmarkList.swift
//  LandmarksUI
//
//  Created by Jouni Könönen on 13/01/2020.
//  Copyright © 2020 Jouni Könönen. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @State var landmark = landmarkData
    var body: some View {
        
        NavigationView {
            List {
                ForEach(landmark) {
                    landmark in NavigationLink(destination: LandmarkDetail(landmark: landmark))
                    {
                        LandmarkRow(landmark: landmark)
                    }
            }
                .onMove(perform: move)
                .onDelete(perform: deleteLandmark)
            }
            .navigationBarTitle(Text("Landmarks"))
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Alert"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                    self.deleteLandmark(at: Index)
                    }, secondaryButton: .cancel() )
            }
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingAlert = true
        }) {
            Image(systemName: "trash")
        })
    }
    
    func move(from source: IndexSet, to destination: Int)
    {
        landmark.move(fromOffsets: source, toOffset: destination)
    }
    func deleteLandmark(at Offsets: IndexSet)
    {
        landmark.remove(atOffsets: Offsets)
        presentationMode.wrappedValue.dismiss()
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

