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
                .onDelete(perform: delete)
            }
        .navigationBarTitle(Text("Landmarks"))
            .navigationBarItems(trailing: EditButton())
        }
}
    func move(from source: IndexSet, to destination: Int)
    {
        landmark.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at Offsets: IndexSet)
    {
        landmark.remove(atOffsets: Offsets)
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

