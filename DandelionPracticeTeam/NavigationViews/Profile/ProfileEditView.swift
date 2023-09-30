//
//  ProfileEditView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI

struct ProfileEditView: View {
    @EnvironmentObject var userData: UserData

    @State private var editingUsername: String = ""
    @State private var editingPassword: String = ""
    @State private var editingDescription: String = ""

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: userData.avatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .onTapGesture {
                        // Update the avatar when tapped
                    }

                AvatarSelector(selectedAvatar: $userData.avatar)
            }

            TextField("用户名", text: $editingUsername)
                .onTapGesture {
                    if editingUsername.isEmpty {
                        editingUsername = userData.username
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("密码", text: $editingPassword)
                .onTapGesture {
                    if editingPassword.isEmpty {
                        editingPassword = userData.password
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("个人描述", text: $editingDescription)
                .onTapGesture {
                    if editingDescription.isEmpty {
                        editingDescription = userData.description
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("保存更改") {
                userData.username = editingUsername
                userData.password = editingPassword
                userData.description = editingDescription
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
    }
}

struct AvatarSelector: View {
    @Binding var selectedAvatar: String

    let avatars: [Avatar] = [
        Avatar(id: 0, systemName: "person.crop.circle"),
        Avatar(id: 1, systemName: "person.crop.circle.fill"),
        Avatar(id: 2, systemName: "person.2.circle"),
        Avatar(id: 3, systemName: "person.3.circle")
    ]

    var body: some View {
        Picker("Select Avatar", selection: $selectedAvatar) {
            ForEach(avatars) { avatar in
                Image(systemName: avatar.systemName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .tag(avatar.systemName)
            }
        }
        .labelsHidden()
        .pickerStyle(MenuPickerStyle())
    }
}