## Requisitos

> **Início e Definição de Senhas**
>
> - O sistema inicia sua operação quando o botão **Start (KEY\[0\])** é pressionado.
> - Nesse momento, o sistema deve ler e **armazenar internamente**:
>   - A **Senha A (4 bits)** das chaves **SW\[17:14\]**.
>   - A **Senha B (3 bits)** das chaves **SW\[13:11\]**.
> - Após o armazenamento, as senhas não devem ser perdidas mesmo que as chaves SW\[17:11\] mudem de posição.

## Detalhes

É necessário implementar uma máquina de estados nessa parte para conseguir voltar o jogo no estado inicial
