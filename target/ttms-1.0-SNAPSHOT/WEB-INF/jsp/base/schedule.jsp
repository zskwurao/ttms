<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>演出计划管理</title>
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
		$('#addSchedWindow').window("open");
	}
	
	function doEdit(){
		alert("修改...");
	}
	
	function doDelete(){
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length==0){
            $.messager.alert("提示信息","请选择需要删除的演出计划！","warning");
        }
        else {
            $.messager.confirm("删除确认","你确定要删除选中的演出计划吗？",function(r){
                if(r){
                    var array = new Array();
                    for(var i=0;i<rows.length;i++){
                        var seat = rows[i];//json对象
                        var sched_id = seat.sched_id;
                        array.push(sched_id);
                    }
                    var ids = array.join(",");
                    //alert(ids);
                    window.location.href="${pageContext.request.contextPath}/schdule/deleteSchedule.action?ids="+ids;
                }
            });
        }
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doAssociations(){
		$('#customerWindow').window('open');
	}
	
	//工具栏
	var toolbar = [ {
		id : 'button-search',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doSearch
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doEdit
	}/*,{
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	}*/];
	// 定义列
	var columns = [ [ {
		field : 'sched_id',
		checkbox:true,
	},{
		field : 'studio.studio_id',
		title : '演出厅',
		width : 200,
		align : 'center',
        formatter : function(data,row, index){
		    if(row){
		        return row.studio.studio_name;
			}
        }
	}, {
		field : 'play_id',
		title : '剧目名称',
		width : 200,
		align : 'center',
        formatter : function(data,row, index){
            if(row){
                return row.play.play_name;
            }
        }
	},
        {
            field : 'sched_time',
            title : '演出时间',
            width : 120,
            align : 'center'
        },{
		field : 'sched_ticket_price',
		title : '票价',
		width : 200,
		align : 'center',

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
			pageList: [10,20,50],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/schedule/pageQuery.action",
			idField : 'sched_id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改定区
		$('#addSchedWindow').window({
	        title: '安排演出计划',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		// 查询定区
		$('#searchWindow').window({
	        title: '查询定区',
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

	function doDblClickRow(){

	}

</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>

	
	<!-- 添加 修改分区 -->
	<div class="easyui-window" title="添加演出计划" id="addSchedWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="addSchedForm" action="${pageContext.request.contextPath}/schedule/addSched.action" method="post">
				<script type="text/javascript">
                    $(function() {
                        $("#save").click(function(){
                            var v = $("#addSchedForm").form("validate");
                            if(v){
                                $("#addSchedForm").submit();
                            }
                        });
                    });
				</script>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">演出计划</td>
					</tr>
					<tr>
						<td>演出厅</td>
						<td><input class="easyui-combobox" name="studio_id"
								   data-options="valueField:'studio_id',textField:'studio_name',url:'${pageContext.request.contextPath}/studio/listAjax.action'" /></td>
					</tr>
					<tr>
						<td>剧目</td>
						<td><input class="easyui-combobox" name="play_id"
								   data-options="valueField:'play_id',textField:'play_name',url:'${pageContext.request.contextPath}/play/listAjax.action'" /></td></td>
					</tr>
					<tr>
						<td>演出时间</td>
						<td>

							<input type="text" name="sched_time" class="easyui-datetimebox" required="required">
						</td>
					</tr>
					<tr>
						<td>票价</td>
						<td>

							<input type="text" name="sched_ticket_price" class="easyui-validatebox" required="required">
						</td>
					</tr>
				</table>
			</form>
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
	

</body>
</html>