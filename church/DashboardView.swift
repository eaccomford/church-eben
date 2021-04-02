//
//  DashboardView.swift
//  church
//
//  Created by PK on 11/02/2021.
//
import SwiftUICharts
import SwiftUI





class Store: ObservableObject {
    @Published var showtab: Int = 1
}

struct DashboardView: View {
    @ObservedObject private var  store = Store()
    @State private var selection = 0
    var body: some View {
        ZStack{
            Color(.red).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                TabView(selection: $selection){
                    DashBoard()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }.tag(0)
                    ChurchesView()
                        .tabItem {
                            Image(systemName: "building.fill")
                            Text("Churches")
                        }.tag(1)
                    ReportsView()
                        .tabItem {
                            Image(systemName: "book.fill")
                            Text("Reports")
                        }.tag(2)
                    InsightsView()
                        .tabItem {
                            Image(systemName: "chart.bar.fill")
                            Text("Insights")
                        }.tag(3)
                }
                // .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        }
        
    
}

struct DashboardView_Previews: PreviewProvider {
    
    static var previews: some View {
        DashboardView()
    }
}




struct DashBoard: View {
    
    @ObservedObject var  store = Store()
    @EnvironmentObject var store1: Store
    
    @State var logout: Bool = false
    
    @State var showTheTab: Bool = false
    
    @State var pckerSelected = 0
    @State var dataPoints: [[CGFloat]] = [
        [20, 90, 120,30,23],
        [50, 40, 170,200,39],
        [30,5,23,90,190],
        [100, 140, 175,180,33],
        [130,115,150,98,23]
    ]
    
    // char data
    let chartStyle = ChartStyle(backgroundColor: Color.black, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd,  textColor: .white, legendTextColor: .red, dropShadowColor: .blue )
    
    var body: some View {
       
        if logout == true {
            LoginView()
        }
        NavigationView{
            ScrollView(.vertical) {
                VStack(alignment:.leading){
                    
                    VStack(spacing: 20){
                        Text("Welcom, Sister")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(#colorLiteral(red: 0.006383855361, green: 0.2206691504, blue: 0.5955706239, alpha: 1)))
                        Text("Admin, July 2, 2021")
                            .padding()
                    }
                    VStack(spacing: 30){
                        HStack(spacing: 30){
                            CardView(qty: 490, image: "house.fill", title: "Churches")
                            CardView(qty: 800, image: "house.fill", title: "Cells")
                        }
                        HStack(spacing: 30){
                            CardView(qty: 200, image: "house.fill", title: "Cell Report")
                            CardView(qty: 76, image: "house.fill", title: "Church Report")
                        }
                    }
                    .padding()
                    
                    // picker
                    VStack(spacing: 30){
                        Text("Cell first timers VS Church first timers")
                            .padding(.top,44)
                            .font(.title3)
                        
                        HStack{
                            ScrollView(.horizontal){
                                HStack(spacing: 16){
                                    VStack{
                                        HStack{
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][2], color: .blue)
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][1],  color: .red)
                                        }
                                        HStack{
                                            Text("Jan")
                                        }
                                    }
                                    .padding(.trailing,10)
                                    VStack{
                                        HStack{
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][1], color: .blue)
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][3], color: .red)
                                        }
                                        HStack{
                                            Text("FeB")
                                        }
                                    }
                                    .padding(.trailing,10)
                                    VStack{
                                        HStack{
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][3], color: .blue)
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][1],  color: .red)
                                        }
                                        HStack{
                                            Text("Mar")
                                        }
                                    }
                                    .padding(.trailing,10)
                                    VStack{
                                        HStack{
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][4], color: .blue)
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][1],  color: .red)
                                        }
                                        HStack{
                                            Text("Apr")
                                        }
                                    }
                                    .padding(.trailing,10)
                                    VStack{
                                        HStack{
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][2], color: .blue)
                                            Barcharts(cvalue: "", height: dataPoints[pckerSelected][1],  color: .red)
                                        }
                                        HStack{
                                            Text("May")
                                        }
                                    }
                                    
                                } .padding(.top, 10)
                                .animation(.default)
                                
                            }
                           
                        }
//                        Picker(selection: $pckerSelected, label: Text("")){
//                            Text("WeekDay").tag(0)
//                            Text("Afteroon").tag(1)
//                            Text("Evening").tag(2)
//                        }.pickerStyle(SegmentedPickerStyle())
//                        .padding(.horizontal,24)
                        
                    }
                    
                    // chart view
//                    ZStack{
//
//                        VStack(spacing: 40){
//                            Spacer()
//                            Text("Chart View Grapths")
//                                .padding(.top,44)
//                                .font(.title3)
//                            Spacer()
//                            // line chart
//                            VStack{
//                                LineView(data: [12,43,10,78,89], title: "Line Chart")
//                            }
//                            .padding(.bottom, 300)
//                            Spacer()
//                            // bar char
//                            VStack{
//
//                                HStack{
//                                    ScrollView(.horizontal) {
//                                    BarChartView(data: ChartData(values: [
//                                        ("Jan", 14),
//                                        ("Feb", 90),
//                                        ("Mar", 30),
//                                        ("Apr", 43),
//                                        ("Jan", 14),
//                                        ("Feb", 90),
//                                        ("Mar", 30),
//                                        ("Apr", 43),
//                                    ]),
//                                    title: "Bar Chart", legend: "Quarterly",style: chartStyle,form: ChartForm.large)
//                                }
//                                }
//                            }
//                            Spacer()
//                            // pie char
//                            PieChartView(data: [89,39,76,34,100,76], title: "Pie Chart")
//                            Spacer()
//                        }
//
//                    }.padding(.horizontal,20)
                    
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding()
                
                
                
                .navigationBarItems(trailing:
                                        Button(action: {
                                            logout = true
                                        }){
                                            HStack{
                                                Text("Logout")
                                                Image(systemName: "lock.rectangle.fill").imageScale(.large)
                                            }
                                        }
                    .padding()
                )
                
                
            }
            
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            //.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct Barcharts: View {
    var cvalue: String
    var height: CGFloat
    var color: Color
    var body: some View{
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Capsule().frame(width: 30, height: height)
                    .foregroundColor(color)
            }
            Text(cvalue)
        }
    }
}


struct CardView: View {
    var qty: Int
    var image: String
    var title: String
    var body: some View{
        VStack(spacing: 20){
            Text("\(qty)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack{
                Image(systemName: image).imageScale(.large)
                Text(title)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(20)
        .shadow(color: Color(UIColor.lightGray), radius: 5, x: 1, y: 1)
        .foregroundColor(.black)
    }
}

