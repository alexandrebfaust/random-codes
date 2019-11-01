Algoritmo "Matriz"
// Alust97
var
  n1, n2, opcao, i, j: inteiro
  matriz1:vetor[1..5,1..5] de real
  matriz2:vetor[1..5,1..5] de real
  matrizaux:vetor[1..5,1..5] de real //Matriz auxiliar

inicio
escreval("Gerando matriz aleatória inicial...")
para i de 1 ate 5 faca
   para j de 1 ate 5 faca
      matriz1[i,j] <- randi(10)
      matriz2[i,j] <- randi(10)
   fimpara
fimpara
  repita
    escreval("0 - Exibir matriz ")
    escreval("1 - Soma ")
    escreval("2 - Subtração ")
    escreval("3 - Multiplicação ")
    escreval("4 - Transposta ")
    escreval("5 - Diagonal principal ")
    escreval("6 - Gerar matrizes aleatórias ")
    escreval("9 - Sair ")
    escreva("Digite uma opção: ")
    leia(opcao)

    escolha opcao
      caso 0
         limpatela
         escreval("Matriz 1")
         para i de 1 ate 5 faca
            escreval("-----------")
            para j de 1 ate 5 faca
               escreva(matriz1[i,j])
            fimpara
            escreval(" ")
         fimpara
         escreval(" ")
         escreval("-----------")

         escreval(" ")
         escreval(" ")
         escreval("Matriz 2")
         para i de 1 ate 5 faca
            escreval("-----------")
            para j de 1 ate 5 faca
               escreva(matriz2[i,j])
            fimpara
            escreval(" ")
         fimpara
         escreval(" ")
         
      caso 1
          limpatela
          escreval("Somando matrizes...")
          para i de 1 ate 5 faca
             escreval("-----------")
             para j de 1 ate 5 faca
                escreva(matriz1[i,j]+matriz2[i,j])
             fimpara
             escreval(" ")
          fimpara
          escreval(" ")
          
      caso 2
          limpatela
          escreval("Subtraindo matrizes...")
          para i de 1 ate 5 faca
             escreval("-----------")
             para j de 1 ate 5 faca
                escreva(matriz1[i,j]-matriz2[i,j])
             fimpara
             escreval(" ")
          fimpara
          escreval(" ")
          
      caso 5
          limpatela
          escreval("Diagonal principal...")
          escreval("Matriz 1")
          escreval("-----------")
          para i de 1 ate 5 faca
             escreva(matriz1[i,i])
          fimpara
          escreval(" ")
          escreval(" ")
          escreval("Matriz 2")
          escreval("-----------")
          para i de 1 ate 5 faca
             escreva(matriz2[i,i])
          fimpara
          escreval(" ")
          escreval(" ")
      caso 6
         limpatela
         escreval("Gerando matrizes...")
         para i de 1 ate 5 faca
            para j de 1 ate 5 faca
               matriz1[i,j] <- randi(10)
               matriz2[i,j] <- randi(10)
            fimpara
         fimpara

         limpatela
         escreval("Matriz 1")
         para i de 1 ate 5 faca
            escreval("-----------")
            para j de 1 ate 5 faca
               escreva(matriz1[i,j])
            fimpara
            escreval(" ")
         fimpara
         escreval(" ")
         escreval("-----------")

         escreval(" ")
         escreval(" ")
         escreval("Matriz 2")
         para i de 1 ate 5 faca
            escreval("-----------")
            para j de 1 ate 5 faca
               escreva(matriz2[i,j])
            fimpara
            escreval(" ")
         fimpara
         escreval(" ")
         escreval("Matrizes geradas com sucesso!")
      outrocaso
        escreva("Opção não existe")

      fimescolha


  ate opcao > 8
fimalgoritmo
