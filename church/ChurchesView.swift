//
//  testView.swift
//  church
//
//  Created by PK on 05/02/2021.
//

import SwiftUI

struct ChurchesView: View {
    let members = [
        Members(name: "Emmanuel Lee", phone: "0242242435", church: "Christ Embasy"),
        Members(name: "George Brown", phone: "0393373748", church: "Assemblies"),
        Members(name: "Fred Sam", phone: "937738374", church: "Church of Christ"),
        Members(name: "Kendra Accomford", phone: "83638364884", church: "Church of Christ"),
        Members(name: "Alvin Accomford", phone: "98337464723", church: "Assemblies"),
        Members(name: "Christiana Accomford", phone: "03733728262", church: "Church of Christ")
    ]
    @State var email: String = ""
    @State var pckerSelected = 0
    @State  var showingSheet:Bool = false
    var body: some View {
        
        NavigationView{
            
            VStack{
                HStack(spacing: 10){
                    Picker(selection: $pckerSelected, label: Text("")){
                                               Text("Cell Reports").tag(0)
                                               Text("Church Reports").tag(1)
                                           }.pickerStyle(SegmentedPickerStyle())
                                           .padding(.horizontal,24)
                }
                HStack{
                    TextField("Search for report", text: self.$email )
                                        .padding(7)
                                       .padding(.horizontal, 25)
                                       .background(Color(.systemGray6))
                                       .cornerRadius(8)
                                       .padding(.horizontal, 10)
                }
                
                HStack{
                    List(members){ user in
                        VStack{
                            NavigationLink(destination: CellsView(title:  user.name)) {
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(user.name)
                                        Text(user.church)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                    }
                                    Spacer()
                                    Text(user.phone)
                                }
                            }
                        }
                .navigationBarItems(trailing:
                                        Button(action: {
                                            showingSheet.toggle()
                                        }){
                                            HStack{
                                                Text("Add")
                                                Image(systemName: "plus.rectangle.fill").imageScale(.large)
                                            }
                                        }
                                    .sheet(isPresented: $showingSheet) {
                                        SheetView()
                                    }
                )
                
            
                }
                }
                VStack{
                    Text("Showing of 190 entries")
                }
            }
        }
        
    }
}

struct Members: Identifiable {
    var id = UUID()
    var name: String
    var phone: String
    var church: String
}

struct ChurchesView_Previews: PreviewProvider {
    static var previews: some View {
        ChurchesView()
    }
}


struct SheetView: View {
    @State var password:String = ""
    var body: some View {
        NavigationView{
        ZStack(alignment: .leading){
            VStack{
                VStack{
                    Spacer()
                    HStack{
                        Text("Submit a Cell report")
                            .font(.system(size: 30))
                            .padding(.bottom, 50)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            
                    }
                    HStack{
                        TextField("Meeting Duration", text: self.$password)
                            .padding(.bottom,10)
                    }
                    Divider().background(Color.white.opacity(0.5))
                       
                    HStack{
                        TextField("Attendance", text: self.$password)
                            .padding(.bottom,10)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    HStack{
                        TextField("First Timers", text: self.$password)
                            .padding(.bottom,10)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    HStack{
                        TextField("New Converts", text: self.$password)
                            .padding(.bottom,10)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                Spacer()
            }
        }
        .navigationBarItems(trailing:
                                Button(action: {
                                    print("fjf")
                                }){
                                    HStack(){
                                        HStack{
                                            Text("Back")
                                        }
                                        HStack{
                                            Text("Done")
                                        }
                                    }
                                }
        )
    }
    }
}
