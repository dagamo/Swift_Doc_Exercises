//
//  ContentView.swift
//  Scrumdinger
//
//  Created by David Garcia on 9/12/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value:15, total: 100)
            HStack{
                VStack(alignment: .leading ){
                    Text("Second Elapsed").font(.caption)
                    Label("300",  systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Second Remaining").font(.caption)
                    Label("600",  systemImage: "hourglass.bottomhalf.fill")
                }
                
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("10 minutes")
            Circle().strokeBorder(lineWidth: 24)
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action:{}){
                    Image(systemName:"forward.fill")
                }
                .accessibilityLabel("Next Speaker")
                
            }
        }.padding()
    }
}

#Preview {
    MeetingView()
}
