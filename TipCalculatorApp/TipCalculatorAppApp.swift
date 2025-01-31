//  ContentView.swift
//  TipCalculatorApp
//  Created by Ronish, Torment on 1/29/25.
import SwiftUI
@main
struct ContentView:View{
    @State private var billAmount:Double=0
    @State private var tipPercentage:Double=0
    @State private var numberOfPeople:Double=1
    @State private var showResults:Bool=false
    @State private var dollarSwitch:Bool=true
    @State var tipAmount:Double=0
    @State var totalAmount:Double=0
    @State var amountPerPerson:Double=0
    @State var currency:String="Euro"
    @State var symbol:String="$"
    @State var calcTxt:String="Calculate"
    var body:some View{
        VStack{
            Text("Tip Calculator")
                .fontWeight(.semibold)
                .font(.largeTitle)
            HStack{
                if dollarSwitch==true{
                    Image("Dollar")
                }else{
                    Image("Euro")
                }
                Button{
                    if(dollarSwitch==true){
                        dollarSwitch=false
                        currency="Dollar"
                        symbol="€"
                    }else{
                        dollarSwitch=true
                        currency="Euro"
                        symbol="$"
                    }
                }label:{
                    Text("Switch to \(currency)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                }
                .frame(minWidth:0,maxWidth:100)
                .buttonStyle(.bordered)
            }
        }
        VStack{//bill slider
            Text("Bill Amount: \(symbol)\(billAmount,format:.number.rounded(increment:0.01))")
                .fontWeight(.semibold)
                .font(.title)
            Slider(value:$billAmount,in:0...500)
                .accentColor(.green)
                .padding(.horizontal,20)
        }
        VStack{//percent slider
            Text("Tip Percentage: \(tipPercentage,format:.number.rounded(increment:0.01))%")
                .fontWeight(.semibold)
                .font(.title)
            Slider(value:$tipPercentage,in:0...30)
                .accentColor(.green)
                .padding(.horizontal,20)
        }
        VStack{//people slider
            Text("Number of People: \(numberOfPeople,format:.number.rounded(increment:1.0))")
                .fontWeight(.semibold)
                .font(.title)
            Slider(value:$numberOfPeople,in:1...20)
                .accentColor(.green)
                .padding(.horizontal,20)
        }
        VStack{//calculate button
            Button{
                if(showResults==true){
                    calcTxt="Calculate"
                    showResults=false
                }else{
                    calcTxt="Hide Result"
                    showResults=true
                }
                tipAmount=billAmount*(tipPercentage*0.01)
                totalAmount=billAmount+tipAmount
                amountPerPerson=totalAmount/numberOfPeople
            }label:{
                Text("\(calcTxt)")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
            .frame(minWidth:100,maxWidth:120,minHeight:30,maxHeight:40)
            .buttonStyle(.bordered)
            .background(.blue)// make red when pressed
            .cornerRadius(15)
            .controlSize(.extraLarge)
            if showResults==true{
                VStack{
                    Text("Look at me\n hello also\nokay last time")// fix
                        .padding(10)
                        .fontWeight(.semibold)
                        .font(.system(size:25))
                        .multilineTextAlignment(.center)
                        .background(.gray,ignoresSafeAreaEdges:.bottom)
                        .cornerRadius(15)
                }
            }
        }
    }
}
#Preview{ContentView()}
