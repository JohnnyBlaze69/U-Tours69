//
//  DestinationListView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 09/01/24.
//

import SwiftUI

struct DestinationListView: View {
    @StateObject var destinationListViewModel = DestinationListViewModel()
    let borderColor = Color(red: 239/255, green: 239/255, blue: 239/255)
    let bodyColor = Color(red: 239/255, green: 239/255, blue: 239/255)
    var body: some View {
        VStack {
            ScrollView{
                ForEach(destinationListViewModel.destinationListArray) { destination in
                    DestListSubView(model: destination)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    print("Debug: Back Button tap")
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Destinations")
                    .bold()
                    .font(.system(size: 20))
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("Debug: Search Button tap")
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.blue)
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}

struct DestListSubView: View {
    var model: DestinationListModel?
    let borderColor = Color(red: 239/255, green: 239/255, blue: 239/255)
    let bodyColor = Color(red: 239/255, green: 239/255, blue: 239/255)
    var body: some View {
        Button {
            print("Debug: \(model?.location ?? "N/A") tap")
        } label: {
            HStack{
                VStack {
                    Text(model?.location ?? "N/A")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20))
                        .bold()
                    Text(model?.subLocation ?? "N/A")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .font(.system(size: 15))
                        .padding(.top, 2)
                }
                Image(systemName: "chevron.forward")
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
            }
            .padding(10)
            .foregroundColor(.black)
            .frame(width: Size.shared.screenWidth() * 0.90, height: Size.shared.screenHeight() * 0.10)
            .background(bodyColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(borderColor, lineWidth: 2)
            )
            
        }
    }
}

struct DestinationListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DestinationListView()
        }
    }
}


class DestinationListModel: NSObject, Identifiable {
    let location, subLocation: String?
    init(location: String?, subLocation: String?) {
        self.location = location
        self.subLocation = subLocation
    }
}


final class DestinationListViewModel: ObservableObject {
    @Published var destinationListModel: DestinationListModel?
    
    var destinationListArray: [DestinationListModel] = [
        DestinationListModel(location: "Armenia", subLocation: "Yerevan, Gyumi, Goris, Vagharshpat, Dilijan, Jermuk"),
        DestinationListModel(location: "Bulgaria", subLocation: "Sofia, Burgas, Plovdiv, Varna, Dobrich, Ruse, Lovech"),
        DestinationListModel(location: "China", subLocation: "Beijing, Shanghai, Tiajin, Hangzhou, Wuhan, Harbin"),
        DestinationListModel(location: "Denmark", subLocation: "Aarhus, Copenhagen, Odense, Aalbord, Vejle, Horses"),
        DestinationListModel(location: "Finland", subLocation: "Turku, Oulu, Tampere, Espoo, Lahti, Vaasa, Helsinki"),
        DestinationListModel(location: "Germany", subLocation: "Berlin, Munich, Hamburg, Frankfurt, Cologne, Dresen"),
        DestinationListModel(location: "Hungary", subLocation: "Budapest, Pecs, Debrecen, Szeged, Eger, Sopron, Gyor"),
        DestinationListModel(location: "Italy", subLocation: "Rome, Venice, Florence, Milan, Bologna, Turin, Genoa")
    ]
}
