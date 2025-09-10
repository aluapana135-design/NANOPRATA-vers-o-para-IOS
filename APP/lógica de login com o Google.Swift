// Quando o botão de "Login com Google" é clicado...

func tentarLoginComGoogle() {
    GIDSignIn.sharedInstance.signIn(with: configuration) { user, error in
        // Essa parte aqui SÓ VAI SER EXECUTADA DEPOIS QUE O GOOGLE TE DEVOLVER ALGO

        if let error = error {
            // Deu algum erro no processo (usuário cancelou, rede ruim, etc.)
            print("Erro no login com Google: \(error.localizedDescription)")
            // Talvez mostrar uma mensagem pro usuário
            return
        }

        guard let googleUser = user else {
            // Não veio nenhum usuário, algo deu errado
            print("Nenhum usuário retornado do Google")
            return
        }

        // Opa! Veio o usuário! Agora a gente usa as informações dele:
        let nome = googleUser.profile?.name ?? "Usuário"
        let email = googleUser.profile?.email ?? "sem_email@google.com"
        let idDoGoogle = googleUser.userID // Um identificador único do Google

        print("Login bem-sucedido! Bem-vindo, \(nome)!")
        print("Seu email é: \(email)")
        print("Seu ID do Google é: \(idDoGoogle ?? "Nenhum ID")")

        // AGORA A LÓGICA DO SEU APP:
        // 1. Verificar se esse 'idDoGoogle' ou 'email' já existe no SEU banco de dados.
        // 2. Se existir, logar o usuário no SEU app.
        // 3. Se não existir, chamar a tela de cadastro ou cadastrar automaticamente.

        // Exemplo:
        verificarOuCadastrarUsuario(idGoogle: idDoGoogle, email: email, nome: nome) { sucesso in
            if sucesso {
                // Navegar para a tela principal do app
                print("Navegando para a tela principal!")
            } else {
                print("Falha ao verificar/cadastrar usuário.")
                // Mostrar um erro pro usuário
            }
        }
    }
}