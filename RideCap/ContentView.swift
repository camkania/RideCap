//
//  ContentView.swift
//  RideCap
//
//  Created by Cameron Kania on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    // initalize variables
    let secondsPerHour = 3600.0
    @State private var vehcicleCapacity = 12
    @State private var dispatchInterval = 20.0
    
    @FocusState private var dispatchIsFocused: Bool
    
    var thrc: Double {
        //Calcuate the thrc here
        
        //3600 seconds per hour / 20 second dispatch * 12 guests or 2,160 guest-per-hour
        let capacity = (secondsPerHour / dispatchInterval) * Double(vehcicleCapacity)
        
        return capacity
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Vehicle Inputs"){
                    Picker("Vehicle Capacity", selection: $vehcicleCapacity){
                        ForEach(0..<101) {
                            Text("\($0) riders")
                        }
                        .pickerStyle(.navigationLink)
                    }
                }
                
                Section("Show Timing Inputs (in seconds)"){
                    //Load Time input
                    HStack{
                        Text("Dispatch Interval")
                        TextField("Enter amount", value: $dispatchInterval, format: .number)
                            .textFieldStyle(RoundedBorderTextFieldStyle()) // To make TextField look like a picker
                            .multilineTextAlignment(.trailing)
                            .padding(.horizontal) // Add some padding for better spacing
                            .keyboardType(.decimalPad)
                            .focused($dispatchIsFocused)
                    }
                    .frame(height: 1) // Adjust height as needed
                }
                
                Section("Theoretical Hourly Ride Capacity (THRC)"){
                        Text(thrc, format: .number)
                    }
                }
                
                .navigationTitle("Ride Capacity")
                .toolbar {
                    if dispatchIsFocused{
                        Button("Done") {
                            dispatchIsFocused = false
                        }
                    }

                }
            }
        }
    }

#Preview {
    ContentView()
}
