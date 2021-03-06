//
//  NewFolderFileEditView.swift
//  bookmarker-ios
//
//  Created by Kenneth Ng on 9/14/20.
//

import SwiftUI

struct NewFolderFileEditView: View {
    @ObservedObject var vm: NewFolderFileViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: Constants.Icon.back)
                }
                .buttonStyle(NavigationBarIconButtonStyle())
                
                Spacer()
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
                    Group {
                        if self.vm.metadata != nil {
                            VStack {
                                if let image = self.vm.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxHeight: 120)
                                }
                                HStack {
                                    VStack {
                                        Text(self.vm.title)
                                            .font(.largeTitle)
                                        Text(self.vm.description)
                                    }
                                    Spacer()
                                }
                                .padding()
                            }
                        } else {
                            Text("No metadata found")
                        }
                    }
                }
            }
            
            NavigationLink(destination: NewFolderFileSelectUserFolderView(vm: self.vm)) {
                Text("Next")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding()
        }
        .navigationBarHidden(true)
    }
}

//struct NewFolderFileEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewFolderFileEditView()
//    }
//}
