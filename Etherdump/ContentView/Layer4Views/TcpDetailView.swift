//
//  TcpDetailView.swift
//  Etherdump
//
//  Created by Darrell Root on 2/7/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import SwiftUI
import PackageEtherCapture

struct TcpDetailView: View {
    var tcp: Tcp
    @EnvironmentObject var appSettings: AppSettings
    var body: some View {
        VStack (spacing:12){
            HStack{
                Text("TCP").font(.headline)
                Spacer()
            }
            HStack{
                VStack (alignment: .leading, spacing:6 ){
                HStack{
                    Text(verbatim: "\(tcp.sourcePort) > \(tcp.destinationPort)")
                }
                    HStack{
                Text("Flags: \(tcp.flags)")
                    }
                    HStack{
                Text("Payload: \(tcp.payload.count) bytes")
                    }
                Group{
                    HStack {
                Text(verbatim: "Seq: \(tcp.sequenceNumber)")
                    }
                    HStack{
                Text(verbatim: "Ack: \(tcp.acknowledgementNumber)")
                    }
                    HStack{
                Text(verbatim: "Window: \(tcp.window)")
                }
                HStack{
                Text(verbatim: "Urgent: \(tcp.urgentPointer)")
                }
                HStack{
                Text(verbatim: "Offset: \(tcp.dataOffset)")
            }
                }
                
            }
                HStack{
                    PayloadView(payload: tcp.payload)
                }
            }.font(appSettings.font)
                .padding().cornerRadius(8).border(Color.black.opacity(0),
            width: 0).padding(1).background(Color.black.opacity(0.4))
            
        }.padding().cornerRadius(8).border(tcp.rst ? Color.red.opacity(0.7) : Color.green.opacity(0.7), width: 2).padding()
    }
}

struct TcpDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        guard case .tcp(let tcp) = Frame.sampleFrame.layer4 else {
            print("fatal error")
            fatalError()
        }
        return TcpDetailView(tcp: tcp)
        .environmentObject(AppSettings()).font(.system(.body, design: .monospaced))
    }
}
