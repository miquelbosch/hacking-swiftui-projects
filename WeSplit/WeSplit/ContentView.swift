//
//  ContentView.swift
//  WeSplit
//
//  Created by Miquel Bosch on 20/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: String = ""
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 2
    
    let tipPercentages = [10, 15, 20, 0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text("Total amount: \(checkAmount) €")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
