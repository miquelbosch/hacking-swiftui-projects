//
//  ContentView.swift
//  GameFlag
//
//  Created by Miquel Bosch on 17/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Variables
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    
    let puntuation = (correct: 10, incorrect: 20)
    
    var body: some View {
        
        ZStack {
            
            Color.gray.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tag the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                
                ForEach(0..<3) { number in
                    
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 2)
                    }
                    
                }
                
                Text("Your score is: \n \(userScore)")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }

        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue"), action: {
                self.askQuestion()
            }))
        })
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            addScore()
            askQuestion()
        } else {
            scoreTitle = "Wrong"
            restScore()
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func addScore() {
        userScore = userScore + puntuation.correct
    }
    
    func restScore() {
        userScore = userScore - puntuation.correct
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
