//
//  MenuView.swift
//  MacOS-Popover-MenuBara
//
//  Created by GOURAVM on 24/08/22.
//

import SwiftUI

struct MenuView: View {
    
    @Namespace var animation
    @State var currentTab = "Uploads"
    var body: some View {
        VStack {
            HStack {
                TabButton(title: "help", currentTab: $currentTab, animation: animation)
                TabButton(title: "Uploads", currentTab: $currentTab, animation: animation)
            }
            .padding(.horizontal)
            .padding(.top)
            
            Divider()
                .padding(.top,4)
            
            Image("box")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(30)
            
            HStack{
                Text("Export your artboards....")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    
                
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.primary)
                }

            }
            
            Spacer(minLength: 15)
            
            Divider()
                .padding(.bottom,4)
            
            HStack{
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25, alignment: .center)
                    .clipShape(Circle())
                
                Text("IJustine")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                }
                .buttonStyle(PlainButtonStyle())

            }
            .padding(.horizontal)
            .padding(.bottom)
                
        }
        .frame(width: 250, height: 300)
    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct TabButton: View {
    var title:String
    @Binding var currentTab: String
    var animation:Namespace.ID
    var body: some View {
        Button {
            withAnimation {
                currentTab = title
            }
            
        } label: {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ? .white : .primary)
                .padding(.vertical,4)
                .frame(maxWidth:.infinity)
                .background {
                    ZStack {
                        if currentTab == title {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }else{
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.primary,lineWidth: 0.6)
                        }
                    }
                }
                .contentShape(RoundedRectangle(cornerRadius: 4))
        }.buttonStyle(PlainButtonStyle())
    }
}
