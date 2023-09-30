//
//  LoginView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userData: UserData
    @State private var inputUsername: String = ""
    @State private var inputPassword: String = ""

    var body: some View {
        VStack {
            TextField("用户名", text: $inputUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("密码", text: $inputPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("登录") {
                // 在真实的应用中，您需要验证这些凭据
                userData.username = inputUsername
                userData.password = inputPassword
                userData.isLogged = true
            }
            .padding()
            NavigationLink("没有账号？注册", destination: RegisterView())
        }
    }
}

