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
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""

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
                processRegistration()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("确定")))
            }
        }
    }

    private func processRegistration() {
        DispatchQueue.main.async {
            if inputUsername.isEmpty || inputPassword.isEmpty || inputDescription.isEmpty {
                setupAlert(title: "注册信息不完整", message: "所有字段均为必填项")
                return
            }

            if DataTable[inputUsername] != nil {
                setupAlert(title: "用户名已存在", message: "请更换用户名")
                return
            }

            // 注册成功的逻辑
            userData.username = inputUsername
            userData.password = inputPassword
            userData.description = inputDescription
            userData.isLogged = true
            userData.showAlert = false
            DataTable[inputUsername] = User(isLogged: true, showAlert: false, username: inputUsername, password: inputPassword, description: inputDescription)
            User.saveUsers(users: DataTable.values.map{$0})
        }
    }

    private func setupAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}
