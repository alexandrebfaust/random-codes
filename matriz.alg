Algoritmo "Matriz"
// Alust97
var
  n1, n2, opcao: inteiro
  r: real

inicio
  escreva(" Escreva um numero ")
  leia(n1)

  escreva(" Escreva outro numero ")
  leia(n2)

  escreval("0 - Gerar matriz aleatória")
  escreval("1 - Soma ")
  escreval("2 - Subtração ")
  escreval("3 - Multiplicação ")
  escreval("4 - Transposta ")
  escreval("5 - Diagonal principal ")
  escreval("6 - Sair ")
  leia(opcao)

  escolha opcao
    caso 1
      r<-n1+n2
    caso 2
      r<-n1-n2
    outrocaso
      escreva("sua mula nao temos essa opção! ")
      r<-0
    fimescolha

  escreva("O resultado é ",r)

fimalgoritmo
