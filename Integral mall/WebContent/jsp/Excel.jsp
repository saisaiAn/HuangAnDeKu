<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ysnidongma.css">
        <link href="${pageContext.request.contextPath}/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gc.spread.sheets.excel2013white.11.2.2.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/gc.spread.sheets.all.11.2.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/FileSaver.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/gc.spread.excelio.11.2.2.min.js" type="text/javascript" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/gc.spread.sheets.charts.11.2.2.min.js" type="text/javascript" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/gc.spread.sheets.resources.zh.11.2.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/excel_data.js" type="text/javascript"></script>

<title>Excel</title>
<style type="text/css">
.sample-tutorial {
     position: relative;
     height: 100%;
     overflow: hidden;
}

.sample-spreadsheets {
    width: calc(100% - 280px);
    height: 100%;
    overflow: hidden;
    float: left;
}

.options-container {
    float: right;
    width: 280px;
    padding: 12px;
    height: 100%;
    box-sizing: border-box;
    background: #fbfbfb;
    overflow: auto;
}

.sample-options {
    z-index: 1000;
}

.inputContainer {
    width: 100%;
    height: auto;
    border: 1px solid #eee;
    padding: 6px 12px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

.input {
    font-size: 14px;
    height: 20px;
    border: 0;
    outline: none;
    background: transparent;
}

.button {
    height: 30px;
    padding: 6px 12px;
    width: 80px;
    margin-top: 6px;
}

.group {
    padding: 12px;
}

.group input {
    padding: 4px 12px;
}
</style>
</head>

<body>
<script type="text/javascript">
		/* window.onload = function () {
		    var spread = new GC.Spread.Sheets.Workbook(document.getElementById('ss'), { sheetCount: 1 });
		}; */
</script>
<script type="text/javascript">
$(document).ready(function () {
	//var type = new GC.Spread.Sheets.Style();
    //var spread = new GC.Spread.Sheets.Workbook(document.getElementById("ss"));
	/* var sheet = spread.getSheet(0);
	type.cellPadding="20";
	var dateSource=${Excel};
	sheet.setDataSource(dateSource);  */
	//sheet.setDefaultStyle(type);
	/* sheet.setColumnWidth(0, 180);
	sheet.setColumnWidth(1, 180);
	sheet.setColumnWidth(2, 180);
	var sheets = spread.getActiveSheet();
	sheets.defaults.colWidth = 90;
	sheets.defaults.colHeaderRowHeight = 30;
	sheets.defaults.rowHeight = 30;
	sheets.defaults.rowHeaderColWidth = 60; */
	/* $.getJSON(${Excel}, function (data) {
        var str = '';
        var arr = data.event;
        for (var i = 0; i < arr.length; i++) {
            str += "<tr>";
            str += '<td>' + arr[i].分数 + "</td>";
            str += '<td>' + arr[i].制度详情 + "</td>";
            str += "</tr>";
        }
        $('#tb').html(str);
    }); */
	/* var type = new GC.Spread.Sheets.Style();
	type.watermark = "User name";
	type.cellPadding = "20";
	type.labelOptions = {alignment:GC.Spread.Sheets.LabelAlignment.topLeft, visibility: GC.Spread.Sheets.LabelVisibility.visible};
	activeSheet.setStyle(0, 1, type);
	activeSheet.getRange(0, -1, 1, -1, GC.Spread.Sheets.SheetArea.viewport).height(60);
	activeSheet.getRange(-1, 1, -1, 1).width(150);
	var combo = new GC.Spread.Sheets.CellTypes.ComboBox();
	combo.items([{ text: "Oranges", value: "11k" }, { text: "Apples", value: "15k" }, { text: "Grape", value: "100k" }]);
	combo.editorValueType(GC.Spread.Sheets.CellTypes.EditorValueType.text);
	activeSheet.setCellType(2, 1, combo, GC.Spread.Sheets.SheetArea.viewport);
	activeSheet.getCell(2, 1, GC.Spread.Sheets.SheetArea.viewport).watermark("ComboBox Cell Type").cellPadding('10 10 20 10');
	activeSheet.getCell(2, 1, GC.Spread.Sheets.SheetArea.viewport).labelOptions({alignment: GC.Spread.Sheets.LabelAlignment.bottomCenter, foreColor: 'yellowgreen', font: 'bold 15px Arial'});
	activeSheet.getRange(2, -1, 1, -1, GC.Spread.Sheets.SheetArea.viewport).height(60); */
	
    //var excelIo = new GC.Spread.Excel.IO();
    //var sheet = spread.getActiveSheet();
  /*   $("#loadExcel").click(function () {
        var excelFile = document.getElementById("fileDemo").files[0];
        var password = $("#password").val();
        // here is excel IO API
        excelIo.open(excelFile, function (json) {
            var workbookObj = json;
            spread.fromJSON(workbookObj);
        }, function (e) {
            // process error
            alert(e.errorMessage);
            if (e.errorCode === 2/*noPassword*/  /* || e.errorCode === 3 /*invalidPassword*//*) {
                $("#password").select();
            }
        }, {password: password});
    }); */
/*     $("#saveExcel").click(function () {

        var fileName = $("#exportFileName").val();
        var password = $("#password").val();
        if (fileName.substr(-5, 5) !== '.xlsx') {
            fileName += '.xlsx';
        }

        var json = spread.toJSON();

        // here is excel IO API
        excelIo.save(json, function (blob) {
            saveAs(blob, fileName);
        }, function (e) {
            // process error
            console.log(e);
        }, {password: password});

    }); */
});
</script>
<!-- <div class="sample-tutorial" style="width: 100%;">
    <div id="ss" class="sample-spreadsheets" style="width: 100%;"></div>
    <div class="options-container">
        <div class="option-row">
            <div class="inputContainer">
                <input type="file" id="fileDemo" class="input">
                <input type="button" id="loadExcel" value="import" class="button">
            </div>
            <div class="inputContainer">
                <input id="exportFileName" value="export.xlsx" class="input">
                <input type="button" id="saveExcel" value="export" class="button">
            </div>
        </div>
        <div class="option-row">
            <div class="group">
                <label>Password:
                    <input type="password" id="password">
                </label>
            </div>
        </div>
    </div>
</div> -->
<table class="table table-striped table-bordered table-hover tabemp" id="sample-table">
      <thead>
		 <tr>
          <th width="50%">考核详情</th>
          <th width="50%">考核积分</th>
         </tr>
      </thead>
	<tbody>
		 <c:forEach items="${ExcelTwo}" var="u">
			<tr>
		      <td>${u.systemDetails}</td>
		      <td>${u.systemIntegral}</td>
		    </tr>
		 </c:forEach> 
        </tbody>
     </table>
      <a href="${pageContext.request.contextPath}/integral/Integral_Review.action" id="administrator_add" style="float: right;" class="btn btn-warning"> 返回上一级</a>
</body>
</html>

