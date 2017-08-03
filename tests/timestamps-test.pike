#charset utf8

constant yml = #"
---
canonical: 2001-12-15T02:59:43.1Z
iso8601: 2001-12-14T21:59:43.10-05:00
spaced: 2001-12-14 21:59:43.10 -5
date: 2002-12-14
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.Yaml.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
