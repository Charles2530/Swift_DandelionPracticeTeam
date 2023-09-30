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
    @State private var rightPassword: String? = nil
    @State private var Isright: Bool = false

    var body: some View {
        VStack {
            TextField("用户名", text: $inputUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("密码", text: $inputPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("登录") {
                Isright = false
                if inputPassword == ""{
                    userData.showAlert = true
                    return
                }
                if let rightPassword = DataTable[inputUsername]?.password{
                    self.rightPassword = rightPassword
                    if rightPassword == inputPassword{
                        userData.username = inputUsername
                        userData.password = inputPassword
                        userData.isLogged = true
                        userData.showAlert = false
                    }
                    else{
                        userData.showAlert = true
                    }
                }else {
                    Isright = true
                    userData.showAlert = true
                }
            }
            .padding()
            .alert(isPresented: $userData.showAlert) {
                if inputUsername == ""{
                    Alert(title: Text("用户名为空"),
                                 message: Text("用户名不能为空"),
                                 dismissButton: .default(Text("确定")))
                }else if inputPassword == ""{
                    Alert(title: Text("密码为空"),
                                 message: Text("请输入密码"),
                                 dismissButton: .default(Text("确定")))
                }else if Isright{
                    Alert(title: Text("用户名不存在"),
                                 message: Text("请检查用户名"),
                                 dismissButton: .default(Text("确定")))
                    
                }else{
                    Alert(title: Text("密码错误"),
                                 message: Text("请检查密码"),
                                 dismissButton: .default(Text("确定")))
                }
            }
            NavigationLink("没有账号？注册", destination: RegisterView())
        }
    }
}

