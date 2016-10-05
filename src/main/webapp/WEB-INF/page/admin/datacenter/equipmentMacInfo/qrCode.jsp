<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<div class="pageContent">
		<div class="pageFormContent" layoutH="57" align="left">
			<c:if test="${empty macInfo.imgUrl }">
				暂无图片。
			</c:if>
			<c:if test="${not empty macInfo.imgUrl }">
				<img alt="" src="${macInfo.imgUrl }" />
			</c:if>
		</div>
</div>