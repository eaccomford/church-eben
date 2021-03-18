//
//  CellsView.swift
//  church
//
//  Created by PK on 05/02/2021.
//

import SwiftUI

struct CellsView: View {
    var title: String
    var body: some View {
        Text("Cell, \(title)")
    }
}

struct CellsView_Previews: PreviewProvider {
    static var previews: some View {
        CellsView(title: "")
    }
}
