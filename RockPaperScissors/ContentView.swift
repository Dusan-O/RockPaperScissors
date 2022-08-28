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
    var win = "C'est gagné!"
    var lost = "Perdu ! Essaye encore"
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
                    showSheet.toggle()
                    
                }.buttonStyle(.borderedProminent)
            }
        }
        .onAppear() {
            playTimer()
        }
        
        // Alerts & Dialogs
        .alert(handleResults().title, isPresented: $showAlert, actions: {
            Button("Ok") {
                DispatchQueue.main.async {
                    self.score = self.handleResults().won ? self.score + 1 : self.score
                    self.playTimer()
                }
            }
        }, message: {
            Text(handleResults().message)
        })
        .confirmationDialog("Choose your weapon", isPresented: $showSheet) {
            Button("Rock") {
                self.myChoice = 0
                self.play()
            }
            Button("Paper") {
                self.myChoice = 1
                self.play()
            }
            Button("Cissors") {
                self.myChoice = 2
                self.play()
            }
        }

    }
    // HandleResults
    func handleResults() -> (title: String, message: String, won: Bool) {
        if (myChoice == computerChoice) {
            return(draw, drawExplain, false)
        } else if (myChoice == 0 && computerChoice == 2) {
            return(win, pierreCasseCiseaux, true)
        } else if (myChoice == 1 && computerChoice == 0) {
            return(win, paperEnveloppePierre, true)
        } else if (myChoice == 2 && computerChoice == 1) {
            return(win, ciseauxCoupePapier, true)
        } else if (myChoice == 0 && computerChoice == 1) {
            return(lost, paperEnveloppePierre, false)
        } else if (myChoice == 1 && computerChoice == 2) {
            return(lost, ciseauxCoupePapier, false)
        } else {
            return(lost, pierreCasseCiseaux, false)
        }
    }
    // Timer
    /// Play
    func play() {
        stopTimer()
        showAlert = true
    }
    /// PlayTimer
    func playTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { t in
            if self.computerChoice == 2 {
                self.computerChoice = 0
            } else {
                self.computerChoice += 1
            }
        })
    }
    /// StopTimer
    func stopTimer() {
        timer?.invalidate()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
