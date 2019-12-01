<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booth 방식 곱셈 알고리즘</title>
</head>
<body>

	<div align="center">
			<form method="post" action="booth_r.jsp">
			<fieldset style="background:#819ff7" >
			<span style="font-family:맑은 고딕;">
			<h1>Booth  방식 알고리즘</h1>
			
				이 Booth 방식의 알고리즘은 각 비트수에 맞는 승수와 피승수를 입력하여야 합니다.<br>
				ex) 4비트라면 승수와 피승수는 4자리<br>
				아울러, 최상위 비트는 부호비트이니 참고바랍니다.<br>
				<span style="color:red;">아울러 표준화를 위해 2의보수형식 이진수를 입력 해주시기 바랍니다.</span><br>
				ex) 4비트로 표현가능한 수: -8 ~ +7<br><p>
				&nbsp;&nbsp;&nbsp;
				비트: <input type="text" name="bit"/><p>
				피승수: <input type="text" name="multiplicand"/><p>
				&nbsp;&nbsp;&nbsp;
				승수: <input type="text" name="multiplier"/><p>
			<input type="submit" value="결과 확인"/>
			</fieldset>
			</span>
			</form>
		
	</div>
</body>
</html>
