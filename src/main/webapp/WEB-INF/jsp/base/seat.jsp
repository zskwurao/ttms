<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理分区</title>
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
		$('#addSeatWindow').window("open");
	}
	
	function doEdit(){
		alert("修改...");
	}
	
	function doDelete(){
		//alert("删除...");
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length==0){
            $.messager.alert("提示信息","请选择需要删除的演出厅！","warning");
        }
        else {
            $.messager.confirm("删除确认","你确定要删除选中的演出厅吗？",function(r){
                if(r){
                    var array = new Array();
                    for(var i=0;i<rows.length;i++){
                        var seat = rows[i];//json对象
                        var seat_id = seat.seat_id;
                        array.push(seat_id);
                    }
                    var ids = array.join(",");
                    //alert(ids);
                    location.href="${pageContext.request.contextPath }/seat/deleteSeat.action?ids="+ids;
                }
            });
        }
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doExport(){
		alert("导出");
	}
	
	function doImport(){
		alert("导入");
	}
	
	//工具栏
	var toolbar = [
 {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doEdit
	},{
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	},{
		id : 'button-import',
		text : '导入',
		iconCls : 'icon-redo',
		handler : doImport
	},{
		id : 'button-export',
		text : '导出',
		iconCls : 'icon-undo',
		handler : doExport
	}];
	// 定义列
	var columns = [ [ {
		field : 'seat_id',
		checkbox : true,
	}, {
		field : 'seat_row',
		title : '行号',
		width : 120,
		align : 'center'

	},{
		field : 'seat_column',
		title : '列号',
		width : 120,
		align : 'center'

	},
        {
            field : 'seat_status',
            title : '状态',
            width : 120,
            align : 'center',
            formatter : function(data,row, index){
                if(data=="1"){
                    return "存在";
                }
                else{
                    return "座位不存在";
                }
            }
        },
        {
            field : 'studio_name',
            title : '所属演出厅',
            width : 120,
            align : 'center',
            formatter : function(data,rows, index){
                if(rows){
                    return rows.studio.studio_name;
                }
                else{
                    return "";
                }
            }
        }
	] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 收派标准数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : true,
			rownumbers : true,
			striped : true,
			pageList: [30,50,100],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/seat/pageQuery.action",
			idField : 'seat_id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改分区
		$('#addSeatWindow').window({
	        title: '添加座位',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		// 查询分区
		$('#editSeatWindow').window({
	        title: '修改座位',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		$("#btn").click(function(){
			alert("执行查询...");
		});
		
	});

    function doDblClickRow(rowIndex, rowData){
        $("#editSeatWindow").window("open");
        $("#editSeatForm").form("load",rowData);
    }
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<!-- 添加 修改分区 -->
	<div class="easyui-window" title="添加座位" id="addSeatWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div style="overflow:auto;padding:5px;" border="false">
			<form id ="addSeatForm" action="${pageContext.request.contextPath}/seat/addSeat.action" method="post">
				<script type="text/javascript">
                    $(function() {
                        $("#save").click(function(){
                            var v = $("#addSeatForm").form("validate");
                            if(v){
                                $("#addSeatForm").submit();
                            }
                        });
                    });
				</script>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">座位信息</td>
					</tr>


					<tr>
						<td>行号</td>
						<td><input type="text" name="seat_row" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>列号</td>
						<td><input type="text" name="seat_column" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" name="seat_status" value="1" />
							是否存在此座位</td>
					</tr>
					<tr>
						<td>选择演出厅</td>
						<td>
							<input class="easyui-combobox" name="studio_id"
								   data-options="valueField:'studio_id',textField:'studio_name',url:'${pageContext.request.contextPath}/studio/listAjax.action'" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<div class="easyui-window" title="修改座位" id="editSeatWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="edit" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>

		<div style="overflow:auto;padding:5px;" border="false">
			<form id ="editSeatForm" action="${pageContext.request.contextPath}/seat/editSeat.action" method="post">
				<input type="hidden" name="seat_id">
				<script type="text/javascript">
                    $(function() {
                        $("#edit").click(function(){
                            var v = $("#editSeatForm").form("validate");
                            if(v){
                                $("#editSeatForm").submit();
                            }
                        });
                    });
				</script>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">座位信息</td>
					</tr>


					<tr>
						<td>行号</td>
						<td><input type="text" name="seat_row" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>列号</td>
						<td><input type="text" name="seat_column" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" name="seat_status" value="1" />
							是否存在此座位</td>
					</tr>
					<tr>
						<td>选择演出厅</td>
						<td>
							<input class="easyui-combobox" name="studio_id"
								   data-options="valueField:'studio_id',textField:'studio.studio_name',url:'${pageContext.request.contextPath}/studio/listAjax.action'" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>
</html>