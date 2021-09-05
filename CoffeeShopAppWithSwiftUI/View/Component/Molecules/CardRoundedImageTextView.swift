//
//  CardRoundedImageTextView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import SwiftUI

struct CardRoundedImageTextView: View {
    var body: some View {
        VStack(alignment: .center,spacing:10){
            VStack{
                Image("1")
                    .resizable()
                    .scaledToFill()
            }
            .frame(minWidth: 100, maxWidth: .infinity ,minHeight:90, maxHeight: 100)
            .background(Color.red)
                    
            HStack(){
                VStack(alignment: .leading, spacing: 10){
                Text("Double Shoot Espresso Special With Palm Sugar")
//                    .font(Font.system(size: 14, weight: .bold, design: .default))
                    .font(.custom("CircularStd-Book", size: 14))
                    .lineLimit(4)
                Text("Rp 20.000")
//                    .font(Font.system(size: 14, weight: .bold, design: .default))
                    .font(.custom("CircularStd-Medium", size: 14))
                }
                .layoutPriority(100)
                Spacer()
            }.padding()
        }
        .cornerRadius(10, antialiased: true)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(lineWidth: 1, antialiased: true)
                .foregroundColor(.borderColorSchemeApp)
        )
    }
}

struct CardRoundedImageTextView_Previews: PreviewProvider {
    static var previews: some View {
        CardRoundedImageTextView()
    }
}