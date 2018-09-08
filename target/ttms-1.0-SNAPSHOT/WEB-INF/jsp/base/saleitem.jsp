<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息统计</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/highcharts/highcharts.js"></script>
	<script src="${pageContext.request.contextPath }/js/highcharts/modules/exporting.js" type="text/javascript"></script>
<script type="text/javascript">
	
	function doSearch() {
		/*$('#searchWindow').window("open");*/
    }
	


	
	function doSearch(){
		/*$('#searchWindow').window("open");*/
	}
	

	
	//工具栏
	var toolbar = [ {
        text: '查询日期:<input type="text" name="sale_item_time" class="easyui-linkbutton" required="required"/>',
	},
		{
		id : 'button-search',	
		text : '统计',
		iconCls : 'icon-search',
		handler : doSearch
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',

	}, {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit'
	},{

	}/*,{
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	}*/];
	// 定义列
	var columns = [ [ {
		field : 'sale_item_id',
		checkbox:true,
	},{
		field : 'ticket_id',
		title : '票',
		width : 200,
		align : 'center',
        formatter : function(data,row, index){
		    if(row){
		        return (row.ticket.seat.seat_row+1)+"排"+(row.ticket.seat.seat_column+1)+"座";
			}
        }
	}, {
		field : 'sale_item_price',
		title : '价格',
		width : 200,
		align : 'center',
	},
        {
            field : 'sale_item_time',
            title : '演出时间',
            width : 120,
            align : 'center'
        },{
		field : 'sale_item_status',
		title : '是否付款',
		width : 200,
		align : 'center',
            formatter : function(data,row, index){
                if(data==1){
                    return "已付款";
                }
                else {
                    return "待支付";
				}
            }
	},
        {
            field : 'user_id',
            title : '所属用户',
            width : 200,
            align : 'center',
            formatter : function(data,row, index){
                if(row){
                    return row.user.user_name;
                }

            }
        },
        {
            field : 'play_name',
            title : '影片名称',
            width : 200,
            align : 'center',
            formatter : function(data,row, index){
                if(row){
                    return row.play.play_name;
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
			pageList: [10,20,50],
			pagination : true,
			toolbar :'#tb',

			url : "${pageContext.request.contextPath}/saleitem/pageQuery.action",
			idField : 'sale_item_id',
			columns : columns
		});
		

		
		// 查询定区
		$('#showWindow').window({
	        title: '统计',
	        width: 800,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 800,
	        resizable:false
	    });
		$("#btn").click(function(){
			alert("执行查询...");
		});
		
	});
	function tongji() {
        var timer = $('#riqi').datebox('getValue')
	    console.log(timer);
        $("#showWindow").window("open");
        $.post("${pageContext.request.contextPath}/saleitem/selectListByTime.action ",
			{"sale_item_time":timer},
			function(data){
            	var b = new Array();
                for(var i = 0 ;i<data.length;i++){
                    var a = new Array();
					a.push(data[i].name);
					a.push(data[i].money);
					b.push(a);
                }
                console.log(b);
            $("#test").highcharts({
                title: {
                    text: '统计图'
                },
                series: [{
                    type: 'pie',
                    name: '影片总价',
                    data:b
                }]
            });
        });
    }


</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<%--id : 'button-search',
		text : '统计',
		iconCls : 'icon-search',
		handler : doSearch--%>
	<div id="tb">
		查询日期:<input id="riqi" type="text" name="sale_item_time" class="easyui-datebox" required="required"/>
		<input onclick="tongji()" type="button" class="easyui-linkbutton"  value="统计">

	</div>
	
	<!-- 添加 修改分区 -->

	<div class="easyui-window" title="票房分布图" id="showWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div id="test" split="false" border="false" >
		</div>
	</div>
</body>
</html>