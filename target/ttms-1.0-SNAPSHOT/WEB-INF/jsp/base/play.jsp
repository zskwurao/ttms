<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

		$('#addPlayWindow').window("open");
	}
	
	function doView(){
		alert("查看...");
	}
	
	function doDelete(){
        var rows = $("#grid").datagrid("getSelections");
       // alert(rows.length);
        if(rows.length == 0){
            //没有选中记录，弹出提示
            $.messager.alert("提示信息","请选择需要删除的剧目！","warning");
        }else{
            //选中了取派员,弹出确认框
            $.messager.confirm("删除确认","你确定要删除选中的剧目吗？",function(r){
                if(r){

                    var array = new Array();
                    //确定,发送请求
                    //获取所有选中的取派员的id
                    for(var i=0;i<rows.length;i++){
                        var play = rows[i];//json对象
                        var play_id = play.play_id;
                        array.push(play_id);
                    }
                    var ids = array.join(",");
                    //alert(ids);
                    location.href="${pageContext.request.contextPath }/play/deletePlay.action?ids="+ids;
                }
            });
        }
	}
	
	function doRestore(){
        $("#editPlayWindow").window("open");
        $("#editPlayForm").form("load",rowData);
	}
	//工具栏
	var toolbar = [ {
		id : 'button-view',	
		text : '查询',
		iconCls : 'icon-search',
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
	},{
		id : 'button-save',
		text : '修改',
		iconCls : 'icon-save',
		handler : doRestore
	}];
	// 定义列
	var columns = [ [ {
		field : 'play_id',
		checkbox : true
	},
        {
            field : 'play_type_id',
            title : '剧目类型',
            width : 120,
            align : 'center',
            formatter : function(data,row, index){
                if(data=="1"){
                    return "爱情";
                }
                else{
                    return "动作";
                }
            }
        },
        {
            field : 'play_lang_id',
            title : '剧目语言',
            width : 120,
            align : 'center',
            formatter : function(data,row, index){
                if(data=="3"){
                    return "中文";
                }
                else{
                    return "英文";
                }
            }
        },
		{
		field : 'play_name',
		title : '剧目名称',
		width : 120,
		align : 'center'
	},
        {
            field : 'play_image',
            title : '图片',
            width : 120,
            align : 'center',
            formatter:function(value,row,index){
                return '<img src="${pageContext.request.contextPath}/'+row.play_image+'" style="display:block;width:110px;height:50px;align:center" />';
            }

        },
        {
            field : 'play_ticket_price',
            title : '影片价格',
            width : 120,
            align : 'center'
        },
		{
		field : 'play_status',
		title : '是否上映',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="1"){
				return "正在热映";
			}
			else{
                return "敬请期待";
			}
		}
	},
     {
         field : 'play_director',
             title : '导演',
         width : 120,
         align : 'center'
     },
        {
            field : 'play_actor',
            title : '主演',
            width : 120,
			colspan:2,
            align : 'center'
        },
        {
            field : 'play_shortintro',
            title : '影片简介',
            width : 120,
            align : 'center'
        }
    ] ];

	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 剧目信息表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [10,20,50],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/play/pageQuery.action",
			idField : 'play_id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加取派员窗口
		$('#addPlayWindow').window({
	        title: '添加剧目',
	        width: 500,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
        $('#editPlayWindow').window({
            title: '修改剧目',
            width: 500,
            modal: true,
            shadow: true,
            closed: true,
            height: 450,
            resizable:false
        });
		
	});

	function doDblClickRow(rowIndex, rowData){
	    $("#editPlayWindow").window("open");
	    $("#editPlayForm").form("load",rowData);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="对剧目进行添加或者修改" id="addPlayWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">

		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form action="${pageContext.request.contextPath}/play/addplay.action" method="post">
				<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
					<div class="datagrid-toolbar">
						<input id = "save" icon="icon-save" class="easyui-linkbutton" plain="true" type="submit" value="保存" style="border: none"/>
						<%--<a id="save" icon="icon-save" href="${pageContext.request.contextPath}/play/addplay.action" class="easyui-linkbutton" plain="true" >保存</a>--%>
					</div>
				</div>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">剧目信息</td>
					</tr>
					<tr>
						<td>剧目类型</td>
						<td> <input class="easyui-combobox" name="play_type_id"
							   data-options="valueField:'dict_id',textField:'dict_value',url:'${pageContext.request.contextPath}/base/listAjax.action?dict_parent_id='+'1'" /></td>
					</tr>
					<tr>
						<td>剧目语言</td>
						<td><input class="easyui-combobox" name="play_lang_id"
								   data-options="valueField:'dict_id',textField:'dict_value',url:'${pageContext.request.contextPath}/base/listAjax.action?dict_parent_id='+'2'" /></td>
					</tr>
					<tr>
						<td>剧目名</td>
						<td><input type="text" name="play_name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>剧目介绍</td>
						<td><input type="text" name="play_introduction" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>图片</td>
						<td><input type="text" name="play_image" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>影片时长</td>
						<td><input type="text" name="play_length" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>票价</td>
						<td><input type="text" name="play_ticket_price" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>

						<td colspan="2">
							<input type="checkbox" name="play_status" value="1" />
							是否上映</td>
					</tr>
					<tr>
						<td>导演</td>
						<td><input type="text" name="play_director" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>主演</td>
						<td><input type="text" name="play_actor" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>影片简介</td>
						<td><input type="text" name="play_shortintro" class="easyui-validatebox" required="true"/></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
    <div class="easyui-window" title="对剧目进行修改" id="editPlayWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">


        <div region="center" style="overflow:auto;padding:5px;" border="false">
            <form id="editPlayForm" action="${pageContext.request.contextPath}/play/editplay.action" method="post">
                <input type="hidden" name="play_id">
                <div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
                    <div class="datagrid-toolbar">
                        <input id = "save" icon="icon-save" class="easyui-linkbutton" plain="true" type="submit" value="保存" style="border: none"/>
                        <%--<a id="save" icon="icon-save" href="${pageContext.request.contextPath}/play/addplay.action" class="easyui-linkbutton" plain="true" >保存</a>--%>
                    </div>
                </div>
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="2">剧目信息</td>
                    </tr>
                    <tr>
                        <td>剧目类型</td>
                        <td> <input class="easyui-combobox" name="play_type_id"
                                    data-options="valueField:'dict_id',textField:'dict_value',url:'${pageContext.request.contextPath}/base/listAjax.action?dict_parent_id='+'1'" /></td>
                    </tr>
                    <tr>
                        <td>剧目语言</td>
                        <td><input class="easyui-combobox" name="play_lang_id"
                                   data-options="valueField:'dict_id',textField:'dict_value',url:'${pageContext.request.contextPath}/base/listAjax.action?dict_parent_id='+'2'" /></td>
                    </tr>
                    <tr>
                        <td>剧目名</td>
                        <td><input type="text" name="play_name" class="easyui-validatebox" required="true"/></td>
                    </tr>

                    <tr>
                        <td>票价</td>
                        <td><input type="text" name="play_ticket_price" class="easyui-validatebox" required="true"/></td>
                    </tr>
                    <tr>

                        <td colspan="2">
                            <input type="checkbox" name="play_status" value="1" />
                            是否上映</td>
                    </tr>
                    <tr>
                        <td>导演</td>
                        <td><input type="text" name="play_director" class="easyui-validatebox" required="true"/></td>
                    </tr>
                    <tr>
                        <td>主演</td>
                        <td><input type="text" name="play_actor" class="easyui-validatebox" required="true"/></td>
                    </tr>
                    <tr>
                        <td>影片简介</td>
                        <td><input type="text" name="play_shortintro" class="easyui-validatebox" required="true"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>	