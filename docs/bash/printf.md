# Printf

**tldr**:
The difference is that echo sends a newline at the end of its output. There is no way to "send" an EOF.

---

**more explanation**
Both echo and printf are built-in commands (printf is Bash built-in since v2.0.2, 1998). echo always exits with a 0 status, and simply prints arguments followed by an end of line character on the standard output, while printf allows for definition of a formatting string and gives a non-zero exit status code upon failure.

printf has more control over the output format. It can be used to specify the field width to use for item, as well as various formatting choices for numbers (such as what output base to use, whether to print an exponent, whether to print a sign, and how many digits to print after the decimal point). This is done by supplying the format string, that controls how and where to print the other arguments and has the same syntax as C language (%03d, %e, %+d,...). This means that you must escape the percent symbol when not talking about format (%%).

see: https://unix.stackexchange.com/questions/58310/difference-between-printf-and-echo-in-bash