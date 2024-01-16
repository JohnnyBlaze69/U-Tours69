//
//  ProfileView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 15/01/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ProfileContent()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}

struct ProfileContent: View {
    @StateObject var touristProfileViewModel = TouristProfileViewModel()
    var body: some View {
        VStack{
            ProfileHeader(touristProfileViewModel: touristProfileViewModel)
            ProfileGuideContent(touristProfileViewModel: touristProfileViewModel)
            ProfileSettingsOptions(touristProfileViewModel: touristProfileViewModel)
            ProfileFooter(touristProfileViewModel: touristProfileViewModel)
        }
    }
}

struct ProfileHeader: View {
    @ObservedObject var touristProfileViewModel: TouristProfileViewModel
    var body: some View {
        Text("Profile")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
        HStack(spacing: 20){
            Image("guide5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.black, lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 0) {
                Text("\(touristProfileViewModel.touristProfileData[0].name ?? "!")")
                    .bold()
                    .font(.system(size: 17))
                Text("\(touristProfileViewModel.touristProfileData[0].designation ?? "!")")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical)
        .frame(width: Size.shared.screenWidth() * 0.80)
        
        Divider()
    }
}

struct ProfileGuideContent: View {
    @ObservedObject var touristProfileViewModel: TouristProfileViewModel
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 0){
                VStack(alignment: .leading, spacing: 0){
                    Text("\(touristProfileViewModel.touristProfileData[0].guide?.title ?? "!")")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    Text("\(touristProfileViewModel.touristProfileData[0].guide?.subTitle ?? "!")")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }
                Image("\(touristProfileViewModel.touristProfileData[0].guide?.image ?? "!")")
                    .resizable()
                    .frame(width: Size.shared.screenWidth() * 0.25, height: Size.shared.screenHeight() * 0.07)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.5), radius: 20, x: -5, y: 7)
            )
        }
        .padding(.vertical)
        .frame(width: Size.shared.screenWidth() * 0.80)
    }
}

struct ProfileSettingsOptions: View {
    init(touristProfileViewModel: TouristProfileViewModel) {
        UIScrollView.appearance().bounces = false
        self.touristProfileViewModel = touristProfileViewModel
    }
    @ObservedObject var touristProfileViewModel: TouristProfileViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(touristProfileViewModel.touristProfileData[0].settings ?? []) { setting in
                NavigationLink(destination: goTo(setting.option ?? "")) {
                        HStack{
                        Image(setting.icon ?? "")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text(setting.option ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .regular))
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 7, height: 7)
                    }
                    .padding(.vertical)
                    .frame(width: Size.shared.screenWidth() * 0.80)
                    
            }

                Divider()
            }
        }
    }
    
    @ViewBuilder
    private func goTo(_ moduleName: String) -> some View {
        switch moduleName {
        case "Personal Information", "Receipts", "Reset Password", "Language", "Privacy and sharing", "Contact", "Refer a friend", "Privacy Policy", "Terms of Service", "Delete Account":
            EmptyView()
        default:
            EmptyView()
        }
    }
}

struct ProfileFooter: View {
    @ObservedObject var touristProfileViewModel: TouristProfileViewModel
    let activeColor = Color(red: 30/255, green: 162/255, blue: 207/255)
    var body: some View {
        VStack(spacing: 0) {
            Group{
                Button {
                } label: {
                    Text("Log Out")
                        .foregroundColor(activeColor)
                        .font(.system(size: 20))
                }
                .buttonStyle(.borderless)
                Spacer()
                Text("Version \(touristProfileViewModel.touristProfileData[0].appVersion ?? "!")")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical)
        .frame(width: Size.shared.screenWidth() * 0.80, height: Size.shared.screenHeight() * 0.10)
    }
}

// VIEWMODEL
final class TouristProfileViewModel: ObservableObject {
    @Published var touristProfileModel: TouristProfileModel?
    
    var touristProfileData: [TouristProfileModel] = [
        TouristProfileModel(
            name: "Alexander Gates",
            designation: "Tourist",
            guide: TourGuide(
                title: "Become A Tour Guide",
                subTitle: "Download our tour guide app to become a tour guide and start earning.",
                image: "ic_guide_ad_img"
            ),
            settings: [
                Settings(icon: "ic_personal_information", option: "Personal Information"),
                Settings(icon: "ic_receipts", option: "Receipts"),
                Settings(icon: "ic_reset_password", option: "Reset Password"),
                Settings(icon: "ic_language", option: "Language"),
                Settings(icon: "ic_privacy_sharing", option: "Privacy And Sharing"),
                Settings(icon: "ic_contact", option: "Contact"),
                Settings(icon: "ic_refer_friend", option: "Refer a friend"),
                Settings(icon: "ic_privacy_policy", option: "Privacy Policy"),
                Settings(icon: "ic_terms_service", option: "Terms of Service"),
                Settings(icon: "ic_delete_account", option: "Delete Account")
            ],
            appVersion: "1.1"
        )
    ]
}

// MODELS
class TouristProfileModel {
    let name, designation, appVersion: String?
    let guide: TourGuide?
    let settings: [Settings]?
    init(name: String?=nil, designation: String?=nil, guide: TourGuide?=nil, settings: [Settings]?=nil, appVersion: String?=nil) {
        self.name = name
        self.designation = designation
        self.guide = guide
        self.settings = settings
        self.appVersion = appVersion
    }
}

class TourGuide {
    let id = UUID()
    let title, subTitle, image: String?
    init(title: String?=nil, subTitle: String?=nil, image: String?=nil) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
}

class Settings: NSObject, Identifiable {
    let icon, option: String?
    init(icon: String? = nil, option: String? = nil) {
        self.icon = icon
        self.option = option
    }
}
