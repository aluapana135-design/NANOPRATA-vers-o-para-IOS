import SwiftUI
struct ContentView: View {
    // @State é pra coisas que mudam dentro da tela e fazem ela atualizar
    @State private var textoPesquisa: String = ""
    @State private var mostrandoPerfil: Bool = false // Pra controlar se a tela de perfil aparece

    var body: some View {
        // NavigationView te dá a barra de cima e permite navegação
        NavigationView {
            // VStack organiza os elementos verticalmente
            VStack {
                // A barra de pesquisa estilizada!
                HStack {
                    Image(systemName: "magnifyingglass") // Ícone de lupa
                        .foregroundColor(.gray)
                    TextField("Pesquisar notícias ou sites...", text: $textoPesquisa)
                        .padding(.vertical, 10) // Espaçamento interno
                        .background(Color(.systemGray6)) // Fundo cinza claro
                        .cornerRadius(10) // Cantos arredondados
                        .overlay( // Adiciona uma borda em volta
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1) // Borda azul
                        )
                        .padding(.horizontal) // Espaçamento nas laterais

                    // Botão para abrir o perfil (simulando o "apertar na conta")
                    Button {
                        mostrandoPerfil.toggle() // Muda o valor de mostrandoPerfil
                    } label: {
                        Image(systemName: "person.crop.circle.fill") // Ícone de pessoa
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing) // Espaçamento na direita
                }
                .padding(.top) // Espaçamento em cima da barra de pesquisa

                // AQUI ENTRARIA A LISTA DE NOTÍCIAS!
                // Por enquanto, só um texto placeholder
                List {
                    Text("Notícia Incrível 1: SwiftUI é demais!")
                        .padding(.vertical, 5)
                    Text("Notícia Fantástica 2: O futuro é agora!")
                        .padding(.vertical, 5)
                    Text("Mais uma Notícia 3: Dicas de código!")
                        .padding(.vertical, 5)
                }
                .listStyle(.plain) // Estilo mais limpo pra lista

                Spacer() // Empurra tudo para cima
            }
            .navigationTitle("Meu Navegador Incrível") // Título da tela
            // Sheet é uma tela que aparece deslizando de baixo
            .sheet(isPresented: $mostrandoPerfil) {
                // Aqui é onde você colocaria o CÓDIGO DA TELA DE PERFIL!
                // Por enquanto, só um placeholder!
                PerfilViewPlaceholder()
            }
        }
    }
}

// Uma view placeholder pra simular a tela de perfil
struct PerfilViewPlaceholder: View {
    @Environment(\.dismiss) var dismiss // Pra fechar a tela de perfil

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Text("Seu Perfil")
                .font(.largeTitle)

            Text("Aqui você veria suas informações, opções de login, publicar, etc.")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            Button("Fechar") {
                dismiss() // Fecha a tela
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground)) // Fundo branco padrão
    }
}

// Pra ver no Xcode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

