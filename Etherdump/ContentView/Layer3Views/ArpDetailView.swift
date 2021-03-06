//
//  ArpDetailView.swift
//  Etherdump
//
//  Created by Darrell Root on 3/4/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import SwiftUI
import PackageEtherCapture

struct ArpDetailView: View {
    let arp: Arp
    @EnvironmentObject var highlight: Highlight

    @EnvironmentObject var appSettings: AppSettings
    var body: some View {
        return VStack (spacing:12){
                HStack {
                   Text(arp.operation.rawValue).font(.headline)
                    .onTapGesture {
                        self.highlight.start = self.arp.startIndex[.operation]
                        self.highlight.end = self.arp.endIndex[.operation]
                    }
                   Spacer()
                }
            VStack (spacing:6){
                HStack {
                    Text("Sender \(arp.senderEthernet)")
                        .onTapGesture {
                            self.highlight.start = self.arp.startIndex[.senderEthernet]
                            self.highlight.end = self.arp.endIndex[.senderEthernet]
                    }
                    Text(arp.senderIp.debugDescription)
                        .onTapGesture {
                            self.highlight.start = self.arp.startIndex[.senderIp]
                            self.highlight.end = self.arp.endIndex[.senderIp]
                    }
                    Spacer()
                }
                HStack {
                    Text("Target \(arp.targetEthernet)")
                        .onTapGesture {
                            self.highlight.start = self.arp.startIndex[.targetEthernet]
                            self.highlight.end = self.arp.endIndex[.targetEthernet]
                    }
                    Text(arp.targetIp.debugDescription)
                        .onTapGesture {
                            self.highlight.start = self.arp.startIndex[.targetIp]
                            self.highlight.end = self.arp.endIndex[.targetIp]
                    }
                    Spacer()
                }
                HStack {
                    Text("hwType \(arp.hardwareType)")
                        .onTapGesture {
                            self.highlight.start = self.arp.startIndex[.hardwareType]
                            self.highlight.end = self.arp.endIndex[.hardwareType]
                    }
                    Text("hwSize \(arp.hardwareSize)")
                        .onTapGesture {
                            self.highlight.start = self.arp.startIndex[.hardwareSize]
                            self.highlight.end = self.arp.endIndex[.hardwareSize]
                    }
                    Spacer()
                        
                }
                HStack {
                    Text("protocolType \(arp.protocolType.hex)")
                        .onTapGesture {
                            self.highlight.start = self.arp.startIndex[.protocolType]
                            self.highlight.end = self.arp.endIndex[.protocolType]
                    }

                    Text("protocolSize \(arp.protocolSize)")
                        .onTapGesture {
                            self.highlight.start = self.arp.startIndex[.protocolSize]
                            self.highlight.end = self.arp.endIndex[.protocolSize]
                    }

                    Spacer()
                }
            }.font(appSettings.font).padding().cornerRadius(8).border(Color.black.opacity(0),
                width: 0).padding(1).background(Color.black.opacity(0.4))
                
    }.padding().cornerRadius(8).border(Color.green.opacity(0.7), width: 2).padding()
    }
}

struct ArpDetailView_Previews: PreviewProvider {
    static var makeArp: Arp {
        let packetStream = "ffffffffffff685b35890a0408060001080006040001685b35890a04c0a8000a000000000000c0a8000b"
        let data = Frame.makeData(packetStream: packetStream)!
        let frame = Frame(data: data, timeval: timeval(), originalLength: 42)
        guard case .arp(let arp) = frame.layer3 else { fatalError() }
        return arp
    }
    
    static var previews: some View {
        ArpDetailView(arp: ArpDetailView_Previews.makeArp)
            .environmentObject(AppSettings()).environmentObject(Highlight())
    }
}
