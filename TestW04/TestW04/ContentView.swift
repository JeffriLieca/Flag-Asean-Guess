//
//  ContentView.swift
//  TestW04
//
//  Created by Christian on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    @State private var angkaRandom = Int.random(in: 0...9)
    @State private var counter: Int = 0
    @State var uniqueNumbers: Set<Int> = []
    @State var showAlert=false

    func resetGame(){
        uniqueNumbers.removeAll()
        showAlert=false
        counter=0
        angkaRandom = Int.random(in: 0...9)
    }
    
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea().onAppear{uniqueNumbers.insert(angkaRandom)}
            
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[angkaRandom])
                    .foregroundStyle(.black)
            }.alert(isPresented: $showAlert) {
                Alert(
                    
                    title: Text("Selesai!"),
                    message: Text("Anda telah menebak 10 kali dan benar \(counter)"),
                    primaryButton: .default(Text("Main Lagi")) {
                        resetGame()
                    },
                    secondaryButton: .destructive(Text("Udah ah capek")){
                        exit(0)
                    }
                )
            }
        }

//        Text("Nilai counter: \(counter)")
        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                        
                        if (uniqueNumbers.count<10){
                            if (number==angkaRandom){
                                print(asean[number])
                                counter+=1
                            }
                                repeat{
                                    
                                    
                                    angkaRandom = Int.random(in: 0...9)
                                }
                                while uniqueNumbers.contains(angkaRandom)
                                    
                                uniqueNumbers.insert(angkaRandom)
                            
                        }
                        else{
                            showAlert=true
                        }
                        
                    } label: {
                        
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }
                    
                }
            }
            Spacer()
            VStack{
                ForEach(5..<10) { number in
                    Button {
                        if (uniqueNumbers.count<10){
                            if (number==angkaRandom){
                                print(asean[number])
                                counter+=1
                            }
                                repeat{
                                    
                                    
                                    angkaRandom = Int.random(in: 0...9)
                                }
                                while uniqueNumbers.contains(angkaRandom)
                                    
                                uniqueNumbers.insert(angkaRandom)
                            
                        }
                        else{
                            showAlert=true
                        }
                        
                        
                    } label: {
                        
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }
                }
            }
            Spacer()
        }
        
        
    }
    
    func printConsole() {
        print("Hai")
    }
    
    func buttonBerbahaya(){
        print("wow")
    }
}

#Preview {
    ContentView()
}


//VStack{
//    Button("Submit", role: .cancel ,action: printConsole)
//        .buttonStyle(.bordered)
//        
//    Button("Delete", role: .destructive){
//        alertShown = true
//    } .alert("BAHAYA", isPresented: $alertShown){
//        Button("Wah!", role: .cancel) {}
//        Button("Kabor!", role: .destructive) {}
//    } message: {
//        Text("Mangga dibaca")
//    }
//        .buttonStyle(.borderedProminent)
//        
//    
//    
//    Button{
//        print("Coba")
//    } label: {
//        Text("Compose")
//        Image(systemName: "mail")
//    }
//    .buttonStyle(.bordered)
//}
