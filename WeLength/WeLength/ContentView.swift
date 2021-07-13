//
//  ContentView.swift
//  WeLength
//
//  Created by Miquel Bosch on 29/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State Variables
    @State private var inputAmount = ""
    @State private var fromConversorIndex = 1
    @State private var toConversionIndex = 1
    
    // MARK: - Constants
    let units: [(name: String, conversor: Double)] = [("mm", 0.001),
                                                      ("cm", 0.01),
                                                      ("m", 1),
                                                      ("km", 1000),
                                                      ("in", 2.54)]
    
    var inputValue: Double {
        return Double(inputAmount) ?? 0
    }
    
    var unitAmount: Double {
        let unit = units[fromConversorIndex]
        return inputValue * unit.conversor
    }
    
    var convertedAmount: Double {
        let unit = units[toConversionIndex]
        return unitAmount / unit.conversor
    }
    
    
    // MARK: - Body
    var body: some View {
   
        Form {
            
            Section(header: Text("Convert:")) {
                
                TextField("Amount to convert:", text: $inputAmount)
                    .keyboardType(.decimalPad)
                
                Picker("From unit", selection: $fromConversorIndex) {
                    
                    ForEach(0 ..< units.count) {
                        Text("\(units[$0].name)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("To")) {
                
                Picker("To unit", selection: $toConversionIndex) {
                    
                    ForEach(0 ..< units.count) {
                        Text("\(units[$0].name)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                
                Text("\(convertedAmount)" + " \(units[toConversionIndex].name)")
            }
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
