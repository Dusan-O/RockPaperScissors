//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Dusan Orescanin on 28/08/2022.
//

import SwiftUI

struct ContentView: View {
    /// Bool to show
    @State var showAlert = false
    @State var showSheet = false
    
    /// Timer
    @State var timer: Timer?
    
    /// Game elements
    @State var score = 0
    @State var computerChoice = 0
    @State var myChoice = 0
    
    /// Answers values
    let icons = ["rock", "paper", "scissors"]
    var pierreCasseCiseaux = "La pierre casse les ciseaux"
    var ciseauxCoupePapier = "Les ciseaux coupent le papier"
    var paperEnveloppePierre = "Le papier enveloppe la pierre"
    var gagne = "C'est gagné!"
    var perdu = "Perdu ! Essaye encore"
    var draw = "Match nul"
    var drawExplain = "Vous avez choisi le même objet"
    
    var body: some View {
        GeometryReader { proxy in
            let idealSize = proxy.size.width / 3
            VStack {
                Text("Rock Paper Scissors")
                    .font(.largeTitle)
                    .foregroundColor(.mint)
                    .bold()
                Divider()
                    .frame(height: 2)
                    .overlay(.mint)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                HStack {
                    Image(icons[myChoice])
                        .resizable()
                        .frame(width: idealSize, height: idealSize)
                    Spacer()
                    Text("VS")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                    Spacer()
                    Image(icons[computerChoice]).resizable()
                    .frame(width: idealSize, height: idealSize)
                }.padding()
                Spacer()
                Text("Score: \(score)")
                    .font(.title)
                    .italic()
                    .foregroundColor(.mint)
                Spacer()
                Button("Choose") {
                    /// Show the confirmation dialog
                    
                }.buttonStyle(.borderedProminent)
            }
        }
        // Alerts & Dialogs
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
