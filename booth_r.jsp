<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booth 방식 곱셈 알고리즘</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
int bit = Integer.parseInt(request.getParameter("bit")); //비트
String multiplicand = request.getParameter("multiplicand"); // 피승수
String multiplier = request.getParameter("multiplier"); // 승수

int []seung=new int[bit];
int []pi=new int[bit];

int[] res = new int[2*bit], res2=new int[2*bit], realres=new int[2*bit];
String result1="",result2="";
String ans1="";
String ans2="";
String aans="";
String young="";
int i=0,j=0,bitex=0,k=0,bitex2=0,t;

int orrim;
for(i=0;i<bit;i++){
	ans1+="0";
	ans2+="0";
	young+="0";
	seung[i]=multiplier.charAt(i)-'0';
	pi[i]=multiplicand.charAt(i)-'0';
}
%>
<body>
	<div style="width:210%; height:100%; overflow:auto">
		<span style="color:blue;"><h2><a href="booth.jsp">이전화면으로 복귀</a></h2></span><p><p>
		
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
			<th align="left">피승수<br>승수<br><br>누적부분곱 초기화 / 추가비트 0</th></tr>
			
			
			<%
			multiplier=multiplier+"0";
			for(i=1,bitex=multiplicand.length()-1;i<=bit;i++,bitex--){%>
				<tr><th><%= i %> </th>
				<th align="right">
				<%if((multiplier.charAt(bitex))== '1'&&multiplier.charAt(bitex+1)== '0'){
					result2="";
				%>
					-&emsp;
					<%for(t=0,j=0;j<=bitex;j++,t++){
						result2+="0";
						out.print("0");
					}
					%><span style="color:blue;"><%
					for(k=0;j<bit;j++,k++,t++){
						result2+=Integer.toString(pi[k]);
						out.print(pi[k]);
					}%>
					&emsp;
					<%for(;k<bit;k++,t++){
						result2+=Integer.toString(pi[k]);
						out.print(pi[k]);
					}
					%></span><%
					for(;t<2*bit;t++){
						result2+="0";
						out.print("0");
					}
					%>
					<hr>
				<%
					result1=ans1+ans2;
				for(j=0;j<result1.length();j++){
					res[j]=(result1.charAt(j))-'0';
					res2[j]=(result2.charAt(j))-'0';
				}
				
				for(orrim=0,j--;j>=0;j--){
					realres[j]=res[j]-res2[j]-orrim;
					if(realres[j]<0){
						realres[j]+=2;
						orrim=1;
					}
					else{
						orrim=0;
					}
				}

				for(j=0;j<2*bit;j++){
					if(j==bit){%>
						&emsp;
				<%}
				out.print(realres[j]);
				 }%>
				<br>
				<%
				aans="";
				for(j=0;j<2*bit;j++){
					aans+=Integer.toString(realres[j]);
				}
				
				ans1=aans.substring(0,bit);
				ans2=aans.substring(bit,2*bit);
				} //if
				
				else if((multiplier.charAt(bitex))== '0'&&multiplier.charAt(bitex+1)== '1'){
					result2="";
				%>
					+&emsp;
					<%for(t=0,j=0;j<=bitex;j++,t++){
						result2+="0";
						out.print("0");
					}
					%><span style="color:blue;"><%
					for(k=0;j<bit;j++,k++,t++){
						result2+=Integer.toString(pi[k]);
						out.print(pi[k]);
					}%>
					&emsp;
					<%for(;k<bit;k++,t++){
						result2+=Integer.toString(pi[k]);
						out.print(pi[k]);
					}
					%></span><%
					for(;t<2*bit;t++){
						result2+="0";
						out.print("0");
					}
					%>
					<hr>
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
					else{
						orrim=0;
					}
				}

				for(j=0;j<2*bit;j++){
					if(j==bit){%>
						&emsp;
				<%}
				out.print(realres[j]);
				 }%>
				<br>
				<%
				aans="";
				for(j=0;j<2*bit;j++){
					aans+=Integer.toString(realres[j]);
				}
				ans1=aans.substring(0,bit);
				ans2=aans.substring(bit,2*bit);
					
				} //elseif
				
				else if(multiplier.charAt(bitex)==multiplier.charAt(bitex+1)){
				%>
					&nbsp;&emsp;
					<%for(t=0,j=0;j<=bitex;j++,t++){
						out.print("0");
					}
					%><span style="color:blue;"><%
					for(k=0;j<bit;j++,k++,t++){
						out.print("0");
					}%>
					&emsp;
					<%for(;k<bit;k++,t++){
						out.print("0");
					}
					%></span><%
					for(;t<2*bit;t++){
						out.print("0");
					}
					%>
					<hr>
				<%out.print(ans1);%>
				&emsp;
				<%out.print(ans2);
				}%>
				
				</th>
				<th align="left">
				<%
				for(k=0;k<=bit;k++){
					if(k==bitex||k-1==bitex){%>
						<span style="color: blue;">
					<%}
					else{%>
						<span style="color: gray;">
					<% }
					if(k!=bit){%>
					<%=pi[k]%>
					<%}
					else{%>
					0
					<%} %>
					</span>
				<%}
				%>
				
				이므로<%
				if((multiplier.charAt(bitex))=='1'&&multiplier.charAt(bitex+1)=='0'){
					out.print(" 피승수를 빼고");
				}
				else if((multiplier.charAt(bitex))=='0'&&multiplier.charAt(bitex+1)=='1'){
					out.print(" 피승수를 더하고");
				}%>
				<br><br>피승수를 왼쪽 시프트
				<%
				if(i==bit){
					%>및 모든 과정 종료. 즉, <span style="color:red;">결과값</span><%
				}
				%>
				</th></tr>
				<%}%>
		</span>	
		</table>
		
	</div>
</body>
</html>