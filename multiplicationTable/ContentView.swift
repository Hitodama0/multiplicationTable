//
//  ContentView.swift
//  multiplicationTable
//
//  Created by Biagio Ricci on 05/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var multTable: Int = Int.random(in: 2...12)
    @State private var number: Int = Int.random(in: 2...12)
    @State private var results = [String]()
    @State private var userInput = ""
    @State private var questions = ""
    @State private var text = ""
    @State private var score = 0
    @FocusState private var isFocused: Bool
    var body: some View {
        NavigationView{
            VStack {
                Text("Score: \(score)")
                    .font(.title2)
                
                Text(questions)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                TextField("User input", text: $userInput)
                    .keyboardType(.decimalPad)
                    .focused($isFocused)
                
                Text("\(text)")
                    .foregroundColor(text == "Correct" ? .green : .red)
                
                List{
                    ForEach(results, id: \.self) {
                        resu in Text(resu)
                    }
                }
            }
            .padding()
            .toolbar{
                Button("New Question", action: question)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                        result()
                    }
                }
            }
        }
    }
    
    func question() {
        multTable = Int.random(in: 2...12)
        number = Int.random(in: 2...12)
        userInput = ""
        text = ""
        questions = "\(multTable) * \(number) = "
    }
    
    func result() {
        let result = "\(multTable * number)"
        
        if result == userInput {
            text = "Correct"
            score += multTable
            results.insert(result, at: 0)
        }
        else {
            text = "Wrong"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
