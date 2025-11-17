# Análise de Requisitos - Projeto Bomba Relógio

## 1. Requisitos Explícitos (Definidos no PDF)

Esta é a lista do que o sistema **deve** fazer.

### 1.1. Início e Definição de Senhas

- O sistema inicia sua operação quando o botão **Start (KEY\[0\])** é pressionado.
- Nesse momento, o sistema deve ler e **armazenar internamente**:
  - A **Senha A (4 bits)** das chaves **SW\[17:14\]**.
  - A **Senha B (3 bits)** das chaves **SW\[13:11\]**.
- Após o armazenamento, as senhas não devem ser perdidas mesmo que as chaves SW\[17:11\] mudem de posição.

### 1.2. Timer e Exibição Principal

- Imediatamente após pressionar Start, um contador regressivo de **2 minutos e 59 segundos** é iniciado.
- O tempo restante deve ser exibido nos displays **HEX0, HEX1, HEX2 e HEX3**.

### 1.3. Fluxo de Jogo (Tentativas)

- O jogador deve primeiro acertar a Senha A.
- Uma tentativa da Senha A é inserida usando as chaves **SW\[3:0\]**.
- Somente após a Senha A estar correta, o sistema permite a inserção da Senha B.
- Uma tentativa da Senha B é inserida usando as chaves **SW\[2:0\]**.
- Para ambas as senhas, a tentativa é confirmada pressionando o botão **ENTER (KEY\[3\])**.

### 1.4. Exibição das Tentativas (HEX4)

- O display **HEX4** é usado para mostrar a tentativa que está sendo inserida.
- **Formato da Senha A:** A tentativa de 4 bits (SW\[3:0\]) deve acender os **4 segmentos superiores** (índices 0, 1, 5, 6) do HEX4.
- **Formato da Senha B:** A tentativa de 3 bits (SW\[2:0\]) deve acender os **3 segmentos inferiores** (índices 2, 3, 4) do HEX4.

### 1.5. Sistema de Dicas (Se Errar)

- Se o jogador errar uma senha e pressionar ENTER, o timer continua, e o sistema deve fornecer duas dicas.
- **Dica 1a (Paridade):** O display **HEX7** deve mostrar 0 ou 1, indicando o bit de paridade par do _total_ de bits '1' das senhas corretas (A e B unidas).
- **Dica 1b (Maior/Menor):** O display **HEX6** deve indicar se a senha _correta_ é "menor" ou "maior" que a _tentativa_ inserida, usando os formatos de display especificados no PDF.
- **Dica 2 (Bits Corretos):** Os **LEDRs vermelhos (LEDR)** devem acender em formato de barra progressiva para indicar o número de bits corretos.
  - Para Senha A: **LEDR\[3:0\]**.
  - Para Senha B: **LEDR\[2:0\]**.

### 1.6. Condições de Fim de Jogo

- **Vitória (Bomba Desarmada):**
  - Ocorre quando o jogador acerta a Senha A e, em seguida, a Senha B.
  - O **contador de tempo é congelado**.
  - **Todos os LEDGs (LEDs verdes)** se acendem.
- **Derrota (Bomba Explode):**
  - Ocorre se o tempo se esgotar antes das duas senhas serem inseridas corretamente.
  - A explosão deve ser indicada por "efeitos luminosos com os LEDRs e os HEXs".

---

## 2. Dúvidas

1.  **Estado Inicial dos Displays:**

    - _Pergunta:_ O que os displays de dicas (HEX6, HEX7), tentativa (HEX4) e bits corretos (LEDRs) mostram _antes_ da primeira tentativa ser submetida (ou seja, logo após pressionar START)?
    - \*Sugestão: Apagá-los ou inicializá-los com um valor padrão

2.  **Transição da Senha A para a Senha B:**

    - _Pergunta:_ Quando o jogador acerta a Senha A, o que acontece? O sistema automaticamente espera a senha B?

3.  **Comportamento Pós-Jogo:**

    - _Pergunta:_ O que acontece após uma vitória ou derrota? O sistema fica em loop na animação de derrota ou vitória até apertar o Start novamente?

4.  **Reinício do Jogo:**
    - _Pergunta:_ Como o jogo é reiniciado? Apenas apertar o Start?
