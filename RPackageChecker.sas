proc iml;
    submit / R;
      ver = R.version.string
      vdf = data.frame(version = ver)
      pkg = installed.packages()[,c(1,3)]
    endsubmit;
call ImportDataSetFromR("R0_pkg", "pkg");
call ImportDataSetFromR("R0_ver", "vdf");
quit;

data _null_;
set R0_ver;
CALL SYMPUTX("V0",version);
RUN;


TITLE "R Version:  &V0";
proc print data = R0_pkg; run;
