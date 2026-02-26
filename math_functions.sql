-- 1. ABS() → Absolute value: remove negativity
SELECT ABS(-25) AS abs_value;

-- 2. CEIL() or CEILING() → Smallest integer greater than or equal
SELECT CEIL(12.3) AS ceil_value;

-- 3. FLOOR() → Largest integer less than or equal
SELECT FLOOR(12.8) AS floor_value;

-- 4. ROUND() → Round a number 
SELECT ROUND(12.567358, 2) AS rounded_value; -- 12.57

-- 5. TRUNCATE() → Truncate (cut off) decimal places
SELECT TRUNCATE(12.567358, 2) AS truncated_value; -- 12.56

-- 6. MOD() → Modulus (remainder of division)
SELECT MOD(29, 5) AS modulus_value;

-- 7. POWER() → Power (exponentiation)
SELECT POWER(3, 4) AS power_value;

-- 8. SQRT() → Square Root
SELECT SQRT(81) AS square_root;

-- 9. EXP() → Exponential (e raised to the power of given number)
SELECT EXP(4) AS exponential_value;
-- e= (2.718)4
-- euler's number = e=2.718

-- 10. LOG() → Natural Logarithm (base e)
SELECT LOG(10) AS natural_log;

select power(2.718,2.302585092994046);

-- 11. LOG10() → Logarithm base 10
SELECT LOG10(1000) AS log10_value;

-- 12. PI() → Value of Pi
SELECT PI() AS pi_value;

-- 13. RADIANS() → Degrees to Radians
SELECT RADIANS(180) AS radians_value;

-- 360 degree = 2*pi()=> 2* 3.14
-- 180 degree = PI() => 3.14

-- 14. DEGREES() → Radians to Degrees
SELECT DEGREES(2*PI()) AS degrees_value;

-- 15. RAND() → GENERATE A Random Number between 0 and 1
SELECT RAND() AS random_number;

-- 16. SIGN() → Returns -1, 0, or 1 depending on number
SELECT SIGN(-15) AS sign_value;-- RETURNS -1

SELECT SIGN(15) AS sign_value; -- RETURNS +1

SELECT SIGN(0) AS sign_value; -- RETURNS 0

-- 17. GREATEST() → Maximum value among a list
SELECT GREATEST(10, 50, 20, 5) AS greatest_value;

-- 18. LEAST() → Minimum value among a list
SELECT LEAST(10, 50, 20, 5) AS least_value;




