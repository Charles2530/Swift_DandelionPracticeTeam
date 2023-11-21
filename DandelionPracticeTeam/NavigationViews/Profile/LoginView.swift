//
//  LoginView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.



import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userData: UserData
    @State private var inputUsername: String = ""
    @State private var inputPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""

    var body: some View {
        VStack {
            TextField("用户名", text: $inputUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("密码", text: $inputPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("登录") {
                processLogin()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("确定")))
            }
            NavigationLink("没有账号？注册", destination: RegisterView())
        }
    }

    private func processLogin() {
        DispatchQueue.main.async {
            if inputUsername.isEmpty {
                setupAlert(title: "用户名为空", message: "用户名不能为空")
                return
            }

            if inputPassword.isEmpty {
                setupAlert(title: "密码为空", message: "请输入密码")
                return
            }

            if let rightPassword = DataTable[inputUsername]?.password, rightPassword == inputPassword {
                    userData.username = inputUsername
                    userData.password = inputPassword
                    userData.isLogged = true
                    userData.showAlert = false
                    userData.avatar = DataTable[inputUsername]?.avatar ?? "person.circle"
                    userData.description = DataTable[inputUsername]?.description ?? "这里是个人描述"
                    userData.favorites = DataTable[inputUsername]?.favorites ?? []
                    userData.likedArticles = DataTable[inputUsername]?.likedArticles ?? []
            } else {
                setupAlert(title: "登录失败", message: "用户名或密码错误")
            }
        }
    }

    private func setupAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}
