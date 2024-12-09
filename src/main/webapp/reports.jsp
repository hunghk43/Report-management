<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ReportDAO" %>
<%@ page import="model.Report" %>
<%@ page import="model.Student" %>
<%@ page import="model.Committee" %>
<%@ page import="java.util.List" %>
<%
    ReportDAO reportDAO = new ReportDAO();
    List<Report> reports = reportDAO.getAllReports();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Báo cáo Sinh viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Danh sách Báo cáo Sinh viên</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Mã Báo cáo</th>
                    <th>Sinh viên</th>
                    <th>Hội đồng</th>
                    <th>Chủ đề Báo cáo</th>
                    <th>Ngày nộp</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <% for (Report report : reports) { %>
                    <tr>
                        <td><%= report.getReportId() %></td>
                        <td><%= report.getStudent().getFullName() %></td>
                        <td><%= report.getCommittee().getCommitteeName() %></td>
                        <td><%= report.getReportTopic() %></td>
                        <td><%= report.getSubmissionDate() %></td>
                        <td>
                            <a href="editReport.jsp?id=<%= report.getReportId() %>" class="btn btn-warning btn-sm">Chỉnh sửa</a>
                            <a href="deleteReport?id=<%= report.getReportId() %>" class="btn btn-danger btn-sm">Xóa</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
         <a href="addReport.jsp" class="btn btn-success">Thêm Báo cáo</a>
    </div>
</body>
</html>