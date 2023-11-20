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
                if inputUsername == "" || inputPassword == "" || inputDescription == ""{
                    userData.showAlert = true
                    return
                }
                if DataTable[inputUsername] != nil{
                    userData.showAlert = true
                    return
                }
                userData.username = inputUsername
                userData.password = inputPassword
                userData.description = inputDescription
                userData.isLogged = true
                userData.showAlert = false
                DataTable[inputUsername] = User(isLogged: true, showAlert: false, username: inputUsername, password: inputPassword, description: inputDescription)
                User.saveUsers(users: DataTable.values.map{$0})
            }
            .alert(isPresented: $userData.showAlert) {
                if inputUsername == "" || inputPassword == "" || inputDescription == ""{
                    Alert(title: Text("密码为空"),
                                 message: Text("注册信息不能为空"),
                                 dismissButton: .default(Text("确定")))
                } else if DataTable[inputUsername] != nil {
                    Alert(title: Text("用户名已存在"),
                                 message: Text("请更换用户名"),
                                 dismissButton: .default(Text("确定")))
                }else {
                    Alert(title: Text("系统异常"),
                                 message: Text("请稍后再试"),
                                 dismissButton: .default(Text("确定")))
                }
            }
            .padding()
        }
    }
}

#if DEBUG
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
#endif

