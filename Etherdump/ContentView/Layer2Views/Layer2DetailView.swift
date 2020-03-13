//
//  Layer2DetailView.swift
//  Etherdump
//
//  Created by Darrell Root on 1/31/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import SwiftUI
import PackageEtherCapture

struct Layer2DetailView: View {
    @Binding var frame: Frame?
    @Binding var startHighlight: Data.Index?
    @Binding var endHighlight: Data.Index?
    var body: some View {
/*        HStack {
            Text(frame?.frameFormat.rawValue ?? "Frame").font(.headline)
            Spacer()
            Text(frame?.verboseDescription ?? "Error displaying frame header")
            Spacer()
*/
        HStack {
            Group {
                Text(frame?.frameFormat.rawValue ?? "Frame").font(.headline)
                Spacer()
                Text(frame?.srcmac ?? "unknown").onTapGesture {
                    self.startHighlight = self.frame?.startIndex[.srcmac]
                    self.endHighlight = self.frame?.endIndex[.srcmac]
                }
                Text(">")
                Text(frame?.dstmac ?? "unknown").onTapGesture {
                    self.startHighlight = self.frame?.startIndex[.dstmac]
                    self.endHighlight = self.frame?.endIndex[.dstmac]
                }
                Text(frame?.frameFormat.rawValue ?? "")
                frame?.ieeeLength.map { Text("Len \($0)")}
            }
            Group {
                frame?.ieeeDsap.map { Text("DSAP \($0.hex)")}
                frame?.ieeeSsap.map { Text("SSAP \($0.hex)")}
                frame?.ieeeControl.map { Text("CTRL \($0.hex)")}
                frame?.snapOrg.map { Text("ORG \($0.hex6)")}
                frame?.snapType.map { Text("SnapType \($0.hex4)")}
                frame?.ethertype.map { Text("Ethertype \($0.hex4)")}
                Spacer()
            }
            
    }.padding().cornerRadius(8).border(Color.green.opacity(0.7),width: 2).padding()
    }
}

struct Layer2DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Layer2DetailView(frame: .constant(Frame.sampleFrame), startHighlight: .constant(nil), endHighlight: .constant(nil))
    }
}
