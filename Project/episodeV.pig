
-- Load episodeV file
inputFile = LOAD 'hdfs:///user/root/ProjectActivities' USING PigStorage('\t') AS (Name:chararray,Dialogue:chararray);
-- Group By Data using Name
GrpByName = GROUP inputFile BY Name;
-- Genarate result format
CountByName = FOREACH GrpByName GENERATE $0,COUNT($1) as namedialogue;
cnt = ORDER CountByName BY namedialogue DESC;
-- save result into HDFS
STORE cnt INTO 'hdfs:///user/root/episodeVActivity1';
