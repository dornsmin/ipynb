--DB:bdlab2013

--��������ָ�꣺
SELECT
 t2.ST_CLASS_ID,
 t2.ST_CLASS_GRADE_CODE,
 t2.ST_CLASS_CODE,
 t2.ST_CLASS_NAME,
 t3.ST_STUDENT_ID,
 t5.ST_TEST_CATEGORY_CODE,
 t5.ST_TEST_CATEGORY,
 t5.NM_VALUE,
 t5.ST_GRADE
FROM
 DM_SCHOOL t1,
 DM_CLASS t2,
 DM_STUDENT t3,
 DM_STUDENT_EXTEND t4,
 DM_TEST_CATEGORY_RECORD t5
WHERE
 t1.ST_SCHOOL_ID = t2.ST_SCHOOL_ID
AND t2.ST_CLASS_ID = t4.ST_CLASS_ID
AND t3.ST_STUDENT_ID = t4.ST_STUDENT_ID
AND t4.ST_STUDENT_EXTEND_ID = t5.ST_STUDENT_EXTEND_ID
AND t3.ST_SEX = '��'
AND t2.ST_CLASS_GRADE_CODE = '31'
AND t4.ST_YEAR = '2017'
AND t1.ST_NAME = '000080ѧУ'
ORDER BY t3.ST_STUDENT_ID



--��ת��
SELECT
 t3.ST_STUDENT_ID,
 t3.ST_NAME,
 sum(case t5.ST_TEST_CATEGORY when '�λ���' then t5.NM_VALUE else 0 end) '�λ���',
 sum(case t5.ST_TEST_CATEGORY when '����ָ��(BMI)' then t5.NM_VALUE else 0 end) '����ָ��(BMI)',
 sum(case t5.ST_TEST_CATEGORY when '50����' then t5.NM_VALUE else 0 end) '50����',
 sum(case t5.ST_TEST_CATEGORY when '1000����' then t5.NM_VALUE else 0 end) '1000����',
 sum(case t5.ST_TEST_CATEGORY when '������Զ' then t5.NM_VALUE else 0 end) '������Զ',
 sum(case t5.ST_TEST_CATEGORY when '��������' then t5.NM_VALUE else 0 end) '��������',
 sum(case t5.ST_TEST_CATEGORY when '��λ��ǰ��' then t5.NM_VALUE else 0 end) '��λ��ǰ��',
 sum(case t5.ST_TEST_CATEGORY when '�ܷ�' then t5.NM_VALUE else 0 end) '�ܷ�'
FROM
 DM_SCHOOL t1,
 DM_CLASS t2,
 DM_STUDENT t3,
 DM_STUDENT_EXTEND t4,
 DM_TEST_CATEGORY_RECORD t5
WHERE
 t1.ST_SCHOOL_ID = t2.ST_SCHOOL_ID
AND t2.ST_CLASS_ID = t4.ST_CLASS_ID
AND t3.ST_STUDENT_ID = t4.ST_STUDENT_ID
AND t4.ST_STUDENT_EXTEND_ID = t5.ST_STUDENT_EXTEND_ID
AND t3.ST_SEX = '��'
AND t2.ST_CLASS_GRADE_CODE = '31'
AND t4.ST_YEAR = '2017'
AND t5.ST_TEST_CATEGORY_CODE in('BMI', '04', '05', '06', '07', '11', '14', 'sum')
AND t1.ST_NAME = '000080ѧУ'
GROUP BY t3.ST_STUDENT_ID