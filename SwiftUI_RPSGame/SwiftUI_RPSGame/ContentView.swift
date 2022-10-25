//
//  ContentView.swift
//  SwiftUI_RPSGame
//
//  Created by 박재경 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var rpsGame0:Bool = false
    @State private var rpsGame1:Bool = false
    @State private var rpsGame2:Bool = false
    
    @State private var myChoose = Rps(rawValue: Int.random(in: 0...2))
    
    @State var comChoiceImage:String = "rock"
    @State var myChoiceImage:String = "rock"
    
    @State var result:Bool = false
    @State var resultText:String = ""
    
    
    var body: some View {
        VStack{ // stack 잡기
            Spacer()
                .frame(height: 50)
            
            Text("가위 바위 보")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 100)
            
            chooseStack()
            
            buttonStack
            
            Spacer()
            
            Text("결과는?")
                .font(.title2)
                .bold()
            
            
            Spacer(minLength: .zero)// 가로 최소 길이 = 0
            
            
        }
        .alert(isPresented: $result){
            Alert(title: Text(resultText), message: nil, dismissButton: .default(Text("확인")))
        }
    }
    @ViewBuilder
    private func chooseStack() -> some View {
        HStack(alignment: .center){
            VStack{
                Text("Computer")
                    .font(.title3)
                
                Image(comChoiceImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
            }
            Spacer()
            VStack{
                Text("Me")
                    .font(.title3)
                
                Image(myChoiceImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
            }
        }
        .padding(20)
    }
    private func selectButton() {
        guard let comChoose = Rps(rawValue: Int.random(in: 0...2)) else {return}
        
        switch comChoose {
        case .rock:
            comChoiceImage = "rock"
            break
        case .paper:
            comChoiceImage = "paper"
            break
        case .scissors:
            comChoiceImage = "scissors"
            break
        }
        
        if myChoose == comChoose {
            resultText = "비겼다"
            result.toggle()
        } else if myChoose == .rock && comChoose == .scissors {
            resultText = "이겼다"
            result.toggle()
        } else if myChoose == .scissors && comChoose == .paper {
            resultText = "이겼다"
            result.toggle()
        } else if myChoose == .paper && comChoose == .rock {
            resultText = "이겼다"
            result.toggle()
        } else {
            resultText = "졌다"
            result.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var buttonStack: some View {
        return HStack(alignment: .center){
            Button {
                myChoose = Rps(rawValue: 0)
                self.myChoiceImage = "rock"
                rpsGame0.toggle()
                selectButton()
                
            } label: {
                Image("rock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            Button {
                myChoose = Rps(rawValue: 1)
                self.myChoiceImage = "paper"
                rpsGame1.toggle()
                selectButton()
            } label: {
                Image("paper")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            Button {
                myChoose = Rps(rawValue: 2)
                self.myChoiceImage = "scissors"
                rpsGame2.toggle()
                selectButton()
            } label: {
                Image("scissors")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            
        }
        
    }
    
}
