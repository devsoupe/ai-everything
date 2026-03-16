#!/usr/bin/env bash

# 설치할 디렉토리 설정 (사용자 홈 디렉토리 하위의 .local/bin)
# /usr/local/bin 으로 설정하려면 sudo 권한이 필요하므로 사용자 경로를 추천합니다.
INSTALL_DIR="$HOME/.local/bin"

# 설치 디렉토리가 없으면 생성
mkdir -p "$INSTALL_DIR"

# 현재 스크립트가 위치한 디렉토리의 절대 경로를 구함 (bin 폴더)
BIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 ai-everything 명령어 설치를 시작합니다..."
echo "📂 소스 경로: $BIN_DIR"
echo "🎯 설치 경로: $INSTALL_DIR"
echo "----------------------------------------"

# bin 디렉토리 내의 모든 실행 가능한 파일에 대해 심볼릭 링크 생성
for cmd in "$BIN_DIR"/*; do
  cmd_name="$(basename "$cmd")"
  
  # install.sh 자신은 심볼릭 링크 생성에서 제외
  if [ "$cmd_name" = "install.sh" ]; then
    continue
  fi

  if [ -f "$cmd" ]; then
    # 실행 권한 부여
    chmod +x "$cmd"
    
    cmd_name="$(basename "$cmd")"
    target_link="$INSTALL_DIR/$cmd_name"
    
    # 기존 파일이나 링크가 있으면 삭제 후 심볼릭 링크(바로가기) 생성
    ln -sf "$cmd" "$target_link"
    
    echo "✅ 설치됨: $cmd_name -> $target_link"
  fi
done

echo "----------------------------------------"
echo "🎉 설치가 완료되었습니다!"
echo ""
echo "⚠️  주의: 명령어를 사용하려면 PATH 환경변수에 '$INSTALL_DIR' 경로가 추가되어 있어야 합니다."
echo "만약 'command not found' 에러가 발생한다면, ~/.zshrc 또는 ~/.bashrc 파일의 맨 아래에 다음 줄을 추가하세요:"
echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
echo ""
