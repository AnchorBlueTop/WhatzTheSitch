//
//  PieChartView.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartView : View {
    public var data: [Double]
    public var title: String
    public var legend: String?
    public var style: ChartStyle
    public var formSize:CGSize
    public var dropShadow: Bool
    public var valueSpecifier:String
    @State private var font_value: Double = 15
    
    @State private var showValue = false
    @State private var currentValue: Double = 0 {
        didSet{
            if(oldValue != self.currentValue && self.showValue) {
                HapticFeedback.playSelection()
            }
        }
    }
    
    public init(data: [Double], title: String, legend: String? = nil, style: ChartStyle = Styles.pieChartStyleOne, form: CGSize? = ChartForm.medium, dropShadow: Bool? = true, valueSpecifier: String? = "%.1f"){
        self.data = data
        self.title = title
        self.legend = legend
        self.style = style
        self.formSize = form!
        if self.formSize == ChartForm.large {
            self.formSize = ChartForm.extraLarge
        }
        self.dropShadow = dropShadow!
        self.valueSpecifier = valueSpecifier!
        
    }
    
    public var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(UIColor.systemBackground))
                .cornerRadius(20)
                .shadow(color: self.style.dropShadowColor, radius: self.dropShadow ? 12 : 0)
            Text("")
                .onAppear{
                    if (UIScreen.main.bounds.height == 926.0){
                        self.font_value = 15
                    }
                    
                    if (UIScreen.main.bounds.height == 844.0){
                        self.font_value = 13.5
                    }
                    
                    
                    if (UIScreen.main.bounds.height == 736.0){
                        self.font_value = 15
                    }
                    
                    if (UIScreen.main.bounds.height == 568.0){
                        self.font_value = 12.5
                    }
                    
                    if (UIScreen.main.bounds.height == 667.0){
                        self.font_value = 12
                    }
                    
                    
                    if (UIScreen.main.bounds.height == 812.0){
                        self.font_value = 12
                    }
                }
            VStack(alignment: .leading){
                HStack{
                    if(!showValue){
                        Text(self.title)
                            .font(.system(size: self.font_value))
                            .bold()
                            .foregroundColor(Color("Text"))
                    }else{
                        Text("\(self.currentValue, specifier: self.valueSpecifier)")
                            .font(.headline)
                            .foregroundColor(Color("Text"))
                    }
                    Spacer()
                    Image(systemName: "chart.pie.fill")
                        .imageScale(.large)
                        .foregroundColor(Color("Text"))
                }.padding()
                PieChartRow(data: data, backgroundColor: self.style.backgroundColor, accentColor: self.style.accentColor, showValue: $showValue, currentValue: $currentValue)
                    .foregroundColor(self.style.accentColor).padding(self.legend != nil ? 0 : 12).offset(y:self.legend != nil ? 0 : -10)
                if(self.legend != nil) {
                    Text(self.legend!)
                        .font(.headline)
                        .foregroundColor(Color("Text"))
                        .padding()
                }
                
            }
        }.frame(width: self.formSize.width, height: self.formSize.height)
    }
}

#if DEBUG
struct PieChartView_Previews : PreviewProvider {
    static var previews: some View {
        PieChartView(data:[56,78,53,65,54], title: "Title", legend: "Legend")
    }
}
#endif
