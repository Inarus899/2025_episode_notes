BEGIN {
    print "<html>"
    print "<head>"
    print "  <title> To Do List </title>"
    print "</head>"
    print "<body>"
    print "  <ul>"
}
{
    print "    <li>"$0"</li>"
}
END {
    print "  </ul>"
    print "</body>"
    print "</html>"
}
