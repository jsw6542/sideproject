# 아르카나 (Arcana)
+ **아르카나(Arcana)**는 사용자 친화적인 인형 쇼핑몰로, Spring MVC와 Oracle DB를 사용하여 설계 및 구현한 1인 프로젝트입니다.

+ 이 프로젝트는 사용자 친화적인 쇼핑 환경을 제공하는 데 초점을 맞추었으며, 관리자가 상품 및 주문을 관리할 수 있는 강력한 백오피스 기능을 제공합니다.

# 🧙‍♂️ 프로젝트 개요
* 프로젝트명 : 아르카나 (Arcana)
* 목적 :
    + 사용자가 제품을 쉽게 탐색하고 구매할 수 있는 쇼핑몰 구현
    + 관리자 페이지를 통해 상품, 주문, 게시판을 관리
    + 결제 기능을 통해 실제 쇼핑몰의 주요 기능 시뮬레이션
* 개발 기간 : 2024/06 ~ 2024/10
* 개발자 : 정승원
- - -
# 📌 주요 기능
## 일반 사용자
* 회원가입 및 로그인
 + 사용자의 회원 정보는 암호화되어 안전하게 저장
* 상품 검색 및 카테고리 탐색
 + Bootstrap 기반으로 반응형 디자인 제공
* 장바구니 및 주문 기능
 + 실시간 장바구니 상태 확인
 + PortOne(구 iamport) Kakao Pay API 연동으로 간편 결제 기능 구현
* 게시판 기능
 + 공지사항, 문의, 리뷰 관리
 + 최신 공지 상단 고정 및 다양한 게시판 정렬 방식 제공
## 관리자
 * 상품 관리
  + 상품 추가, 수정, 삭제
  + 페이징 및 정렬 기능으로 효율적 상품 관리
 * 주문 관리
  + 상세 주문 내역 확인 및 관리
  + 회원 관리
  + 사용자 정보 확인 및 관리
- - -
### 🛠 기술 스택
* 백엔드: Spring MVC, MyBatis, Oracle DB
* 프론트엔드: HTML, CSS (Bootstrap), JavaScript (jQuery)
* 결제 연동: Kakao Pay API (PortOne)
* 개발 도구: STS3 (Spring Tool Suite)
* 버전 관리: Git & GitHub
- - -
# 📂 프로젝트 구조
src/main/
│
├── java/com.arcana.controller      # 컨트롤러 계층
├── java/com.arcana.dao             # DAO 계층
├── java/com.arcana.vo              # VO (Value Object)
│
├──  resources/mapper                # MyBatis 매퍼 파일
├──  webapp/
    ├── WEB-INF/jsp/               # JSP 뷰 파일
    ├── assets/                    # 정적 파일 (CSS, JS, Images)
- - -
# 📸 프로젝트 데모
(프로젝트의 주요 화면 캡처 이미지를 추가하세요.)
- - -
# 🗂 참고 자료
Spring 공식 문서
Oracle Database 공식 문서
