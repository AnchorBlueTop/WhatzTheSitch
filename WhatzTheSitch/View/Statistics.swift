//
//  Statistics.swift
//  WhatzTheSitch
//
//  Created by Harshil Patel on 12/02/22.
//

import SwiftUI
import SwiftUICharts

struct Statistics: View {
    
    @State private var comm_posts = [Post]()
    @State private var comm_chart: [Double] = []
    
    @State private var border_posts = [Post]()
    @State private var border_chart: [Double] = []
    
    @State private var tests_posts = [Post]()
    @State private var tests_chart: [Double] = []
    
    @State private var location_posts = [Post]()
    @State private var location_chart: [String] = []
    
    @State private var ethnicity_posts = [Post]()
    @State private var ethnicity_chart: [String] = []
    
    @State private var at_home: Double = 0.0
    @State private var miq: Double = 0.0
    
    @State private var maori_active: Double = 0.0
    @State private var pacific_active: Double = 0.0
    @State private var asian_active: Double = 0.0
    @State private var melaa_active: Double = 0.0
    @State private var european_active: Double = 0.0
    @State private var unknown_active: Double = 0.0
    
    @State private var maori_total: Double = 0.0
    @State private var pacific_total: Double = 0.0
    @State private var asian_total: Double = 0.0
    @State private var melaa_total: Double = 0.0
    @State private var european_total: Double = 0.0
    @State private var unknown_total: Double = 0.0
    
    @State private var maori_hospital: Double = 0.0
    @State private var pacific_hospital: Double = 0.0
    @State private var asian_hospital: Double = 0.0
    @State private var melaa_hospital: Double = 0.0
    @State private var european_hospital: Double = 0.0
    @State private var unknown_hospital: Double = 0.0

    var body: some View {
        ScrollView{
            VStack{
                Text("Statistics")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .onAppear{
                        self.comm_chart = []
                        ApiComm().getPosts{ (comm_posts) in
                            self.comm_posts = [comm_posts]
                            for i in 1 ..< comm_posts.values.count {
                                self.comm_chart.append(Double(comm_posts.values[i][1]) ?? 0.0)
                            }
                        }
                        self.border_chart = []
                        ApiBorder().getPosts{ (border_posts) in
                            self.border_posts = [border_posts]
                            for i in 1 ..< border_posts.values.count {
                                self.border_chart.append(Double(border_posts.values[i][1]) ?? 0.0)
                            }
                        }
                            
                        self.tests_chart = []
                            
                        ApiTests().getPosts{ (tests_posts) in
                            self.tests_posts = [tests_posts]
                            for i in 1 ..< tests_posts.values.count {
                                self.tests_chart.append(Double(tests_posts.values[i][1]) ?? 0.0)
                            }
                        }
                        
                        self.location_chart = []
                        ApiLocation().getPosts{ (location_posts) in
                            self.location_posts = [location_posts]
                            self.at_home = (Double(location_posts.values[location_posts.values.endIndex-1][1]) ?? 0.0)
                            self.miq = (Double(location_posts.values[location_posts.values.endIndex-1][2]) ?? 0.0)
                        }
                            
                        self.ethnicity_chart = []
                        
                        
                        // ApiEthnicity().getPosts{ (ethnicity_posts) in
                        //    self.ethnicity_posts = [ethnicity_posts]
                            
                        //    self.maori_active = (Double(ethnicity_posts.values[1][1]) ?? 0.0)
                        //    self.pacific_active = (Double(ethnicity_posts.values[2][1]) ?? 0.0)
                        //    self.asian_active = (Double(ethnicity_posts.values[3][1]) ?? 0.0)
                        //    self.melaa_active = (Double(ethnicity_posts.values[4][1]) ?? 0.0)
                        //    self.european_active = (Double(ethnicity_posts.values[5][1]) ?? 0.0)
                        //    self.unknown_active = (Double(ethnicity_posts.values[6][1]) ?? 0.0)
                            
                        //    self.maori_total = (Double(ethnicity_posts.values[1][2]) ?? 0.0)
                        //    self.pacific_total = (Double(ethnicity_posts.values[2][2]) ?? 0.0)
                        //    self.asian_total = (Double(ethnicity_posts.values[3][2]) ?? 0.0)
                        //    self.melaa_total = (Double(ethnicity_posts.values[4][2]) ?? 0.0)
                        //    self.european_total = (Double(ethnicity_posts.values[5][2]) ?? 0.0)
                        //    self.unknown_total = (Double(ethnicity_posts.values[6][2]) ?? 0.0)
                            
                        //    self.maori_hospital = (Double(ethnicity_posts.values[1][3]) ?? 0.0)
                        //    self.pacific_hospital = (Double(ethnicity_posts.values[2][3]) ?? 0.0)
                        //    self.asian_hospital = (Double(ethnicity_posts.values[3][3]) ?? 0.0)
                        //    self.melaa_hospital = (Double(ethnicity_posts.values[4][3]) ?? 0.0)
                        //    self.european_hospital = (Double(ethnicity_posts.values[5][3]) ?? 0.0)
                        //    self.unknown_hospital = (Double(ethnicity_posts.values[6][3]) ?? 0.0)
                        //}



                    }
                //BarChartView(data: ChartData(values: [
                //    ("Maori", self.maori_active),
                //    ("Pacific", self.pacific_active),
                //    ("Asian", self.asian_active),
                //    ("MELAA", self.melaa_active),
                //    ("European or Other", self.european_active),
                //    ("Unknown", self.unknown_active)
                //]),
                //             title: "Active Cases by Ethnicity: ", form: CGSize(width: UIScreen.main.bounds.width, height: 350)
               // )
                        
                LineView(data: self.comm_chart, title: "Community Cases: ")
                LineView(data: self.border_chart, title: "Border Cases: ")
                    .padding(.top, 400)
                Text("")
                    .padding(.top, 450)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                LineView(data: self.tests_chart, title: "Daily Test Count: ")
                    .padding(.top, 330)
                ZStack {
                    PieChartView(data: [self.at_home, self.miq], title: "Location of Active Cases: ", form: CGSize(width: UIScreen.main.bounds.width, height: 250))
                        .padding(.top, 425)
                    Rectangle()
                        .fill(Color("Violet"))
                        .frame(width:20, height: 20)
                        .padding(.trailing, 300)
                        .padding(.top, 380)
                    Text("MIQ")
                        .font(.system(size: 18))
                        .padding(.trailing, 230)
                        .padding(.top, 380)
                    
                    Rectangle()
                        .fill(Color("Magenta"))
                        .frame(width:20, height: 20)
                        .padding(.trailing, 300)
                        .padding(.top, 490)
                    Text("    At \n Home")
                        .font(.system(size: 15))
                        .padding(.trailing, 228)
                        .padding(.top, 490)
                }
                Text("")
                    .padding(.bottom, 50)

            }
            .padding(.leading, 7.5)
                        
        }
    }
}


struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
