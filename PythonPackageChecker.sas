
proc python;
submit;
 
import importlib.metadata
import pandas as pd
import sys

package_list = [(dist.metadata["Name"], dist.metadata["Version"]) for dist in importlib.metadata.distributions()]

df = pd.DataFrame(package_list)
df.columns = ["Package","Version"]


ds = SAS.df2sd(df.sort_values(by='Package'), 'work.PythonPackages')

pver = sys.version
SAS.symput('PythonVer',pver)

endsubmit;
run;



TITLE "Python Version: &PythonVer";
PROC SQL;
SELECT Package, Version
FROM WORK.PYTHONPACKAGES
ORDER BY Upcase(Package);
QUIT;
