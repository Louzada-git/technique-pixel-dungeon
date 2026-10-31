#!/bin/bash
# Compila o jogo sem o Gradle e gera um JAR que roda com "java -jar".
#
# As bibliotecas (libGDX, LWJGL...) vêm do JAR oficial do Shattered Pixel Dungeon
# da mesma versão, baixado uma vez do GitHub. Só o código e os assets deste
# repositório entram no jogo; as classes e os assets do Shattered oficial são descartados.
#
# Uso (da raiz do repositório):
#   ferramentas/compilar.sh           compila e gera build-local/TechniquePixelDungeon.jar
#   ferramentas/compilar.sh --rodar   compila e abre o jogo
#
# Precisa de: Java 11 ou mais novo (JDK, com javac e jar), curl e unzip.

set -e

RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
SAIDA="$RAIZ/build-local"
VERSAO_SHATTERED="v4.0.2"
JAR_OFICIAL="$SAIDA/oficial/ShatteredPD-$VERSAO_SHATTERED-Java.jar"

campo() {
	sed -n "s/^ *$1 = '\{0,1\}\([^']*\)'\{0,1\}$/\1/p" "$RAIZ/build.gradle" | head -1
}
NOME="$(campo appName)"
PACOTE="$(campo appPackageName)"
VERSAO="$(campo appVersionName)"
CODIGO="$(campo appVersionCode)"

# 1. Bibliotecas, tiradas do JAR oficial
if [ ! -d "$SAIDA/libs" ]; then
	mkdir -p "$SAIDA/oficial"
	if [ ! -f "$JAR_OFICIAL" ]; then
		echo "Baixando o Shattered Pixel Dungeon $VERSAO_SHATTERED para pegar as bibliotecas..."
		curl -fsSL -o "$JAR_OFICIAL" \
			"https://github.com/00-Evan/shattered-pixel-dungeon/releases/download/$VERSAO_SHATTERED/ShatteredPD-$VERSAO_SHATTERED-Java.jar"
	fi
	mkdir -p "$SAIDA/libs"
	unzip -q "$JAR_OFICIAL" -d "$SAIDA/libs"
	(cd "$SAIDA/libs" && rm -rf com/shatteredpixel com/watabou META-INF/MANIFEST.MF \
		effects environment fonts gdx icons interfaces messages music sounds splashes sprites)
fi

# 2. Código
echo "Compilando $NOME $VERSAO..."
rm -rf "$SAIDA/classes"
mkdir -p "$SAIDA/classes"
(cd "$RAIZ" && find SPD-classes/src/main/java core/src/main/java desktop/src/main/java \
	services/src/main/java services/updates/debugUpdates/src/main/java \
	services/news/debugNews/src/main/java -name '*.java') > "$SAIDA/fontes.txt"
(cd "$RAIZ" && javac -nowarn -encoding UTF-8 --release 11 -cp "$SAIDA/libs" \
	-d "$SAIDA/classes" @"$SAIDA/fontes.txt" 2>&1 | grep -v "^Note:\|JAVA_TOOL_OPTIONS" || true)
if [ ! -f "$SAIDA/classes/com/shatteredpixel/shatteredpixeldungeon/desktop/DesktopLauncher.class" ]; then
	echo "A compilação falhou." >&2
	exit 1
fi

# 3. JAR
cat > "$SAIDA/manifest.txt" <<EOF
Main-Class: com.shatteredpixel.shatteredpixeldungeon.desktop.DesktopLauncher
Specification-Title: $NOME
Implementation-Title: $PACOTE
Specification-Version: $VERSAO
Implementation-Version: $CODIGO
EOF
JAR="$SAIDA/TechniquePixelDungeon.jar"
rm -f "$JAR"
jar cfm "$JAR" "$SAIDA/manifest.txt" -C "$SAIDA/libs" . -C "$SAIDA/classes" . \
	-C "$RAIZ/core/src/main/assets" . -C "$RAIZ/desktop/src/main/assets" .
echo "Pronto: $JAR ($(du -h "$JAR" | cut -f1))"

if [ "$1" = "--rodar" ]; then
	java -jar "$JAR"
fi
