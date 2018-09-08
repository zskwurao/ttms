<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>区域设置</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function doAdd(){
		$('#addStudioWindow').window("open");
	}
	
	function doView(){
            $("#editStudioWindow").window("open");
            $("#editStudioForm").form("load",rowData);
	}
	
	function doDelete(){
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length==0){
            $.messager.alert("提示信息","请选择需要删除的演出厅！","warning");
        }
        else {
            $.messager.confirm("删除确认","你确定要删除选中的演出厅吗？",function(r){
                if(r){
                    var array = new Array();
                    for(var i=0;i<rows.length;i++){
                        var studio = rows[i];//json对象
                        var studio_id = studio.studio_id;
                        array.push(studio_id);
                    }
                    var ids = array.join(",");
                    //alert(ids);
                    location.href="${pageContext.request.contextPath }/studio/deleteStudio.action?ids="+ids;
                }
            });
        }
	}
	
	//工具栏
	var toolbar = [ {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doView
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	}, {
		id : 'button-import',
		text : '导入',
		iconCls : 'icon-redo'
	}];
	// 定义列
	var columns = [ [ {
		field : 'studio_id',
		checkbox : true,
	},{
		field : 'studio_name',
		title : '演出厅名称',
		width : 120,
		align : 'center'
	}, {
		field : 'studio_row_count',
		title : '行数',
		width : 120,
		align : 'center'
	}, {
		field : 'studio_col_count',
		title : '列数',
		width : 120,
		align : 'center'
	}, {
		field : 'studio_introduction',
		title : '简介',
		width : 400,
		align : 'center'
	} ] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 收派标准数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [10,20,50],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/studio/pageQuery.action",
			idField : 'studio_id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改区域窗口
		$('#addStudioWindow').window({
	        title: '添加修改区域',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 300,
	        resizable:false
	    });
		//修改演出厅
        $('#editStudioWindow').window({
            title: '修改区域',
            width: 400,
            modal: true,
            shadow: true,
            closed: true,
            height: 300,
            resizable:false
        });
	});

	function doDblClickRow(rowIndex, rowData){
        $("#editStudioWindow").window("open");
        $("#editStudioForm").form("load",rowData);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="演出厅添加修改" id="addStudioWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addStudioForm" action="${pageContext.request.contextPath }/studio/addStudio.action" method="post">
				<script type="text/javascript">
                    $(function() {
                        $("#save").click(function(){
                            var v = $("#addStudioForm").form("validate");
                            if(v){
                                $("#addStudioForm").submit();
                            }
                        });
                    });
				</script>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">演出厅添加</td>
					</tr>
					<tr>
						<td>演出厅名称</td>
						<td><input type="text" name="studio_name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>行数</td>
						<td><input type="text" name="studio_row_count" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>列数</td>
						<td><input type="text" name="studio_col_count" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>简介</td>
						<td><input type="text" name="studio_introduction" class="easyui-validatebox" required="true"/></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
    <%--修改演出厅--%>
	<div class="easyui-window" title="演出厅添加修改" id="editStudioWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="edit" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>

		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="editStudioForm" action="${pageContext.request.contextPath }/studio/editStudio.action" method="post">
                <input type="hidden" name="studio_id">
                <script type="text/javascript">
                    $(function() {
                        $("#edit").click(function(){
                            var v = $("#editStudioForm").form("validate");
                            if(v){
                                $("#editStudioForm").submit();
                            }
                        });
                    });
				</script>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">演出厅修改</td>
					</tr>
					<tr>
						<td>演出厅名称</td>
						<td><input type="text" name="studio_name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>行数</td>
						<td><input type="text" name="studio_row_count" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>列数</td>
						<td><input type="text" name="studio_col_count" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>简介</td>
						<td><input type="text" name="studio_introduction" class="easyui-validatebox" required="true"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>