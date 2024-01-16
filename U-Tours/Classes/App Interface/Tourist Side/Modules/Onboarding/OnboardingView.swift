//
//  OnboardingView.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 16/01/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        OnboardingContent()
    }
}

struct OnboardingContent: View {
    @State var step: Int = 1
    @State var selectedView: Int = 1
    @State var progressTitle: String = "0"
    let goal: Int = 3
    @StateObject var onboardingViewModel = OnboardingViewModel()
    let activeColor = Color(red: 30/255, green: 162/255, blue: 207/255)
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Text("U-TOURS")
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(activeColor)
                    Spacer()
                    Button {
                        // insert action here
                    } label: {
                        Text("Skip")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                    }
                }
                
                // Progress View here
                CustomProgressBar(step: $step, progressTitle: $progressTitle)
                    .padding(.vertical)
                
                // Onboarding View here
                ShowOnboardingView(selectedView: $selectedView, onboardingModel: onboardingViewModel.onboardingModel)
                
                // Next Button here
                Button {
                    increaseStep()
                } label: {
                    Text(selectedView < 3 ? "Next": "Start Touring !")
                        .font(.system(size: 19))
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(activeColor)
                }
                .cornerRadius(10)
                Spacer()
            }
            .zIndex(1.0)
            .frame(width: Size.shared.screenWidth() * 0.80)
            Image("ic_world_map_1")
                .offset(y: Size.shared.screenHeight() * 0.32)
        }
    }
    func increaseStep() {
        guard step < goal else { return }

        withAnimation(.linear(duration: 0.5)) {
            step += 1
        }
        progressTitle = "\(step) / \(goal)"
        
        guard selectedView < 4 else { return }
        selectedView += 1
    }
}

struct OnboardingWindow: View {
    var onboardingModel: OnboardingModel?
    var body: some View {
        VStack {
            Image(onboardingModel?.image ?? "")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height * 0.20)
                       
            Text(onboardingModel?.title ?? "!")
                .bold()
                .font(.system(size: 20))
                .padding(.vertical, 5)
            
            Text(onboardingModel?.subtitle ?? "!")
                .font(.system(size: 17))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            //Spacer()
        }
    }
}

struct ShowOnboardingView: View {
    @Binding var selectedView: Int
    let maxNumberOfScreens = 2
    var onboardingModel: OnboardingModel?
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedView) {
                OnboardingWindow(onboardingModel: OnboardingModel(image: "ic_onboarding_1", title: "Enable Location", subtitle: "Enable your location for optimal user experience. We are privacy conscious and will not share or sell your data")).tag(1)
                OnboardingWindow(onboardingModel: OnboardingModel(image: "ic_onboarding_2", title: "Video Tours", subtitle: "Welcome to the new paradigm of travel. Where your tour guides are in your pocket")).tag(2)
                OnboardingWindow(onboardingModel: OnboardingModel(image: "ic_onboarding_3", title: "Get Started", subtitle: "Start exploring and discovering new places around the world")).tag(3)
            }
            .tabViewStyle(.page)
            .frame(height: Size.shared.screenHeight() * 0.45)
        }

    }
}


// VIEWMODEL
final class OnboardingViewModel: ObservableObject {
    @Published var onboardingModel: OnboardingModel?
    var onboardingData: [OnboardingModel] = [
        OnboardingModel(image: "ic_onboarding_1", title: "Enable Location", subtitle: "Enable your location for optimal user experience. We are privacy conscious and will not share or sell your data"),
        OnboardingModel(image: "ic_onboarding_2", title: "Video Tours", subtitle: "Welcome to the new paradigm of travel. Where your tour guides are in your pocket"),
        OnboardingModel(image: "ic_onboarding_3", title: "Get Started", subtitle: "Start exploring and discovering new places around the world")
    ]
}


// MODEL
class OnboardingModel: Identifiable {
    let image, title, subtitle: String?
    init(image: String?, title: String?, subtitle: String?) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
}

// MARK: Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContent()
//        OnboardingWindow(onboardingViewModel: OnboardingViewModel())
    }
}
