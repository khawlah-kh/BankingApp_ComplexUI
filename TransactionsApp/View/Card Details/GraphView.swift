//
//  GraphView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 22/03/2022.
//

import SwiftUI

struct GraphView: View {
    @StateObject var viewModel = CardViewModel()
    @State var startAnimatopn = false
    
    var body: some View {
        VStack{
            
            GeometryReader { geometryProxy in
                ZStack{
                    GraphBackgroundView()
                    ExpenseBarGraph(viewModel: viewModel, height: geometryProxy.size.height)
                    ExpenseLineGraph(data: viewModel.getExpenseDataBasedOnHeight(maxHeight: geometryProxy.size.height - 40))
                        .trim(to:startAnimatopn ? 1 : 0)
                        .stroke(lineWidth: 4.0)
                        .foregroundColor(.graphLine)
                        .animation(Animation.easeIn(duration: 2.0).delay(2.0))
                }
                .onAppear {
                    withAnimation {
                        startAnimatopn = true
                    }
                }
            }
            .padding(.horizontal,20)
            HStack{
                ForEach(DummyData.expenses){expense in
                    Text(expense.month)
                        .font(.caption)
                        .frame(width: 45)
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
            .preferredColorScheme(.dark)
    }
}

struct GraphBackgroundView : View{
    var body: some View {
        VStack{
            VStack{
                ForEach(0..<3){ _ in
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 0.3, dash: [5]))
                        .foregroundColor(Color.border)
                        .frame(height: 0.5)
                    Spacer()
                }
            }
            Line()
                .stroke(lineWidth: 0.5)
                .frame(height: 0.5)
        }
        .foregroundColor(.brandSecondary)
    }
}
struct Line : Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to:CGPoint(x: rect.width, y:0))
        return path
    }
}

struct ExpenseBarGraph : View{
    @StateObject var viewModel : CardViewModel
    let height : CGFloat
    var body: some View{
        HStack(alignment: .bottom){
            ForEach(viewModel.expenses){expense in
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.brandSecondary)
                            .frame(width: 60, height: 30)
                        Text("$ \(String(format: "%0.2f", expense.amount))")
                            .font(.system(size: 9))
                            .foregroundColor(.white)
                    }
                    .offset(y:-20)
                    .opacity(expense.selected ? 1 : 0)
                    
                    ZStack(alignment:.bottom) {
                        Rectangle()
                            .fill(expense.selected ? Color.barHighlightedBackground : Color.barBackground)
                            .frame(width: 45, height: getHeightForBarChart(maxHeight: height - 40, amount: expense.amount))
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedExpense(expense: expense)
                                }
                            }
                        Line()
                            .stroke(Color.graphLine,lineWidth: 2.0)
                            .frame(width:45, height:2)
                            .opacity(expense.selected ? 1 : 0)
                    }
                    
                }
                .frame(width: 45)
                .animation(Animation.linear.delay(0.0))
            }
            
        }
    }
    
    func getHeightForBarChart (maxHeight : CGFloat,amount:Float)->CGFloat{
        let max = viewModel.getMaxExpense()
        let fraction = CGFloat(amount/max)
        let barHeight = CGFloat(fraction * maxHeight)
        return barHeight
    }
}


struct ExpenseLineGraph : Shape {
    var data : [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        if data.count == 0
        {return path}
        var x : CGFloat = 30
        var y = data[0] + 40
        path.move(to: CGPoint(x: x, y: y))
        var prevPoint = CGPoint(x: x, y: y)
        x += 55
        
        for i in 1..<data.count{
            y = data[i] + 40
            let currentPoint = CGPoint(x: x, y: y)
            let controlPoint1 = CGPoint(x: prevPoint.x + 25, y: prevPoint.y)
            let controlPoint2 = CGPoint(x: currentPoint.x - 25, y: currentPoint.y)
            
            path.addCurve(to: currentPoint, control1: controlPoint1, control2: controlPoint2)
            
            
            prevPoint = CGPoint(x: x, y: y)
            x += 55
        }
        return path
    }
    
}
