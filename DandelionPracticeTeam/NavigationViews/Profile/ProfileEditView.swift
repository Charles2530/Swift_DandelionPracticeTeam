//
//  ProfileEditView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI

struct ProfileEditView: View {
    @EnvironmentObject var userData: UserData

    @State private var editingUsername: String
    @State private var editingPassword: String
    @State private var editingDescription: String

    
    init(userData: UserData) {
        _editingUsername = State(initialValue: userData.username)
        _editingPassword = State(initialValue: userData.password)
        _editingDescription = State(initialValue: userData.description)
    }
    
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
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("密码", text: $editingPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("个人描述", text: $editingDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("保存更改") {
                userData.username = editingUsername
                userData.password = editingPassword
                userData.description = editingDescription
                DataTable[userData.username] = User(isLogged: true, showAlert: false, username: userData.username, password: userData.password, description: userData.description, avatar: userData.avatar)
                User.saveUsers(users: DataTable.values.map{$0})
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

#if DEBUG
struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView(userData: UserData())
    }
}
#endif

