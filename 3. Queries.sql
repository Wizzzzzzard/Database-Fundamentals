SELECT  UNIT_NUMBER, MAX(FLOOR_AREA), MIN(FLOOR_AREA)
FROM UNIT, SITE
WHERE UNIT.SITE_NUMBER = SITE.SITE_NUMBER
AND FLOOR_AREA > 50
GROUP BY UNIT_NUMBER
;


SELECT UNIT_ID, UNIT_NUMBER, FLOOR_AREA, ZONE, SITE_NUMBER
FROM UNIT
WHERE FLOOR_AREA > (SELECT AVG(FLOOR_AREA)
FROM UNIT)
;

SELECT *
FROM UNIT
WHERE FLOOR_AREA > (SELECT AVG(FLOOR_AREA)
FROM UNIT X
WHERE UNIT.UNIT_NUMBER = X.UNIT_NUMBER)
;
                 

SELECT
    sec.SECRETARY_NUMBER,
    sec.EMPLOYEE_NUMBER AS SECRETARY_EMPLOYEE,
    sec.MANAGER_NUMBER,
    emp.NAME AS SECRETARY_NAME,
    man.EMPLOYEE_NUMBER AS MANAGER_EMPLOYEE,
    emp2.NAME AS MANAGER_NAME
FROM
    SECRETARY sec
INNER JOIN
    EMPLOYEE emp
ON
    emp.EMPLOYEE_NUMBER = sec.EMPLOYEE_NUMBER
INNER JOIN
    MANAGER man
ON
    man.EMPLOYEE_NUMBER = sec.MANAGER_NUMBER
INNER JOIN
    EMPLOYEE emp2
ON
    emp2.EMPLOYEE_NUMBER = man.EMPLOYEE_NUMBER
;


SELECT
    men.Mentor_ID,
    man.Employee_Number AS MENTOR_EMPLOYEE_NUMBER,
    emp.Name,
    men.Mentee_ID,
    man2.Employee_Number AS MENTEE_EMPLOYEE_NUMBER,
    emp2.Name
FROM MENTOR men
LEFT JOIN
    MANAGER man
ON
    men.MENTOR_ID = man.MANAGER_NUMBER
LEFT JOIN
    MANAGER man2
ON
    men.MENTEE_ID = man2.MANAGER_NUMBER
LEFT JOIN
    EMPLOYEE emp
ON
    man.Employee_Number = emp.Employee_Number
LEFT JOIN
    EMPLOYEE emp2
ON
    man2.Employee_Number = emp2.Employee_Number
;
