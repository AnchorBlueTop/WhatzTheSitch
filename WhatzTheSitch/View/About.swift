//
//  About.swift
//  WhatzTheSitch
//
//  Created by Harshil Patel on 12/02/22.
//

import SwiftUI

struct About: View {
    var body: some View {
        VStack{
            Text("About")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            Spacer()
            VStack{
                Image("Final No Background PNG")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                Text("© 2022 WhatzTheSitch. | v1.0 \n        All Rights Reserved")
                Text("\n")
                Text("Source: [Ministry of Health](https://www.health.govt.nz/covid-19-novel-coronavirus/covid-19-data-and-statistics/covid-19-current-cases)")
                Text("\n")
                Text("\n")
                Text("Developed By: Harshil Patel")
            }
            Spacer()
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
