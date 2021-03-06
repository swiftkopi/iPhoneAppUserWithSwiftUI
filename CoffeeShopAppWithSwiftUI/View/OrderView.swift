//
//  OrderView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var state: State
    
    var body: some View {
        VStack(spacing:0){
            NavigationBarMultilineView(navTitle:"Shipment",backgroundColor: .backgroundColorSchemeApp,color: .foregroundColorSchemeApp, iconName: "chevron.down", hiddenLeftBarButton: false, hiddenBorderBottom: false, hiddenRightBarButton: false, actionRightButton: {
                state.isExpandNavBar.toggle()
            }, state: state)
            
            ZStack{
                switch state.isExpandNavBar {
                case false :
                    PickupView()
                default :
                    ShipmentView()
                }
                
               
            }
            
            VStack(spacing: 0){
                HStack{
                    VTextSubtextView(text:"Total Billing",textSize: 12, subtext: "Rp 990.000", subtextSize: 16, paddingActive: false, heroFontWeightText: "Book")
                    Spacer()
                    NavLinkView(label: "Select Payment", isFixHeight: false, pathRouter: "/cart/order/pay")
                        .frame(width: 160, height: 50)
                        
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, state.ratio == state.aspectScreen ? 20 : 40)
                
            }
            
            
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(state: State())
    }
}
