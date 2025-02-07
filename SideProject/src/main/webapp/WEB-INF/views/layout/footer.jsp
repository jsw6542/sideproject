<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer-->
<style>
    /* 전체 페이지 높이를 100%로 설정 */
    html, body {
        height: 100%;
        margin: 0;
    }

    /* wrapper를 flexbox로 설정 */
    .wrapper {
        display: flex;
        flex-direction: column;
        min-height: 100vh; /* 최소 높이를 100vh로 설정하여 푸터가 페이지 하단에 위치하도록 함 */
    }

    /* 콘텐츠 영역 */
    .content {
        flex-grow: 1; /* 콘텐츠가 부족하면 푸터를 하단으로 밀어냄 */
    }

    /* 푸터 스타일 */
    footer {
        background-color: rgba(var(--bs-dark-rgb), 1);
        padding-top: 3rem;
        padding-bottom: 3rem;
        text-align: center;
        width: 100%;
        z-index: 100;
        margin-top: auto; /* 푸터를 하단으로 밀어내기 */
    }
</style>





<footer class="py-3 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright © 아르카나 2024</p>
    </div>
</footer>





