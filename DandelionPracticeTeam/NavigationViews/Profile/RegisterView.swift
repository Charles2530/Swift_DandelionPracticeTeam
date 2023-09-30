//
//  RegisterView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userData: UserData
    @State private var inputUsername: String = ""
    @State private var inputPassword: String = ""
    @State private var inputDescription: String = ""

    var body: some View {
        VStack {
            TextField("新的用户名", text: $inputUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("设置密码", text: $inputPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("个人描述", text: $inputDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("注册") {
                // 在真实的应用中，您应该保存和验证这些凭据
                userData.username = inputUsername
                userData.password = inputPassword
                userData.description = inputDescription
                userData.isLogged = true
            }
            .padding()
        }
    }
}
