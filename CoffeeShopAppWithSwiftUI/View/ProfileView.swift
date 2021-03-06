//
//  ProfileView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI
import SwiftUIRouter


struct ProfileView: View {
    
    @StateObject var state: State
    var textSize16: CGFloat = 16
    
    var body: some View {
            VStack(spacing: 0){
                NavigationBar(navTitle:"Profile", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenBorderBottom: false)
                
                VStack(spacing:0){
                    ScrollView(showsIndicators: false){
                        Spacer(minLength: 40)

                        VStack(spacing: 60) {
                            NavLink(to: "/profile/account_details") {
                                VStack {
                                   ImageTextSubtext(title: "San Engineer", subtitle: "Profile, edit and more")
                                }
                            }
                            .foregroundColor(.foregroundColorSchemeApp)
                           
                            
                            VStack(spacing: 20){
                                ForEach(0..<(self.state.profileCollection.count)){ item in
                                    let collection = state.profileCollection[item]
                                    
                                    HNavLinkWithEmojiText(emoji: collection.icon, title: collection.title, caption: (collection.subtitle ?? ""), pathName: state.profileCollection[item].path, textSize:16, action: {})
                                    
                                    if(item == state.profileCollection.distance(from: state.profileCollection.startIndex, to: state.profileCollection.endIndex - 3)) {
                                        Spacer(minLength: 40)
                                    }
                                }
                                
                                
                            }
                            
                            
                            
                            VStack(){
                                Button(action: {
                                    print("Button Logout")
                                }, label: {
                                    Text("Logout")
                                        .font(.custom("CircularStd-Bold", size: textSize16))
                                        .foregroundColor(.red)
                                })
                            }
                        }
                        .padding(.bottom, 100)
                    }
                }

            }
            .background(Color.backgroundColorSchemeApp)
            .ignoresSafeArea(.all)
    }
    
    func toggleNavigate(){
        state.nextView = !state.nextView
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(state: State())
    }
}
