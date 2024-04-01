//
//  ContentView.swift
//  RideCap
//
//  Created by Cameron Kania on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    // initalize variables
    @State private var numberOfVehicles = 0
    @State private var vehcicleCapacity = 0
    @State private var showTime = 0
    @State private var loadTime = 0
    @State private var unloadTime = 0
    
    @FocusState private var showTimeIsFocused: Bool
    @FocusState private var loadTimeIsFocused: Bool
    @FocusState private var unloadTimeIsFocused: Bool
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Vehicle Inputs"){
                    Picker("Number of Vehicles", selection: $numberOfVehicles){
                        ForEach(0..<101) {
                            Text("\($0) RVs")
                        }
                        .pickerStyle(.navigationLink)
                    }
                    Picker("Vehicle Capacity", selection: $vehcicleCapacity){
                        ForEach(0..<101) {
                            Text("\($0) riders")
                        }
                        .pickerStyle(.navigationLink)
                    }
                }
                
                Section("Show Timing Inputs"){
                    Text("Enter the Load Time")
                    TextField("Enter amount", value: $loadTime, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($loadTimeIsFocused)
                    
                    Text("Enter the Show Time")
                    TextField("Enter amount", value: $showTime, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($showTimeIsFocused)
                    
                    Text("Enter the Nnload Time")
                    TextField("Enter amount", value: $unloadTime, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($unloadTimeIsFocused)
                }
            }
            
            .navigationTitle("Ride Capacity")
            .toolbar {
                if showTimeIsFocused{
                    Button("Done") {
                        showTimeIsFocused = false
                    }
                }
                if loadTimeIsFocused{
                    Button("Done") {
                        loadTimeIsFocused = false
                    }
                }
                if unloadTimeIsFocused{
                    Button("Done") {
                        unloadTimeIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
