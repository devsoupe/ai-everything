# 설계: aiyolo CLI 라우터

## 1. 개요 (Overview)
Claude (ccr)과 Gemini CLI 사이에서 명령을 라우팅하는 독립적인 `aiyolo` 스크립트.

## 2. 기술 명세 (Technical Specification)
- **언어 (Language)**: Zsh (쉘 스크립트)
- **Shebang**: `#!/usr/bin/env zsh`
- **의존성 (Dependencies)**: `ccr` (claude-code-router), `gemini` CLI

## 3. 스크립트 로직 (Script Logic)
```zsh
#!/usr/bin/env zsh

# aiyolo - 다중 에이전트 AI CLI 라우터

function show_help() {
  echo -e "\033[1mAIYOLO\033[0m - 다중 에이전트 AI CLI 라우터"
  echo ""
  echo -e "\033[1m사용법 (USAGE)\033[0m"
  echo -e "  aiyolo [옵션] [인자...]"
  echo ""
  echo -e "\033[1m옵션 (OPTIONS)\033[0m"
  echo -e "  \033[1;36m-c, --claude\033[0m    claude-code-router를 통해 Claude 실행 (기본값)"
  echo -e "  \033[1;36m-g, --gemini\033[0m    Google Gemini CLI 실행"
  echo -e "  \033[1;36m-h, --help\033[0m      현재 도움말을 표시하고 종료"
  echo ""
  echo -e "\033[1m예시 (EXAMPLES)\033[0m"
  echo -e "  aiyolo -c                    \033[90m# Claude 대화형 세션 시작\033[0m"
  echo -e "  aiyolo -g /code-review       \033[90m# Gemini를 /code-review 명령어와 함께 시작\033[0m"
}

if [[ -z "$1" || "$1" == "--help" || "$1" == "-h" ]]; then
  show_help
  exit 0
fi

# 원래 함수에서 요청한 화면 초기화
clear

# 가능하다면 ccr 환경 활성화 시도
if command -v ccr >/dev/null 2>&1; then
  eval "$(ccr activate 2>/dev/null)"
fi

case "$1" in
  -g|--gemini)
    shift
    if ! command -v gemini >/dev/null 2>&1; then
      echo "오류: gemini 명령어를 찾을 수 없습니다."
      exit 1
    fi
    NODE_NO_WARNINGS=1 gemini "$@"
    ;;
  -c|--claude)
    shift
    if ! command -v ccr >/dev/null 2>&1; then
      echo "오류: ccr 명령어를 찾을 수 없습니다."
      exit 1
    fi
    NODE_NO_WARNINGS=1 ccr code "$@"
    ;;
  *)
    if ! command -v ccr >/dev/null 2>&1; then
      echo "오류: ccr 명령어를 찾을 수 없습니다."
      exit 1
    fi
    NODE_NO_WARNINGS=1 ccr code "$@"
    ;;
esac
```

## 4. 설치 방법 (Installation)
- 파일을 `bin/aiyolo`에 저장합니다.
- `chmod +x bin/aiyolo` 명령어로 실행 권한을 부여합니다.
- (선택 사항) `/usr/local/bin/aiyolo` 등으로 시스템 환경 변수(PATH)에 심볼릭 링크를 생성합니다.
