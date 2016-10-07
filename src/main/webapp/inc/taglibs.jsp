<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String absoluteDir = request.getSession().getServletContext().getRealPath("/");
    request.setAttribute("ABSOLUTE_DIR", absoluteDir);
%>

