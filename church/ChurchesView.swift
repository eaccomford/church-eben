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
    var body: some View {
        NavigationView{
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
                    
                .navigationTitle("Churches")
                .navigationBarItems(trailing:
                                        Button(action: {
                                            print("sup ge")
                                        }){
                                            HStack{
                                                Text("Add")
                                                Image(systemName: "plus.rectangle.fill").imageScale(.large)
                                            }
                                        }
                )
                
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
