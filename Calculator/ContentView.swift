//
//  ContentView.swift
//  Calculator
//
//  Created by 이예빈 on 2023/08/29.
//

import SwiftUI

enum ButtonType : String {
    case first, second, third, fourth, fifth, sixth, seventh, eighth, nineth, zero
    case dot, equal, add, subtract, multiply, divide
    case percent, opposite, clear
    
    var ButtonDisplayName: String {
        switch self {
        case .first :
            return "1"
        case .second :
            return "2"
        case .third :
            return "3"
        case .fourth :
            return "4"
        case .fifth :
            return "5"
        case .sixth :
            return "6"
        case .seventh :
            return "7"
        case .eighth :
            return "8"
        case .nineth :
            return "9"
        case .zero :
            return "0"
        case .dot :
            return "."
        case .equal :
            return "="
        case .add :
            return "+"
        case .subtract :
            return "-"
        case .multiply :
            return "X"
        case .divide :
            return "$"
        case .percent :
            return "%"
        case .opposite :
            return "/"
        case .clear :
            return "C"
        default:
            return "?"
        }
    }
    
    var backgroundColor: Color {
        switch self{
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .nineth, .zero, .dot:
            return Color("NumberButton")
        case .equal, .add, .subtract, .multiply, .divide:
            return Color.orange
        case .percent, .opposite, .clear:
            return Color("SymbolButton")
        }
    }
    
    var foregroundColor: Color {
        switch self{
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .nineth, .zero, .dot, .equal, .add, .subtract, .multiply, .divide:
            return Color.white
        case .percent, .opposite, .clear:
            return Color.black
        }
    }
}

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    
    private let buttonData: [[ButtonType]] = [
        [.clear,.opposite,.percent,.divide],
        [.seventh,.eighth,.nineth,.multiply],
        [.fourth,.fifth,.sixth,.subtract],
        [.first,.second,.third,.add],
        [.zero,.dot,.equal],
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
                                    
                                    if row == .clear {
                                        totalNumber = "0"
                                        
                                    }
                                    else if row == .add ||
                                            row == .subtract ||
                                            row == .multiply ||
                                            row == .divide {
                                        totalNumber = "Error"
                                    }
                                    else{
                                        totalNumber = row.ButtonDisplayName
                                    }
                                } else {
                                    
                                    if row == .clear {
                                        totalNumber = "0"
                                        
                                    }
                                    else{
                                        totalNumber += row.ButtonDisplayName
                                    }
                                }
                            } label: {
                                Text(row.ButtonDisplayName)
                                    .frame(width: row == .some(.zero) ? 165 : 80, height:80)
                                    .background(row.backgroundColor)
                                    .cornerRadius(40)
                                    .foregroundColor(row.foregroundColor)
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
