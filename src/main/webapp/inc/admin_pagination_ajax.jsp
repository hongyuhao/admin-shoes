<%@ page language="java" pageEncoding="utf-8"%>

<div class="panelBar">
	<div class="pages">
		<span>显示</span>
		<select name="numPerPage" id="numPerPage${rel }" onchange="tabPageBreak({numPerPage:this.value}, '${targetTab }')">
			<option value="20">20</option>
			<option value="50">50</option>
			<option value="100">100</option>
			<option value="200">200</option>
		</select>
		
		<script type="text/javascript">
			$('#numPerPage${rel}').val("${pageTurn.pageSize}");
		</script>
		<span>条，共${pageTurn.rowCount}条</span>
	</div>
	<div class="pagination" totalCount="${pageTurn.rowCount }" numPerPage="${pageTurn.pageSize }" rel="${targetTab }" pageNumShown="10" currentPage="${pageTurn.page }"></div>
</div>
