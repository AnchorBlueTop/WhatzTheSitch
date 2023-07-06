//
//  Home.swift
//  WhatzTheSitch
//
//  Created by Harshil Patel on 11/02/22.
//

import SwiftUI
import SwiftUICharts

struct Home: View {
    @State private var posts = [Post]()
    
    // Placeholder values for preview
    @State private var community_cases = "-"
    @State private var date: String = "-"
    @State private var border_cases: String = "-"
    @State private var active_cases: String = "-"
    @State private var hospital_cases: String = "-"
    @State private var ICU_cases: String = "-"
    @State private var total_deaths: String = "-"
    
    @State private var two_doses: String = "-"
    @State private var booster_doses: String = "-"
    @State private var days_since: String = "-"
    @State private var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    @State private var community_cases_array: [[String]] = []
    @State private var community_cases_temp: [[String]] = []
    @State private var community_cases_num: [Double] = []
    @State private var comm_posts = [Post]()
    @State private var percentage_change: Int = 0
    @State private var first_week: Int = 0
    
    @State private var vax_posts = [Post]()
    @State private var yes_booster: Double = 0.0
    @State private var no_booster: Double = 0.0
    
    @State private var magenta_padding: Double = 4.9
    @State private var violet_padding: Double = 2.1
    @State private var ipod_padding: Double = 0
    
    @State private var height_padding1: Double = 75
    @State private var height_padding2: Double = 275
    @State private var height_padding3: Double = 445
    
    @State private var width_padding: Double = 170
    
    @State private var line_height: Double = 180
    @State private var pie_height: Double = 180
    @State private var text_padding: Double = 80
    
    @State private var text_spacing: Double = 12.0
    
    @State private var line_title: String = "Past 14 Day Community Cases:"
    @State private var pie_title: String = "18+ Booster %:"


    @State var selectedTab = "house"
    var body: some View {
        
        // ZStack
        ZStack {
            Text("")
                .onAppear {
                    // Padding for each iPhone height
                    if (UIScreen.main.bounds.height == 568.0){
                        self.ipod_padding = 77
                        self.magenta_padding = 7
                        self.height_padding1 = 77
                        self.height_padding2 = 257
                        self.height_padding3 = 397
                        self.width_padding = 150
                        self.violet_padding = 1.95
                        self.text_padding = 45
                        self.text_spacing = 5.0
                        self.pie_title = "Booster %:"
                    }
                    
                    if (UIScreen.main.bounds.height == 667.0){
                        self.ipod_padding = 20
                        self.magenta_padding = 5.7
                        self.violet_padding = 2.0
                        self.text_padding = 65
                    }

                    if (UIScreen.main.bounds.height == 812.0){
                        self.text_padding = 30
                        self.line_height = 230
                        self.pie_height = 230
                        self.magenta_padding = 6.0
                        self.violet_padding = 1.9
                    }
                    
                    if (UIScreen.main.bounds.height == 736.0){
                        self.line_height = 190
                        self.pie_height = 190
                        self.ipod_padding = -10
                        self.violet_padding = 2.0
                    }
                    
                    if (UIScreen.main.bounds.height == 844.0){
                        self.text_padding = 25
                        self.line_height = 230
                        self.pie_height = 230
                        self.magenta_padding = 5.8
                        self.violet_padding = 1.85

                    }
                    
                    if (UIScreen.main.bounds.height == 896.0){
                        self.ipod_padding = 10
                        self.text_padding = 15
                        self.line_height = 230
                        self.pie_height = 230
                        self.magenta_padding = 5.3
                        self.violet_padding = 1.95
                    }
                    
                    if (UIScreen.main.bounds.height == 926.0){
                        self.text_padding = 30
                        self.line_height = 245
                        self.pie_height = 230
                        self.magenta_padding = 5.2
                        self.violet_padding = 1.9
                    }
                    
                }
            //RoundedRectangle(cornerRadius: 25)
             //   .fill(Color(red: 255 / 255, green: 0 / 255, blue: 161 / 255)).opacity(0.3)
              //  .frame(width: UIScreen.main.bounds.width / 1.2, height: 255)
              //  .padding(.top, 205)
            
        
            VStack(alignment: .center, spacing: self.text_spacing) {
                Text("Daily Summary")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, ipod_padding)
                    Text(date)
                    .font(.title2)
                Spacer()
                    .onAppear {
                    community_cases_num = []
                    Api().getPosts { (posts) in // API Call
                        self.posts = [posts]
                        self.date = posts.values[0].joined(separator: "")
                        self.community_cases = posts.values[1].joined(separator: "")
                        self.border_cases = posts.values[2].joined(separator: "")
                        self.active_cases = posts.values[3].joined(separator: "")
                        self.hospital_cases = posts.values[4].joined(separator: "")
                        self.ICU_cases = posts.values[5].joined(separator: "")
                        self.total_deaths = posts.values[6].joined(separator: "")
                        self.two_doses = posts.values[7].joined(separator: "")
                        self.booster_doses = posts.values[8].joined(separator: "")
                        self.days_since = posts.values[9].joined(separator: "")
                        }
                    
                        ApiComm().getPosts { (comm_posts) in
                            self.comm_posts = [comm_posts]
                            self.community_cases_array = comm_posts.values
                            self.community_cases_temp = (self.community_cases_array.suffix(14))
                            for i in 0 ..< self.community_cases_temp.count {
                                self.community_cases_num.append(Double(self.community_cases_temp[i][1] ) ?? 0.0)
                                if (i == 6){
                                    first_week = Int(self.community_cases_num.reduce(0, +) / 7)
                                }
                            }
                            let second_week = Int(self.community_cases_num.suffix(7).reduce(6, +) / 7)
                            self.percentage_change = Int(100 * abs(Double(second_week - first_week)) / Double(first_week))
                            
                                    
                            }
                        
                        ApiVax().getPosts { (vax_posts) in
                            self.vax_posts = [vax_posts]
                            self.yes_booster = Double(vax_posts.values[1][3]) ?? 0.0
                            self.no_booster = Double(vax_posts.values[2][3]) ?? 0.0
                            
                        }
                    }
            }.padding(.bottom, 550)
            
            LineChartView(data: self.community_cases_num, title: self.line_title, form: CGSize(width: UIScreen.main.bounds.width / 2.5, height: self.line_height),
                          rateValue: Int(self.percentage_change))
                .padding(.trailing, UIScreen.main.bounds.width / 2.25)
                .padding(.bottom, UIScreen.main.bounds.height / 2.5)
            PieChartView(data: [self.yes_booster, self.no_booster], title: self.pie_title, form: CGSize(width: UIScreen.main.bounds.width / 2.37, height: self.pie_height))
                .padding(.leading, UIScreen.main.bounds.width / 2.3)
                .padding(.bottom, UIScreen.main.bounds.height / 2.5)
            
            Circle()
                .fill(Color("Violet"))
                .frame(width:10, height: 10)
                .padding(.leading, 50)
                .padding(.bottom, UIScreen.main.bounds.height / self.violet_padding)
            Text("No")
                .font(.system(size: 12.5))
                .padding(.leading, 85)
                .padding(.bottom, UIScreen.main.bounds.height / self.violet_padding)
            
           
            Circle()
                .fill(Color("Magenta"))
                .frame(width:10, height: 10)
                .padding(.leading, 50)
                .padding(.bottom, UIScreen.main.bounds.height / self.magenta_padding)
            Text("Yes")
                .font(.system(size: 12.5))
                .padding(.leading, 85)
                .padding(.bottom, UIScreen.main.bounds.height / self.magenta_padding)
            
            ZStack{
                
                VStack{
                    Text(community_cases)
                        .font(.largeTitle)
                        .offset(y:45)
                    Text(" New Community \n          Cases")
                        .frame(width: 140, height: 90)

                    
                }.frame(width: 200, height: 100)
                    .padding(.trailing, width_padding)
                    .padding(.top, height_padding1)
                
                VStack{
                    Text(border_cases)
                        .font(.largeTitle)
                        .offset(y:45)
                    Text(" New Border \n      Cases")
                        .frame(width: 140, height: 90)
                }.frame(width: 200, height: 100)
                    .padding(.leading, width_padding)
                    .padding(.top, height_padding1)
                
                VStack{
                    Text(active_cases)
                        .font(.largeTitle)
                    Text("Active Cases")
                }.frame(width: 200, height: 100)
                    .padding(.trailing, width_padding)
                    .padding(.top, height_padding2)
                
                VStack{
                    Text(hospital_cases)
                        .font(.largeTitle)
                    Text("In Hospital")
                }
                .padding(.leading, width_padding)
                .padding(.top, height_padding2)
                VStack {
                    Text(ICU_cases)
                        .font(.largeTitle)
                    Text("In ICU")
                }
                .padding(.trailing, width_padding)
                .padding(.top, height_padding3)
                VStack{
                    Text(total_deaths)
                        .font(.largeTitle)
                    Text("Total Deaths")
                }
                .padding(.leading, width_padding)
                .padding(.top, height_padding3)
            }.propotionalFrame(width: 1, height: 0.7)
                .padding(.bottom, self.text_padding)

            
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-80, alignment: .center)
    }
    
    
    
}

extension View {
      func propotionalFrame(width: CGFloat, height: CGFloat, isSquared: Bool = false, alignment: Alignment = .center) -> some View {
        let finalWidth = UIScreen.main.bounds.width * width
        let finalHeight = isSquared ? finalWidth : UIScreen.main.bounds.height * height
        return frame(width: finalWidth, height: finalHeight)
      }
}

// Custom Hoverable Card Button...
struct CardButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        
        return configuration.label
        // decreasing scale when clicked...
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.easeIn, value: configuration.isPressed)
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
