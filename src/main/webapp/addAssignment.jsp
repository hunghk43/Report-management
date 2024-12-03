<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.LecturerDAO" %>
<%@ page import="dao.CommitteeDAO" %>
<%@ page import="model.Lecturer" %>
<%@ page import="model.Committee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm Phân công Giảng viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Thêm Phân công Giảng viên</h1>
        
        <% 
            // Khởi tạo DAO để lấy giảng viên và hội đồng
            LecturerDAO lecturerDAO = new LecturerDAO();
            List<Lecturer> lecturers = lecturerDAO.getAllLecturers();

            CommitteeDAO committeeDAO = new CommitteeDAO();
            List<Committee> committees = committeeDAO.getAllCommittees();
        %>
        
        <form action="addAssignment" method="post" class="mt-4">
            <div class="mb-3">
                <label for="lecturerId" class="form-label">Giảng viên</label>
                <select id="lecturerId" name="lecturerId" class="form-control" required>
                    <option value="">Chọn Giảng viên</option>
                    <% for (Lecturer lecturer : lecturers) { %>
                    <option value="<%= lecturer.getLecturerId() %>"><%= lecturer.getFullName() %></option>
                    <% } %>
                </select>
            </div>
            <div class="mb-3">
                <label for="committeeId" class="form-label">Hội đồng</label>
                <select id="committeeId" name="committeeId" class="form-control" required>
                    <option value="">Chọn Hội đồng</option>
                    <% for (Committee committee : committees) { %>
                    <option value="<%= committee.getCommitteeId() %>"><%= committee.getCommitteeName() %></option>
                    <% } %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Thêm Phân công</button>
            <a href="assignments.jsp" class="btn btn-secondary">Quay lại</a>
        </form>
    </div>
</body>
</html>
    