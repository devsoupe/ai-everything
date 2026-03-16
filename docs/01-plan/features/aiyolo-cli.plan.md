# 계획: aiyolo CLI 라우터

## 요약 (Executive Summary)
| 기능 (Feature) | aiyolo CLI 라우터 |
|---------|-------------------|
| 날짜 (Date) | 2026-03-12 |
| 범위 (Scope) | AI CLI 명령어 라우팅을 위한 독립적인 쉘 스크립트 작성 |

## 1. 문제 정의 (Problem Statement)
- 사용자는 현재 `.zshrc` 파일에 쉘 함수 형태로 명령어를 사용하고 있으며, 이는 독립적인 도구로 관리하거나 이식하기 어렵습니다.
- `ccr` (Claude)과 `gemini` CLI 간의 실행을 라우팅할 수 있는 전용 스크립트가 필요합니다.

## 2. 해결 방안 (Proposed Solution)
- `aiyolo`라는 이름의 독립적인 쉘 스크립트를 생성합니다.
- 사용자가 제공한 쉘 함수의 로직을 그대로 구현합니다.
- 스크립트를 로컬에서 사용하거나 전역으로 설치하기 쉽게 `bin` 디렉토리에 배치합니다.

## 3. 구현 계획 (Implementation Plan)
1. **분석 (Research)**: `ccr` 및 `gemini` 명령어 존재 여부를 확인하는 방법을 조사합니다.
2. **설계 (Design)**: 적절한 Shebang과 인자 처리 로직을 포함하여 스크립트 내용을 초안합니다.
3. **실행 (Do)**: 스크립트를 `bin/aiyolo`에 작성하고 실행 권한을 부여합니다.
4. **검증 (Check)**: 스크립트의 도움말 출력 및 라우팅 로직이 정상 동작하는지 확인합니다.
5. **완료 (Act)**: 최종 정리 및 보고서를 작성합니다.

## 4. 작업 목록 (Tasks)
- [x] [계획] aiyolo-cli
- [x] [설계] aiyolo-cli
- [x] [구현] aiyolo-cli
- [x] [검증] aiyolo-cli
