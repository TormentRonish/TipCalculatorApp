//  ContentView.swift
//  TipCalculatorApp
//  Created by Ronish, Torment on 1/29/25.
import SwiftUI
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
                .shadow(radius: 20)
            }
        }
        VStack{//bill slider
            Text("Bill Amount: \(symbol)\(billAmount,format:.number.rounded(increment:0.01))")
                .fontWeight(.semibold)
                .font(.title)
            Slider(value:$billAmount,in:0...500)
                .accentColor(.green)
                .padding(.horizontal,20)
                .onChange(of: billAmount){
                    tipAmount=billAmount*(tipPercentage*0.01)
                    totalAmount=billAmount+tipAmount
                    amountPerPerson=totalAmount/numberOfPeople
                }
        }
        VStack{//percent slider
            Text("Tip Percentage: \(tipPercentage,format:.number.rounded(increment:0.01))%")
                .fontWeight(.semibold)
                .font(.title)
            Slider(value:$tipPercentage,in:0...30)
                .accentColor(.green)
                .padding(.horizontal,20)
                .onChange(of: tipPercentage){
                    tipAmount=billAmount*(tipPercentage*0.01)
                    totalAmount=billAmount+tipAmount
                    amountPerPerson=totalAmount/numberOfPeople
                }
        }
        VStack{//people slider
            Text("Number of People: \(numberOfPeople,format:.number.rounded(increment:1.0))")
                .fontWeight(.semibold)
                .font(.title)
            Slider(value:$numberOfPeople,in:1...20)
                .accentColor(.green)
                .padding(.horizontal,20)
                .padding(.bottom)
                .onChange(of: numberOfPeople){
                    tipAmount=billAmount*(tipPercentage*0.01)
                    totalAmount=billAmount+tipAmount
                    amountPerPerson=totalAmount/numberOfPeople
                }
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
            .background(showResults ? .red : .blue)
            .cornerRadius(15)
            .shadow(radius: 20)
            if showResults==true{
                VStack{
                    Text("Tip Amount: \(symbol)\(tipAmount,format:.number.rounded(increment:0.01))\nTotal Amount: \(symbol)\(totalAmount,format:.number.rounded(increment:0.01))\nAmount per Person: \(symbol)\(amountPerPerson,format:.number.rounded(increment:0.01))")
                        .padding(10)
                        .fontWeight(.semibold)
                        .font(.system(size:20))
                        .multilineTextAlignment(.center)
                        .background(.gray)
                        .cornerRadius(15)
                        .shadow(radius: 20)
                }
            }
        }
    }
}
#Preview{ContentView()}
