//
//  TabsView.swift
//  bookmarker-ios
//
//  Created by Kenneth Ng on 9/11/20.
//

import SwiftUI

enum Tabs: Hashable {
    case home
    case folders
    case newFile
}

struct TabsView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView(selection: self.$appState.selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: Constants.Icon.home)
                }
                .tag(Tabs.home)
            NewFolderFileView()
                .tabItem {
                    Image(systemName: Constants.Icon.addFile)
                }
                .tag(Tabs.newFile)
            CurrentUserFoldersView()
                .tabItem {
                    Image(systemName: Constants.Icon.folders)
                }
                .tag(Tabs.folders)
        }
        .onAppear {
            self.appState.listenCurrentUserFolders()
        }
        .onDisappear {
            self.appState.unlistenCurrentUserFolders()
        }
        .onOpenURL { (url) in
            self.appState.selectedTab = .home
        }
    }
}

//struct TabsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabsView()
//    }
//}
