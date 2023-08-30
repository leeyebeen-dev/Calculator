//
//  ContentView.swift
//  Calculator
//
//  Created by 이예빈 on 2023/08/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    
    private let buttonData: [[String]] = [
        ["C","/","%","$"],
        ["7","8","9","X"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["0","0",".","="],
    ]
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack{
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                }
                
                
                ForEach(buttonData, id: \.self){
                    line in
                    
                    HStack{
                        ForEach(line, id: \.self){
                            row in
                            
                            Button{
                                if totalNumber == "0" {
                                    totalNumber = row
                                } else {
                                    totalNumber += row
                                }
                            } label: {
                                Text(row)
                                    .frame(width: 80, height:80)
                                    .background(Color("NumberButton"))
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.system(size: 33))
                            }
                            
                        }
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
