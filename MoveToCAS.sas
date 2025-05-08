/* Macro for moving datasets into a CAS library */

%MACRO Move_to_CAS (saslib,sasname,caslib,casname);
proc casutil;
	droptable casdata="&casname" incaslib="&caslib" quiet;
	load data=&saslib..&sasname outcaslib="&caslib"
	casout="&casname" replace;
    promote incaslib="&caslib" casdata="&casname" outcaslib="&caslib";
run;

%MEND;

%Move_to_CAS(sashelp,heart,public,heart);
