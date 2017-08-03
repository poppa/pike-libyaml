#charset utf8

constant yml = #"
---
canonical: 12345
decimal: +12_345
sexagesimal: 3:25:45
octal: 014
hexadecimal: 0xC3E
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.Yaml.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
