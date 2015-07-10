<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>calculator</title>
<style type="text/css">
	.txt{
		text-align:right;
		font-size: 15px;
		font-weight: bold;
		
	}
</style>
</head>
	<script type="text/javascript">
		function number(su){
			document.calcfrm.result.value = Number(document.calcfrm.result.value+su);
			document.calcfrm.stc.value=document.calcfrm.stc.value+su;
		}
		
		function cls(){
			document.calcfrm.result.value = 0;
			document.calcfrm.stc.value="";
		}
		
		var num1,num2;
		var op;
		
		function calc(){
			num2 = Number(document.calcfrm.result.value);
			var an=0;
			switch(op){
			case '+' : an = num1+num2; break;
			case '-' : an = num1-num2; break;
			case '*' : an = num1*num2; break;
			case '/' : an = num1/num2; break;
			case '^' : an = num1*num1; break;
			case 'sin' : an = Math.sin(num1); break;
			case 'cos' : an = Math.cos(num1); break;
			case 'tan' : an = Math.tan(num1); break;
			
			}
			document.calcfrm.result.value = an;
		}
		
		function operator(ch){
			op = ch;
			num1 = Number(document.calcfrm.result.value);
			document.calcfrm.stc.value=document.calcfrm.stc.value+op;
			if(ch=='+' || ch=='-' || ch=='*' || ch=='/'){		
				document.calcfrm.result.value = 0;
			}
			
		}
	
	</script>
<body>
	<form name="calcfrm">
		<table border=1 cellspacing="0" >
			<tr>
				<td colspan=4><input type="text" value="" name="stc" class="txt" size=23 readonly></td>
			</tr>
			<tr>
				<td colspan=4><input type="text" value="0" name="result" class="txt" size=23 readonly></td>
			</tr>
			<tr>
				<td><input type="button" value="  7  " onclick="number(7)"></td>
				<td><input type="button" value="  8  " onclick="number(8)"></td>
				<td><input type="button" value="  9  " onclick="number(9)"></td>
				<td><input type="button" value="  /  " onclick="operator('/')"></td>
				
			</tr>
			<tr>
				<td><input type="button" value="  4  " onclick="number(4)" ></td>
				<td><input type="button" value="  5  " onclick="number(5)" ></td>
				<td><input type="button" value="  6  " onclick="number(6)"></td>
				<td><input type="button" value="  *  " onclick="operator('*')"></td>
				
			</tr>
			<tr>
				<td><input type="button" value="  1  " onclick="number(1)"></td>
				<td><input type="button" value="  2  " onclick="number(2)"></td>
				<td><input type="button" value="  3  " onclick="number(3)"></td>
				<td><input type="button" value="  -  " onclick="operator('-')"></td>
				
			</tr>
			<tr>
				<td><input type="button" value="  0  " onclick="number(0)"></td>
				<td><input type="button" value="  C  " onclick="cls()"></td>
				<td><input type="button" value="  =  " onclick="calc()"></td>
				<td><input type="button" value="  +  " onclick="operator('+')"></td>
				
			</tr>
			<tr>
				<td><input type="button" value="  ^  " onclick="operator('^')"></td>
				<td><input type="button" value=" sin " onclick="operator('sin')"></td>
				<td><input type="button" value=" cos " onclick="operator('cos')"></td>
				<td><input type="button" value=" tan " onclick="operator('tan')"></td>
			</tr>
		</table>
	
	</form>
</body>
</html>