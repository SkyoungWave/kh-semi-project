<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.bookApply.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #insert-area{
        background-color: black;
        color: white;
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    #insert-form>table {
		border:1px solid white;
		}
    #insert-form input,#insert-form textarea{
        width: 100%;
        height: 100%;
        box-sizing: border-box;

    }

</style>
<body>
    <%@include file="/views/common/menubar.jsp"%>
    <div id="insert-area" align="center">
        <br>
        <h2>글 작성</h2>
        <form action="<%=contextPath%>/insert.ba" id="insert-form" method="post">
            <table align="center" border="1">
                <thead>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="title" required placeholder="<도서제목/작가>를 기재해주세요"></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th style="width: 100px; height: 200px;" >내용</th>
                        <td colspan="3" style="width: 300px; height: 300px;">
                            <textarea name="content" style="resize:none" requied>*양식에 맞게 기재해주세요*                           

1.신청 도서 제목


2.작가/출판사
                            </textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br><br>

            <div align="center">
                <button type="submit">확인</button>
                <button type="reset">취소</button>
            </div>
            <br>
        </form>


    </div>

</body>
</html>