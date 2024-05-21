//
//  LinkView.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import SwiftUI
import Charts


struct LinksView: View {

    @StateObject var viewModel = LinksViewModel()
    @State var selectedTab:Int = 0
    
    var chartData: [ChartData] {
        var data: [ChartData] = []
        for (hour, value) in viewModel.chartData {
            let chartDataItem = ChartData(hour: hour, value: value)
            data.append(chartDataItem)
        }
        return data
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Dashboard")
                    .font(.title).bold()
                    .foregroundColor(.white)
                Spacer()
                Button(action:{}){
                    RoundedRectangle(cornerRadius:10)
                        .fill(Color.white)
                        .opacity(0.1)
                        .frame(width:50,height:50)
                        .overlay{
                            Image("wrench")
                        }
                }
                .background(.blue)
            
            }
            .padding(.bottom,50)
            .padding([.top,.horizontal],20)
            
            .background(.blue)
            
            
            ScrollView(.vertical){
                VStack(alignment:.leading){
                    Analytics
                    Links
                    SocialButtons
                }
                .padding(.vertical,40)
                .background(.lightBackground)
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .offset(y:-35)
            .scrollIndicators(.hidden)
            .frame(maxWidth: .infinity,maxHeight:.infinity)
            
        }
        .onAppear{
            viewModel.getRecentLinks()
        }
        
    }
     
    
    
    
    func greetingMessage() -> String{
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        if hour >= 6 && hour < 12 {
                    return "Good Morning"
                } else if hour >= 12 && hour < 18 {
                    return "Good Afternoon"
                } else {
                    return "Good Evening"
                }
    }
    
    private var Analytics: some View{
        VStack(alignment:.leading, spacing:4){
            VStack(alignment:.leading){
                Text(greetingMessage())
                    .foregroundColor(.gray)
                Text("Ajay Manva👋")
                    .font(.system(size: 30,weight: .semibold,design: .default))
                    .padding(.bottom,20)
            }
            
            
            
           ChartView
            
            ScrollView(.horizontal){
                HStack{
                    AnalyticsCell(icon: "pointer", title: "123", label: "Today's clicks", color: .lightPurple)
                    AnalyticsCell(icon: "pin", title: "Ahmedabad", label: "Top Location", color: .lightBlue)
                    AnalyticsCell(icon: "globe", title: "Instagram", label: "Top Source", color: .lightRed)
                }
            }
            .scrollIndicators(.hidden)
            LongIconButton(icon: "price-boost", label: "View Analytics")
            
        }
        .padding()
        
    }
    
    
    
    
    
    private var Links: some View{
        
        VStack{
            HStack{
                ToggleButton(tag:0,title:"Top links",selectedTab: $selectedTab)
                Spacer()
                ToggleButton(tag:1,title:"Recent links",selectedTab: $selectedTab)
                
                Spacer()
                IconButton(icon: "search")
                
            }
            
            ForEach(selectedTab == 0 ? viewModel.topLinks.prefix(5): viewModel.recentLinks.prefix(5)){ link in
                LinkCell(data: link)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .opacity(0.2)
                            
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.vertical,5)
            }
            
            LongIconButton(icon: "link", label: "View all links")
        }
        .padding()
    }
    
    
    private var SocialButtons: some View{
        VStack(spacing: 16){
            ColorIconButton(bgColor: .lightGreen, borderColor: .green, icon: "Whatsapp", label: "Talk with us")
            ColorIconButton(bgColor: .lightBlue, borderColor: .blue, icon: "question-mark", label: "Frequently asked questions")
        }
    }
    
    
    private var ChartView: some View{
        VStack {
            HStack{
                Text("Overview")
                    .font(.title2)
                    .foregroundStyle(.gray)
                Spacer()
                HStack{
                    Text("1 PM - 5PM")
                    Image("clock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:20,height:20)
                }
                    .padding(10)
                    .overlay{
                        RoundedRectangle(cornerRadius:10)
                            .stroke(Color.gray.opacity(0.4))
                    }
            }
            .padding([.horizontal,.top],25)
            Chart{
                ForEach(chartData.prefix(5)){ data in
                    LineMark(x: .value("Hours",data.hour), y: .value("Total Count",data.value))
                        .foregroundStyle(.blue)
                        .shadow(color: Color.blue.opacity(1), radius: 25, x: 0, y: 15)
                }
                
            }
            .padding()
            .frame(height:100)
            
            
            
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    

    
}



#Preview {
    LinksView()
}


