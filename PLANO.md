# Plano do Technique Pixel Dungeon

Mod do [Shattered Pixel Dungeon](https://github.com/00-Evan/shattered-pixel-dungeon) (v4.0.2) com foco em técnicas: cada herói monta as próprias técnicas com talismãs, num grimório que evolui com o uso.

Nome provisório. Licença GPLv3, igual ao original: o código fica aberto e nenhum crédito original pode sair.

## Decidido (31/10/2026)

**Língua:** só português. É a tradução da comunidade do Shattered, que já vem completa.

**Classes:** as seis do Shattered continuam e são modificadas uma de cada vez. A ideia de cada classe fica parecida; em algumas muda o jeito de executar.

**Grimório de técnicas**
- Espaço novo de equipamento, só para o grimório.
- Funciona igual ao Tomo sagrado do Clérigo: clica, escolhe a técnica e age na hora.
- Evolui com o uso, igual ao tomo e à capa das sombras.
- Duelista: a técnica sai com a arma que estiver na mão.
- Mago: escolhe a técnica e depois a varinha, numa seleção igual à do pergaminho de remover maldição (o que não serve fica cinza). Qualquer varinha serve.

**Talismãs**
- Consumível novo: pecinhas de madeira com runas. Aparecem na masmorra, como poções e pergaminhos.
- Sem identificar: a cada partida as runas mudam de significado, como as cores das poções.
- Encaixar um talismã num espaço do grimório transforma o espaço numa técnica.
- Se você não sabia o que o talismã era, não tem volta.

## Proposto (confirmar jogando)

- **Todas as seis classes ganham o espaço do grimório.** Guerreiro, Ladino e Caçadora começam usando a técnica com a arma na mão, como a Duelista, e depois ganham um jeito próprio (Caçadora com o arco espiritual, Ladino com a capa).
- **A Duelista continua a melhor com técnicas de arma:** os talentos dela deixam as técnicas mais baratas ou mais fortes.
- **O Tomo sagrado vira o grimório do Clérigo:** vai para o espaço novo e libera o espaço de artefato. As orações viram as técnicas dele.
- **Evolução:** cada carga gasta dá XP ao grimório, até o nível 10, e ele ganha XP mais rápido quando está atrasado para o andar. Começa com 1 espaço e abre outro nos níveis 2, 4, 6, 8 e 10. Subir de nível também deixa as técnicas mais fortes.
- **Talismã amaldiçoado:** encaixado sem saber, deixa uma técnica ruim (custa mais carga ou machuca você).
- **Cobrir o espaço:** dá para pôr outro talismã por cima, perdendo o antigo. Errar dói, mas não trava o personagem.
- **Identificação:** o pergaminho de identificação também funciona em talismãs.
- **Cada classe lê a runa do seu jeito:** a mesma runa de fogo vira golpe flamejante na Duelista, bola de fogo no Mago e chama sagrada no Clérigo.

## Ainda a decidir

- O talismã é a técnica inteira ("Talismã do corte giratório") ou muda uma técnica que já existe ("+ sangramento")? Sugestão: técnica inteira, que é mais simples de entender e de equilibrar.
- Quem evolui com o uso: o grimório inteiro ou cada técnica separada?

## Etapas

### Fase 0: base
1. Nome e pacote próprios.
2. Português como única língua, com os tradutores nos créditos.
3. Notícias e aviso de atualização do Shattered desligados.
4. Créditos do mod na tela Sobre, sem tirar nenhum dos originais.
5. README do mod e um jeito de compilar sem o Gradle.

Fica para a fase 5: título e ícone novos.

### Fase 1: grimório e talismãs na Duelista
1. Espaço novo de equipamento (tela de equipamento e save).
2. O grimório: janela de técnicas, cargas, XP por uso e espaços.
3. O talismã: runas sorteadas por partida, identificação e maldição.
4. Primeira leva de talismãs: as técnicas que a Duelista já tem (cortar, golpe pesado, estocada…), soltas da arma.
5. Talismãs aparecendo na masmorra.
6. A Duelista começa com o grimório.

Pronto quando der para jogar uma partida de Duelista achando, identificando e encaixando talismãs.

### Fase 2: Clérigo
O tomo vira o grimório, e as orações viram técnicas que convivem com os talismãs.

### Fase 3: Mago
Técnica escolhida no grimório e lançada por qualquer varinha.

### Fase 4: Guerreiro, Ladino e Caçadora
Primeiro com a arma na mão, depois cada um com o seu jeito.

### Fase 5: arte e lançamento
Título, ícone, desenhos dos talismãs e do grimório, e pacotes para Windows e Linux.

## Como trabalhamos

- Commits pequenos, um por passo, no padrão "Update arquivo: o que mudou".
- Cada etapa termina com o jogo compilando, rodando e com prints.
- Mudança de regra de jogo só entra depois de conversar.
