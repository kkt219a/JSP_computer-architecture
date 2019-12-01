<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shift2 방식 곱셈 알고리즘</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
int bit = Integer.parseInt(request.getParameter("bit")); //비트
String multiplicand = request.getParameter("multiplicand"); // 피승수
String multiplier = request.getParameter("multiplier"); // 승수
int []seung=new int[bit];

int sign_mnd=multiplicand.charAt(0); // 피승수의 부호
int sign_mer=multiplier.charAt(0); // 승수의 부호

multiplicand="0"+multiplicand.substring(1);
multiplier="0"+multiplier.substring(1);

int[] res = new int[2*bit], res2=new int[2*bit], realres=new int[2*bit];
String result1="",result2="";
String ans1="";
String ans2="";
String aans="";
String young="";
int i=0,j=0,bitex=0,k=0;

int orrim;
for(i=0;i<bit;i++){
	ans1+="0";
	ans2+="0";
	young+="0";
	seung[i]=multiplier.charAt(i)-'0';
}
%>
<body>
	<div style="width:210%; height:100%; overflow:auto">
		<span style="color:blue;"><h2><a href="shift2.jsp">이전화면으로 복귀</a></h2></span><p><p>
		
		<table border="1" >
		<span style="font-size:x-small;">
			<tr><th>단계</th><th>연산과정</th><th>의미</th></tr>
			
			<tr><th>0</th>
			<th align="right"><%=multiplicand %><br>
			*&emsp;
			<%for(i=0;i<bit;i++){%>
				&nbsp;
			<%}%>
			&emsp;
			<%=multiplier %><br>
			<hr><%=ans1%>&emsp;<%=ans2%></th>
			<th align="left">피승수<br>승수<br><br>누적부분곱=0</th></tr>
			
			<%for(i=1,bitex=multiplicand.length()-1;i<=bit;i++,bitex--){%>
				<tr><th><%= i %> </th>
				<th align="right">
				+&emsp;
				<%if((multiplier.charAt(bitex))-'0'== 1){
					result2=multiplicand+young;
				%>
					<%=multiplicand%>
				<%}
				else if((multiplier.charAt(bitex))-'0'== 0){
					result2=young+young;
				%>
					<%=young%>
				<%}%>
				&emsp;
				<%=young%><hr>
				<% 
				result1=ans1+ans2; 
				for(j=0;j<result1.length();j++){
					res[j]=(result1.charAt(j))-'0';
					res2[j]=(result2.charAt(j))-'0';
				}
				for(orrim=0,j--;j>=0;j--){
					realres[j]=res[j]+res2[j]+orrim;
					if(realres[j]>1){
						realres[j]-=2;
						orrim=1;
					}
					else
						orrim=0;
				}
				%>
				<%=orrim%>&emsp;<%
				for(j=0;j<2*bit;j++){
					if(j==bit){%>
						&emsp;
				<%}
				out.print(realres[j]);
				 }%>
				<br><%
				aans=Integer.toString(orrim);
				for(j=0;j<2*bit-1;j++)
					aans+=Integer.toString(realres[j]);

				ans1=aans.substring(0,bit);
				ans2=aans.substring(bit,2*bit);
				%>
				<%=">"%>&emsp;<%=ans1 %>&emsp;<%=ans2 %><br>
				<%
				if(i==bit){%>
					<%=">"%>&emsp;
					<%if(sign_mnd==sign_mer){%>
						<span style="color: red;">0</span>
						<%ans1=ans1.substring(1);
					}
					else{%>
						<span style="color: red;">1</span>
						<%ans1=ans1.substring(1);
					}%>
					<%=ans1 %>&emsp;<%=ans2 %><br>
				<%}
				%>
				
				</th>
				<th align="left">
				<%=multiplicand%>x2^<%=bit%>*
				<%
				for(k=0;k<bit;k++){
					if(k==bitex){%>
						<span style="color: blue;">
					<%}
					else{%>
						<span style="color: gray;">
					<% }%>
					<%=seung[k]%>
					</span>
				<%}
				%>
				<br><br>
				누적 부분곱<br>
				오른쪽 시프트
				<%
				if(i==bit){%>
				→결과<br>
					<%if(sign_mnd==sign_mer){%>
						<span style="color: blue;">피승수와 승수 둘 다 양수이거나 음수임으로, 결과값인 곱은 그대로 양수입니다.</span>
					<%}
					else{%>
						<span style="color: red;">피승수와 승수 둘 중 하나가 음수임으로, 결과값인 곱은 음수로 변환되었습니다.</span>
					<%}
				}%>
				</th></tr>
				
			<%}%>
		</span>	
		</table>
		
	</div>
</body>
</html>