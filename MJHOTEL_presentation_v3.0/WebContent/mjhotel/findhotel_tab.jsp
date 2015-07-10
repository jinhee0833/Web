<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>findhotel_tab</title>
<script src="mjhotel/css/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="mjhotel/css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Korea</li>
    <li class="TabbedPanelsTab" tabindex="0">USA</li>
    <li class="TabbedPanelsTab" tabindex="0">Russia</li>
    <li class="TabbedPanelsTab" tabindex="0">China</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent"><jsp:include page="../mjhotel/korea.jsp" flush="false" /></div>
    <div class="TabbedPanelsContent"><jsp:include page="../mjhotel/usa.jsp" flush="false" /></div>
    <div class="TabbedPanelsContent"><jsp:include page="../mjhotel/russia.jsp" flush="false" /></div>
    <div class="TabbedPanelsContent"><jsp:include page="../mjhotel/china.jsp" flush="false" /></div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1", {defaultTab:0});
</script>
</body>
</html>

