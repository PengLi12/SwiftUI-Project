//
//  ProfileHost.swift
//  SwiftUITestProject
//
//  Created by mac mini 2 on 2020/10/16.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            }else {
//                Text("Profile Editor")
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear{
                        self.userData.profile = self.draftProfile
                    }
            }
            
//            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(UserData())
    }
}
