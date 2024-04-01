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
    
    @State private var showTime = 0.0
    @State private var loadTime = 0.0
    @State private var unloadTime = 0.0
    

    
    @FocusState private var showTimeIsFocused: Bool
    @FocusState private var loadTimeIsFocused: Bool
    @FocusState private var unloadTimeIsFocused: Bool
    
    var cycleTime: Double {
       var totalTime = loadTime + showTime + unloadTime
        return totalTime
    }
    var thrc: Double {
        //Calcuate the thrc here
        //let numOfRVs = numberOfVehicles
        //let grandTotal = total
        //let amountPerPerson = grandTotal / peopleCount
        var capacity = 0.0
        return capacity
    }
   
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
                
                Section("Show Timing Inputs (in seconds)"){
                    HStack{
                        Text("Load Time:")
                        TextField("Enter amount", value: $loadTime, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle()) // To make TextField look like a picker
                            .multilineTextAlignment(.trailing)
                           .padding(.horizontal) // Add some padding for better spacing
                            .keyboardType(.decimalPad)
                            .focused($loadTimeIsFocused)
                    
                    }
                    .frame(height: 1) // Adjust height as needed
                    
                    HStack{
                        Text("Show Time:")
                        TextField("Enter amount", value: $showTime, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle()) // To make TextField look like a picker
                            .multilineTextAlignment(.trailing)
                           .padding(.horizontal) // Add some padding for better spacing
                            .keyboardType(.decimalPad)
                            .focused($showTimeIsFocused)
                    
                    }
                    .frame(height: 1) // Adjust height as needed
                    
                    HStack{
                        Text("Unload Time:")
                        TextField("Enter amount", value: $unloadTime, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle()) // To make TextField look like a picker
                            .multilineTextAlignment(.trailing)
                           .padding(.horizontal) // Add some padding for better spacing
                            .keyboardType(.decimalPad)
                            .focused($unloadTimeIsFocused)
                    }
                    .frame(height: 1) // Adjust height as needed
                }
                Section("Cycle Time"){
                    Text(thrc, format: .number)
                    
                }
                Section("Theoretical Hourly Ride Capacity (THRC)"){
                    Text(thrc, format: .number)
                    
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
