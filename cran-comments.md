## Title fixed

The title field in the DESCRIPTION file contains nom information beyond the mere
package name

## Non-ASCII characters fixed

Kurt Hornik made me aware of non-ASCII characters in some comments (email, 
2023-04-26). This issue was fixed by

* transliterating all non-ASCII characters, and
* adding the entry `Encoding: UTF-8` to the DESCRIPTION file

## R CMD check results

0 errors | 0 warnings | 0 notes

