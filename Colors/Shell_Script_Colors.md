# Adicionando Cores ao `Shell Script`

##### Informações encontradas [nesta página](https://misc.flogisoft.com/bash/tip_colors_and_formatting)

## Disposições Gerais

As sequências são compostas pelo caractere `Escape` (Geralmente representado por” ⁣`^[`” ou ” ⁣`<Esc>`”) seguido por outros caracteres: ex: ” `^[FCm`” (Onde `^[` `FCm` é o valor).

### `Bash`

Como vamos trabalhar essencialmente com scripts escritos para serem executados no `bash`. Vamos utilizar os seus caracteres de escape. Que são:

> \e
> \033 (octal)
> \x1B (hexadecimal)

Por padrão, vou adotar o `\033`, mas você pode utilizar qualquer um.

### Remover a Formatação e Cores

Para remover todas as formatações e cores de um texto no terminal é utilizando o comando. Pode ser uma boa ideia adicioná-lo ao final de cada texto colorido.

    \033[0m

Então você pode testar executando em seu terminal o seguinte comando.

    printf  "\033[32m Texto em VERDE... \033[0m Agora sem formatacao! \\n"

### Compatibilidade de Cores

As cores de primeiro e segundo plano podem variar, dependendo da configuração do terminal e nem todas as cores são suportadas.
Nesta [página](https://misc.flogisoft.com/bash/tip_colors_and_formatting#terminals_compatibility), você pode conferir uma tabela de compatibilidade para os terminais e cores.

## Definir / Redefinir

### 0: Redefina / remover

Remove todos os atributos de modificador, primeiro plano e plano de fundo

#### Exemplo:

    printf  "\033[32m Texto em VERDE... \033[0m Agora sem formatacao! \\n"

### 1: Negrito / Brilhante: echo -e "Normal \e[1mBold"

### 2: Dim: echo -e "Normal \e[2mDim"

### 4: Sublinhado: echo -e "Normal \e[4mUnderlined"

### 5: Pisca (não funciona na maioria dos terminais, exceto no XTerm): echo -e "Normal \e[5mBlink"

### 7: Inverter / Inverter: echo -e "Normal \e[7minverted"

### 8: Oculto (útil para informações confidenciais): echo -e "Normal \e[8mHidden Input"

### 21: Redefinir / remover negrito / claro: echo -e "Normal \e[1mBold \e[21mNormal"

### 22: Redefinir / remover dim: echo -e "Normal \e[2mDim \e[22mNormal"

### 24: Redefinir / remover sublinhado: echo -e "Normal \e[4mUnderlined \e[24mNormal"

### 25: Redefinir / remover piscada: echo -e "Normal \e[5mBlink \e[25mNormal"

### 27: Redefinir / remover reverso / invertido: echo -e "Normal \e[7minverted \e[27mNormal"

### 28: Redefinir / remover oculto: echo -e "Normal \e[8mHidden \e[28mNormal"

Primeiro plano

39: Padrão (geralmente verde, branco ou cinza claro): echo -e "Default \e[39mDefault"

30: Black: echo -e "Default \e[30mBlack"(melhor combinada com uma cor de fundo: echo -e "Default \e[30;107mBlack on white")

31: Vermelho (não use com fundo verde)

32: Verde

33: Amarelo

34: Azul

35: Magenta / Roxo

36: Ciano

37: Cinza claro

90: Cinza escuro

91: Luz vermelha

92: Luz verde

93: Luz amarela

94: Azul claro

95: Magenta claro / Rosa

96: Ciano claro

97: Branco

fundo

49: Cor de fundo padrão (geralmente preto ou azul)

40: Preto

41: Vermelho

42: Verde

43: Amarelo

44: Azul

45: Magenta / Roxo

46: Ciano

47: Cinza claro (não use em primeiro plano branco)

100: Cinza escuro (não use com primeiro plano preto)

101: Luz vermelha

102: Verde claro (não use com o primeiro plano branco)

103: Amarelo claro (não use com o primeiro plano branco)

104: Azul claro (não use com o primeiro plano amarelo claro)

105: Magenta claro / rosa (não use com o primeiro plano claro)

106: Ciano claro (não use com o primeiro plano branco)

107: Branco (não use com o primeiro plano claro)

Para definir as cores de primeiro e segundo plano de uma só vez, use o formulário echo -e "\e[S;FG;BGm". Por exemplo: echo -e "\e[1;97;41m"(primeiro plano em negrito em fundo vermelho)

Para 256 opções de cores, consulte a página de origem.
