#a)For each student registered in Semester 'I-2001', list SID, sname of 
#the student, and CID of the corresponding course.

select s.sid, sname, cid
from student s, registration r
where s.sid = r.sid and semester = 'I-2001';

#b)Return FID, FNAME of all the faculty members who were qualified 
#to teach course in year 1995.

select distinct fid, fname from faculty f, qualification q
where f.fid = q.fid and extract(year from date_qualified) = 1995;

#c)Display CNAME and CID of all the courses for which Professor 
#Ama has been qualified. Display the results based on descending order of CID

select cname, q.cid from qualification q, faculty f, course c
where q.fid = f.fid and c.cid = q.cid and fname = 'Ama'
order by cid desc;

#d)For each faculty in QUALIFICATION table, return FID and 
# FNAME of the faculty. Display the results based on ascending order of FNAME.

select distinct f.fid, fname from faculty f, qualification q
where f.fid=q.fid
order by fname;

# e)Return SID of those students who are enrolled into 
#‘Syst Analysis’ during semester I-2001.

select sid from registration r, course c 
where r.cid=c.cid and semester = 'I-2001'
and cname = 'Syst Analysis';

#f)Return SID and SNAME of those students who are enrolled 
#into course ‘Syst Analysis’ during semester I-2001.

select s.sid, sname from student s, registration r, course c 
where r.cid=c.cid and s.sid=r.sid
and semester = 'I-2001' and cname = 'Syst Analysis';

#g)Return CName and CID of all the courses those students 
#whose names start with character ‘a’ registered. Return the SNAME of the students as well. 

select cname, c.cid, s.sname from course c, student s, registration r
where c.cid = r.cid and r.sid = s.sid
and sname like 'A%';

#h)Return SID and SNAME of those students who are enrolled 
#into at least one course that professor Berry can teach.

select distinct s.sid, sname 
from student s, faculty f, qualification q, registration r
where s.sid = r.sid  and f.fid = q.fid 
and q.cid = r.cid
and fname = 'Berry';

#i)Return FID and FNAME of all the faculty in FACULTY table. 
#If a faculty can teach, return the CID of all the courses he/she 
#can teach as well.

select f.fid, fname, cid
from faculty f left outer join qualification q on f.fid = q.fid;

#j)Return FID and FNAME of all the faculty in FACULTY table. 
#If a faculty can teach, return the CNAME of all the courses 
#he/she can teach as well.

select f.fid, fname, cname
from faculty f left outer join qualification q on f.fid = q.fid
left outer join course c on c.cid = q.cid;
