# Technique Pixel Dungeon

Mod do [Shattered Pixel Dungeon](https://github.com/00-Evan/shattered-pixel-dungeon), em português, com foco em técnicas: cada herói vai montar as próprias técnicas com talismãs, num grimório que evolui com o uso.

**Situação:** a base está pronta. Por enquanto o jogo é o Shattered Pixel Dungeon 4.0.2 em português, com nome e save próprios. O grimório e os talismãs são a próxima fase. O plano completo está em [PLANO.md](PLANO.md).

## Compilar e jogar

Precisa do Java 11 ou mais novo (o JDK, que traz o `javac`).

**Sem Gradle** (Linux ou macOS):

```
ferramentas/compilar.sh --rodar
```

Na primeira vez, o script baixa o Shattered Pixel Dungeon oficial do GitHub para tirar dele as bibliotecas (libGDX, LWJGL…). O jogo compilado fica em `build-local/TechniquePixelDungeon.jar` e abre com `java -jar`.

**Com Gradle:** `./gradlew desktop:debug` roda o jogo e `./gradlew desktop:release` gera o JAR em `desktop/build/libs`. Os guias do Shattered em [docs/](docs/) explicam o resto (em inglês).

Os saves ficam separados dos do Shattered. No Linux, ficam em `~/.local/share/.louzada/technique-pixel-dungeon/`.

## O que muda em relação ao Shattered

- Nome, pacote e versão próprios (0.1.0).
- Só português: as outras línguas e o seletor de idioma saíram.
- Sem as notícias e o aviso de atualização do Shattered.
- Tela Sobre com os créditos do mod e dos tradutores para o português, além de todos os créditos originais.

## Créditos e licença

- **Shattered Pixel Dungeon:** Evan Debenham ([ShatteredPixel.com](https://shatteredpixel.com)).
- **Pixel Dungeon:** Watabou, que é a base do Shattered.
- **Tradução para o português:** a comunidade do Shattered no [Transifex](https://explore.transifex.com/shattered-pixel/shattered-pixel-dungeon/).
- **Arte, música e sons:** os mesmos do Shattered, com os autores listados na tela Sobre do jogo.

Licença GPLv3, igual à do original (veja [LICENSE.txt](LICENSE.txt)). O código deste mod continua aberto, e os créditos originais não podem ser removidos.
