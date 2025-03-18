//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by David Garcia on 18/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names:[String] = []
    @State private var nameToAdd:String = ""
    @State private var pickNamed:String = ""
    @State private var shouldRemovePickedName:Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8){
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickNamed.isEmpty ? " ": pickNamed)
                .foregroundStyle(.tint)
                .font(.title2)
                .bold()
            
            //List of items
            List {
                ForEach(names,  id:\.description){
                    name in Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius:8))
            //End of list
            TextField("Name to Add", text:$nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if(nameToAdd.isEmpty){
                        return
                    }
                    names.append(nameToAdd)
                    nameToAdd = ""
                }
            Divider()
            Toggle("Remove when Picked", isOn: $shouldRemovePickedName)
            Button{
                if let randomName = names.randomElement(){
                    pickNamed = randomName
                    if(shouldRemovePickedName){
                        names.removeAll{
                            name in return (name == randomName)
                        }
                    }
                }else{
                    pickNamed = ""
                }
            }
            label:{
                Text("Pick Random Name")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
