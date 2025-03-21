<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.LecturerDAO" %>
<%@ page import="model.Lecturer" %>
<%
    int lecturerId = Integer.parseInt(request.getParameter("id"));
    LecturerDAO lecturerDAO = new LecturerDAO();
    Lecturer lecturer = lecturerDAO.getLecturerById(lecturerId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Lecturer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Chỉnh sửa Giảng Viên</h1>
        <form action="lecturers" method="post" class="mt-4">
            <input type="hidden" name="lecturerId" value="<%= lecturer.getLecturerId() %>">
            <div class="mb-3">
                <label for="fullName" class="form-label">Họ tên</label>
                <input type="text" class="form-control" id="fullName" name="fullName" value="<%= lecturer.getFullName() %>" required>
            </div>
            <div class="mb-3">
                <label for="department" class="form-label">Ngành</label>
                <input type="text" class="form-control" id="department" name="department" value="<%= lecturer.getDepartment() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a href="lecturers.jsp" class="btn btn-secondary">Huỷ</a>
        </form>
    </div>
</body>
</html>