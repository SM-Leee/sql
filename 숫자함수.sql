-- ABS(x) : x의 절대값을 구한다.
select abs(10), abs(-10);

-- MOD(n,m) : n을 m으로 나눈 나머지 값을 출력한다.
select mod(234, 10), 254 % 10;

-- FLOOR(x) : x보다 크지 않는 가장 큰 정수를 반환한다. BIGINT로 자동 변환됨.
select floor(1.23),floor(-1.23);

-- CEILING(x) : x보다 작지 않은 가장 작은 정수를 반환한다.
select ceiling(1.23), ceiling(-1.23), ceil(1.23), ceil(-1.23);

-- ROUND(x) : x에 가장 근접한 정수를 반환한다.(반올림)
select round(-1.23), round(-1.58), round(1.58);

-- ROUND(x,d) : x값 중에서 소수점 d 자리에 가장 근접한 수로 반환한다. ( 어디서 반올림할지 지정하여 반올림한다)
select round(1.298,1), round(1.298,0);

-- POW(x,y), POWER(x,y) : x의 y 제곱 승을 반환한다.
select pow(2,2), power(2,2), power(2,-2);

-- SIGN(x) : x=음수이면 -1을, x=0이면 0을, x=양수이면 1을 출력한다.
select sign(-32), sign(0), sign(34);

-- GREATEST(x,y,...) : 가장 큰값을 반환한다.
select greatest(5,4,3,2,1,7,6,2,3), greatest(3.14, 5.16,5.8,9.9), greatest("B","A","C","D","ABC","ARFD");

-- LEAST(x,y,...) : 가장 작은 값을 반환한다.
select least(5,4,3,2,1,7,6,2,3), least(3.14, 5.16,5.8,9.9), least("B","A","C","D","ABC","ARFD");
